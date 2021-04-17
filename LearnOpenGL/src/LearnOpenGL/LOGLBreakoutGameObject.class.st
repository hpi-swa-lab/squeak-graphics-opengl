"
Container object for holding all state relevant for a single game object entity.
Each object in the game likely needs the minimal of state as described within GameObject.
"
Class {
	#name : #LOGLBreakoutGameObject,
	#superclass : #Object,
	#instVars : [
		'position',
		'extent',
		'velocity',
		'color',
		'rotation',
		'isSolid',
		'isDestroyed',
		'sprite'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : 'stlu 1/6/2021 12:08'
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/7/2021 15:14'
}
LOGLBreakoutGameObject class >> position: position extent: extent sprite: aTexture [

	^ self
		position: position
		extent: extent
		sprite: aTexture
		color: Color white
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/7/2021 15:00'
}
LOGLBreakoutGameObject class >> position: position extent: extent sprite: aTexture color: aColor [

	^ self
		position: position
		extent: extent
		sprite: aTexture
		color: aColor
		velocity: 0@0
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/6/2021 12:13'
}
LOGLBreakoutGameObject class >> position: position extent: extent sprite: aTexture color: aColor velocity: velocity [

	^ self new
		position: position;
		extent: extent;
		sprite: aTexture;
		color: aColor;
		velocity: velocity;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 09:54'
}
LOGLBreakoutGameObject >> bounds [

	^ position extent: extent
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/8/2021 10:01'
}
LOGLBreakoutGameObject >> collidesWithObject: otherObject [

	^ self bounds intersects: otherObject bounds
]

{
	#category : #collisions,
	#timestamp : 'stlu 1/8/2021 11:47'
}
LOGLBreakoutGameObject >> collisionWithBall: ball [

	| halfExtent centerDistance clamped distance |
	halfExtent := self bounds extent / 2.
	centerDistance := ball bounds center - self bounds center.
	clamped := centerDistance
					min: halfExtent
					max: halfExtent negated.
	distance := centerDistance negated + clamped.
	
	distance isZero ifTrue: [^ nil].
	^ distance r < ball radius
		ifTrue: [distance]
		ifFalse: [nil]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> color [

	^ color
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> color: anObject [

	color := anObject
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/6/2021 12:11'
}
LOGLBreakoutGameObject >> draw: aRenderer [

	aRenderer
		drawSprite: sprite
		position: position
		extent: extent
		rotation: rotation
		color: color
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> extent [

	^ extent
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> extent: anObject [

	extent := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 17:41'
}
LOGLBreakoutGameObject >> height [

	^ self extent y
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> initialize [

	super initialize.
	position := 0.0@0.0.
	extent := 1.0@1.0.
	velocity := 0.0@0.0.
	color := Color white.
	rotation := 0.0.
	isSolid := false.
	isDestroyed := false
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> isDestroyed [

	^ isDestroyed
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> isDestroyed: anObject [

	isDestroyed := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> isSolid [

	^ isSolid
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> isSolid: anObject [

	isSolid := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> position [

	^ position
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> position: anObject [

	position := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> rotation [

	^ rotation
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> rotation: anObject [

	rotation := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> sprite [

	^ sprite
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> sprite: anObject [

	sprite := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> velocity [

	^ velocity
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 12:10'
}
LOGLBreakoutGameObject >> velocity: anObject [

	velocity := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 17:41'
}
LOGLBreakoutGameObject >> width [

	^ self extent x
]
