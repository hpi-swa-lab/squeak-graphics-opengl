Class {
	#name : #LOGLBreakoutParticle,
	#superclass : #Object,
	#instVars : [
		'position',
		'velocity',
		'color',
		'life'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> color [

	^ color
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> color: anObject [

	color := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 15:22'
}
LOGLBreakoutParticle >> initialize [

	super initialize.
	position := 0.0@0.0.
	velocity := 0.0@0.0.
	color := Color white.
	life := 0.0
]

{
	#category : #testing,
	#timestamp : 'stlu 1/6/2021 11:18'
}
LOGLBreakoutParticle >> isAlive [

	^ life > 0.0
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> life [

	^ life
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> life: anObject [

	life := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> position [

	^ position
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> position: anObject [

	position := anObject
]

{
	#category : #updating,
	#timestamp : 'stlu 1/6/2021 12:02'
}
LOGLBreakoutParticle >> respawn: aGameObject offset: offset [

	| randomOffset randomColor |
	randomOffset := (0 to: 99) atRandom - 50 / 10.
	randomColor := (0 to: 99) atRandom / 100 + 0.5.
	position := aGameObject position + randomOffset + offset.
	color := Color r: randomColor g: randomColor b: randomColor.
	life := 1.0.
	velocity := aGameObject velocity * 0.1
]

{
	#category : #updating,
	#timestamp : 'stlu 1/8/2021 15:13'
}
LOGLBreakoutParticle >> update: elpasedSecs [

	life := life - elpasedSecs.
	self isAlive ifTrue: [
		position := position - (velocity * elpasedSecs).
		color := color alpha: color alpha - (elpasedSecs * 2.5)]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> velocity [

	^ velocity
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:13'
}
LOGLBreakoutParticle >> velocity: anObject [

	velocity := anObject
]
