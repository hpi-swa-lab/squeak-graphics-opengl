Class {
	#name : #LOGLBreakoutPowerUp,
	#superclass : #LOGLBreakoutGameObject,
	#instVars : [
		'type',
		'duration',
		'isActivated'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/9/2021 15:38'
}
LOGLBreakoutPowerUp class >> type: typeSymbol color: aColor duration: secs position: position sprite: aTexture [

	^ (self
		position: position
		extent: 60@20
		sprite: aTexture
		color: aColor
		velocity: 0@150)
			type: typeSymbol;
			duration: secs;
			yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> duration [

	^ duration
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> duration: anObject [

	duration := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/9/2021 15:40'
}
LOGLBreakoutPowerUp >> initialize [

	super initialize.
	isActivated := false
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> isActivated [

	^ isActivated
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> isActivated: anObject [

	isActivated := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> type [

	^ type
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/9/2021 18:02'
}
LOGLBreakoutPowerUp >> type: anObject [

	type := anObject
]
