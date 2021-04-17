Class {
	#name : #LOGLBreakout,
	#superclass : #LOGLTemplate,
	#instVars : [
		'extent',
		'renderer',
		'levels',
		'levelIndex',
		'state',
		'player',
		'ball',
		'keys',
		'keysProcessed',
		'lives',
		'particles',
		'projection',
		'effects',
		'shakeTime',
		'powerUps'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'power ups',
	#timestamp : 'stlu 1/9/2021 18:39'
}
LOGLBreakout >> activatePowerUp: typeSymbol [

	typeSymbol = #speed ifTrue: [
		ball velocity: ball velocity * 1.2].
	typeSymbol = #sticky ifTrue: [
		ball isSticky: true.
		player color: (Color r: 1.0 g: 0.5 b: 1.0)].
	typeSymbol = #passthrough ifTrue: [
		ball isPassthrough: true.
		ball color: (Color r: 1.0 g: 0.5 b: 0.5)].
	typeSymbol = #increase ifTrue: [
		player extent: player extent + (50@0)].
	typeSymbol = #confuse ifTrue: [
		effects chaos ifFalse: [
			effects confusion: true]].
	typeSymbol = #chaos ifTrue: [
		effects confusion ifFalse: [
			effects chaos: true]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 18:38'
}
LOGLBreakout >> ballRadius [

	^ 12.5
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/8/2021 11:12'
}
LOGLBreakout >> directionOf: aPoint [

	| max bestMatch norm dot |
	norm := aPoint normalized.
	
	max := norm dotProduct: 0.0 @ 1.0.
	bestMatch := #up.
	
	(dot := norm dotProduct: 1.0 @ 0.0) > max ifTrue: [
		max := dot.
		bestMatch := #right].
	
	(dot := norm dotProduct: 0.0 @ -1.0) > max ifTrue: [
		max := dot.
		bestMatch := #down].
	
	(dot := norm dotProduct: -1.0 @ 0.0) > max ifTrue: [
		max := dot.
		bestMatch := #left].
	
	^ bestMatch
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/9/2021 18:37'
}
LOGLBreakout >> doBrickCollisions [

	self level bricks do: [:brick |
		brick isDestroyed ifFalse: [
			(brick collisionWithBall: ball) ifNotNil: [:collision |
				| dir penetration |
				self shake. "shake always for now"
				dir := self directionOf: collision.
				brick isSolid
					ifTrue: [self shake]
					ifFalse: [
						brick isDestroyed: true.
						self spawnPowerUps: brick].
				(ball isPassthrough and: [brick isSolid not]) ifFalse: [
					(dir = #left or: [dir = #right])
						ifTrue: [
							ball velocity: ball velocity * (-1 @ 1).
							penetration := ball radius - collision x abs.
							dir = #right ifTrue: [penetration := penetration negated].
							ball position: ball position + (penetration @ 0)]
						ifFalse: [
							ball velocity: ball velocity * (1 @ -1).
							penetration := ball radius - collision y abs.
							dir = #up ifTrue: [penetration := penetration negated].
							ball position: ball position + (0 @ penetration)]]]]]
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/9/2021 18:22'
}
LOGLBreakout >> doCollisions [

	self doBrickCollisions.
	self doPowerUpCollisions.
	self doPlayerCollision
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/9/2021 18:31'
}
LOGLBreakout >> doPlayerCollision [

	ball isStuck ifTrue: [^ self].
	(player collisionWithBall: ball) ifNotNil: [:collision |
		| distance percentage strength newVelocity |
		distance := ball position x - player bounds center x.
		percentage := distance / (player extent x / 2).
		strength := 2.
		newVelocity := (self initialBallVelocity x * percentage * strength)
						@ ball velocity y abs negated.
		ball velocity: newVelocity normalized * ball velocity r.
		
		ball isStuck: ball isSticky]
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/9/2021 18:25'
}
LOGLBreakout >> doPowerUpCollisions [

	powerUps do: [:powerUp |
		powerUp isDestroyed ifFalse: [
			powerUp position y >= self height ifTrue: [
				powerUp isDestroyed: true].
			(powerUp collidesWithObject: player) ifTrue: [
				self activatePowerUp: powerUp type.
				powerUp isDestroyed: true.
				powerUp isActivated: true]]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 17:51'
}
LOGLBreakout >> extent [

	^ extent
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 17:51'
}
LOGLBreakout >> extent: aPoint [

	extent := aPoint
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 18:47'
}
LOGLBreakout >> height [

	^ self extent y
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 18:39'
}
LOGLBreakout >> initialBallVelocity [

	^ 100 @ -350
]

{
	#category : #testing,
	#timestamp : 'stlu 1/7/2021 16:13'
}
LOGLBreakout >> isActive [

	^ state = #active
]

{
	#category : #inputs,
	#timestamp : 'stlu 1/7/2021 17:36'
}
LOGLBreakout >> isKeyPressed: key [

	^ keys
		at: key
		ifAbsent: [false]
]

{
	#category : #testing,
	#timestamp : 'stlu 1/8/2021 15:16'
}
LOGLBreakout >> isModal [

	^ false
]

{
	#category : #'power ups',
	#timestamp : 'stlu 1/9/2021 18:40'
}
LOGLBreakout >> isOtherPowerUpActive: typeSymbol [

	^ powerUps anySatisfy: [:powerUp |
		powerUp isActivated and: [powerUp type = typeSymbol]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 10:32'
}
LOGLBreakout >> level [

	^ levels at: levelIndex
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/9/2021 18:47'
}
LOGLBreakout >> loseLife [

	lives := lives - 1.
	lives <= 0 ifTrue: [
		self resetLevel].
	self resetPlayer.
	self resetBall.
	self resetPowerUps
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 16:35'
}
LOGLBreakout >> playerExtent [

	^ 100 @ 20
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 16:47'
}
LOGLBreakout >> playerVelocity [

	^ 500
]

{
	#category : #inputs,
	#timestamp : 'stlu 2/12/2021 00:46'
}
LOGLBreakout >> processInput: elapsedSecs [

	self isActive ifTrue: [
		| distance |
		distance := self playerVelocity * elapsedSecs.
		(self isKeyPressed: GLFW_KEY_A) ifTrue: [
			player position x > 0 ifTrue: [
				player position: player position - (distance @ 0).
				ball isStuck ifTrue: [
					ball position: ball position - (distance @ 0)]]].
		(self isKeyPressed: GLFW_KEY_D) ifTrue: [
			player position x <= (self extent x - player width) ifTrue: [
				player position: player position + (distance @ 0).
				ball isStuck ifTrue: [
					ball position: ball position + (distance @ 0)]]].
		(self isKeyPressed: GLFW_KEY_SPACE) ifTrue: [
			ball isStuck: false]]
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/8/2021 11:52'
}
LOGLBreakout >> processPriority [

	^ self isModal
		ifTrue: [Processor userInterruptPriority]
		ifFalse: [Processor userBackgroundPriority]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 13:58'
}
LOGLBreakout >> projection [

	^ projection ifNil: [
		projection := Matrix4x4 ortho: (0@0 corner: self extent) near: -1.0 far: 1.0]
]

{
	#category : #rendering,
	#timestamp : 'stlu 4/15/2021 12:09'
}
LOGLBreakout >> render [

	| resources |
	resources := LOGLBreakoutResourceManager instance.
	
	GL clearColor: Color black.
	GL clear: GL_COLOR_BUFFER_BIT.
	
	self isActive ifTrue: [
		effects beginRender.
			renderer
				drawSprite: (resources getTexture: 'background')
				position: 0@0
				extent: self extent.
			self level draw: renderer.
			player draw: renderer.
			powerUps do: [:powerUp |
				powerUp isDestroyed ifFalse: [
					powerUp draw: renderer]].
			particles draw.
			ball draw: renderer.
		effects endRender.
		effects render: lastFrameTime]
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/7/2021 12:59'
}
LOGLBreakout >> render: deltaSecs [

	self updateGame: deltaSecs.
	self render
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/9/2021 18:48'
}
LOGLBreakout >> resetBall [

	| ballOffset ballRadius |
	ballRadius := self ballRadius.
	ballOffset := (player width / 2 - ballRadius) @ (ballRadius * -2).
	ball
		resetTo: player position + ballOffset
		velocity: self initialBallVelocity
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/8/2021 12:25'
}
LOGLBreakout >> resetLevel [

	self level reset.
	lives := 3
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/9/2021 18:48'
}
LOGLBreakout >> resetPlayer [

	| playerPosition playerExtent |
	playerExtent := self playerExtent.
	playerPosition := (extent - playerExtent) * (0.5 @ 1).
	player
		position: playerPosition;
		extent: playerExtent;
		color: Color white
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/9/2021 18:53'
}
LOGLBreakout >> resetPowerUps [

	effects chaos: false.
	effects confusion: false.
	ball isPassthrough: false.
	ball isSticky: false
]

{
	#category : #setup,
	#timestamp : 'stlu 1/9/2021 18:11'
}
LOGLBreakout >> setUp [

	extent := window extent.
	lives := 3.
	shakeTime := 0.0.
	powerUps := OrderedCollection new.
	GL enable: GL_BLEND.
	GL blendFunc: GL_SRC_ALPHA with: GL_ONE_MINUS_SRC_ALPHA.
	self setUpResources.
	self setUpRenderering.
	self setUpLevels.
	self setUpPlayer.
	self setUpInputHandling.
	state := #active
]

{
	#category : #setup,
	#timestamp : 'stlu 2/12/2021 00:46'
}
LOGLBreakout >> setUpInputHandling [

	keys := Dictionary new.
	
	window keyCallback: [:w :key :scancode :action :mods |
		(key = GLFW_KEY_ESCAPE and: [action = GLFW_PRESS]) ifTrue: [
			window shouldClose: true].
		(key between: 0 and: 1024) ifTrue: [
			action = GLFW_PRESS ifTrue: [keys at: key put: true].
			action = GLFW_RELEASE ifTrue: [keys at: key put: false]]]
]

{
	#category : #setup,
	#timestamp : 'stlu 1/7/2021 16:22'
}
LOGLBreakout >> setUpLevels [

	| levelExtent |
	levelExtent := self extent / (1 @ 2).
	levels := LOGLBreakoutLevel levels collect: [:levelArray |
				LOGLBreakoutLevel
					fromArray: levelArray
					extent: levelExtent].
	
	levelIndex := 1
]

{
	#category : #setup,
	#timestamp : 'stlu 1/7/2021 18:44'
}
LOGLBreakout >> setUpPlayer [

	| extent playerPosition playerExtent ballRadius ballOffset resources |
	resources := LOGLBreakoutResourceManager instance.
	extent := self extent.
	playerExtent := self playerExtent.
	playerPosition := (extent - playerExtent) * (0.5 @ 1).
	player := LOGLBreakoutGameObject
				position: playerPosition
				extent: playerExtent
				sprite: (resources getTexture: 'paddle').
	
	ballRadius := self ballRadius.
	ballOffset := (player width / 2 - ballRadius) @ (ballRadius * -2).
	ball := LOGLBreakoutBall
			position: playerPosition + ballOffset
			radius: ballRadius
			velocity: self initialBallVelocity
			sprite: (resources getTexture: 'face')
]

{
	#category : #setup,
	#timestamp : 'stlu 1/8/2021 18:06'
}
LOGLBreakout >> setUpRenderering [

	renderer := LOGLBreakoutSpriteRenderer new.
	renderer projection: self projection.
	
	particles := LOGLBreakoutParticleGenerator
					texture: (LOGLBreakoutResourceManager getTexture: 'particle')
					amount: 500.
	particles projection: self projection.
	
	effects := LOGLBreakoutPostProcessor extent: self extent
]

{
	#category : #setup,
	#timestamp : 'stlu 1/9/2021 17:47'
}
LOGLBreakout >> setUpResources [

	| resources |
	resources := LOGLBreakoutResourceManager instance.
	resources
		loadTexture: LOGLImages background as: 'background';
		loadTexture: LOGLImages awesomeface as: 'face';
		loadTexture: LOGLImages block as: 'block';
		loadTexture: LOGLImages solidBlock as: 'block_solid';
		loadTexture: LOGLImages paddle as: 'paddle';
		loadTexture: LOGLImages particle as: 'particle';
		loadTexture: LOGLImages speedPowerUp as: 'powerup_speed';
		loadTexture: LOGLImages stickyPowerUp as: 'powerup_sticky';
		loadTexture: LOGLImages passthroughPowerUp as: 'powerup_passthrough';
		loadTexture: LOGLImages increasePowerUp as: 'powerup_increase';
		loadTexture: LOGLImages confusePowerUp as: 'powerup_confuse';
		loadTexture: LOGLImages chaosPowerUp as: 'powerup_chaos'
]

{
	#category : #effects,
	#timestamp : 'stlu 1/9/2021 14:54'
}
LOGLBreakout >> shake [

	shakeTime := 0.05.
	effects shake: true
]

{
	#category : #'power ups',
	#timestamp : 'stlu 1/9/2021 17:51'
}
LOGLBreakout >> spawnPowerUps: aBrick [

	| resources |
	resources := LOGLBreakoutResourceManager instance.
	(75 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #speed
							color: (Color r: 0.5 g: 0.5 b: 0.5)
							duration: 0.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_speed'))].
	(75 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #sticky
							color: (Color r: 1.0 g: 0.5 b: 1.0)
							duration: 20.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_sticky'))].
	(75 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #passthrough
							color: (Color r: 0.5 g: 1.0 b: 0.5)
							duration: 10.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_passthrough'))].
	(75 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #increase
							color: (Color r: 1.0 g: 0.6 b: 0.4)
							duration: 0.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_increase'))].
	(15 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #confuse
							color: (Color r: 1.0 g: 0.3 b: 0.3)
							duration: 15.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_confuse'))].
	(15 atRandom = 1) ifTrue: [
		powerUps add: (LOGLBreakoutPowerUp
							type: #chaos
							color: (Color r: 0.9 g: 0.25 b: 0.25)
							duration: 15.0
							position: aBrick position
							sprite: (resources getTexture: 'powerup_chaos'))]
]

{
	#category : #'game state',
	#timestamp : 'stlu 1/9/2021 18:44'
}
LOGLBreakout >> updateGame: elapsedSecs [

	ball move: elapsedSecs width: self width.
	self doCollisions.
	particles update: elapsedSecs object: ball new: 2 offset: ball extent / 2.
	self updatePowerUps: elapsedSecs.
	shakeTime > 0.0 ifTrue: [
		shakeTime := shakeTime - elapsedSecs.
		shakeTime <= 0.0 ifTrue: [
			effects shake: false]].
	ball position y >= self height ifTrue: [self loseLife]
]

{
	#category : #'power ups',
	#timestamp : 'stlu 1/9/2021 18:38'
}
LOGLBreakout >> updatePowerUps: elapsedSecs [

	powerUps do: [:powerUp |
		powerUp position: powerUp position + (powerUp velocity * elapsedSecs).
		powerUp isActivated ifTrue: [
			powerUp duration: powerUp duration - elapsedSecs.
			powerUp duration <= 0.0 ifTrue: [
				powerUp isActivated: false.
				powerUp type = #sticky ifTrue: [
					(self isOtherPowerUpActive: #sticky) ifFalse: [
						ball isSticky: false.
						player color: Color white]].
				powerUp type = #passthrough ifTrue: [
					(self isOtherPowerUpActive: #passthrough) ifFalse: [
						ball isPassthrough: false.
						ball color: Color white]].
				powerUp type = #confuse ifTrue: [
					(self isOtherPowerUpActive: #confuse) ifFalse: [
						effects confusion: false]].
				powerUp type = #chaos ifTrue: [
					(self isOtherPowerUpActive: #chaos) ifFalse: [
						effects chaos: false]]]]].
	
	powerUps := powerUps reject: [:powerUp |
					powerUp isDestroyed and: [powerUp isActivated not]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 18:47'
}
LOGLBreakout >> width [

	^ self extent x
]
