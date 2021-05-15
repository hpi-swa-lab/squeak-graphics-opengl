Class {
	#name : #LOGLBreakoutBall,
	#superclass : #LOGLBreakoutGameObject,
	#instVars : [
		'radius',
		'isStuck',
		'isSticky',
		'isPassthrough'
	],
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 1/8/2021 10:37'
}
LOGLBreakoutBall class >> position: position radius: radius velocity: velocity sprite: sprite [

	^ (self
		position: position
		extent: (radius * 2) asPoint
		sprite: sprite
		color: Color white
		velocity: velocity)
			radius: radius;
			yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 1/9/2021 18:13'
}
LOGLBreakoutBall >> initialize [

	super initialize.
	isStuck := true.
	isSticky := false.
	isPassthrough := false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/9/2021 18:14'
}
LOGLBreakoutBall >> isPassthrough [

	^ isPassthrough
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/9/2021 18:14'
}
LOGLBreakoutBall >> isPassthrough: anObject [

	isPassthrough := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> isSticky [

	^ isSticky
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> isSticky: anObject [

	isSticky := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> isStuck [

	^ isStuck
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> isStuck: anObject [

	isStuck := anObject
]

{
	#category : #movement,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:51'
}
LOGLBreakoutBall >> move: elapsedSeconds width: windowWidth [

	self isStuck ifFalse: [
		| distance |
		distance := velocity * elapsedSeconds.
		position := position + distance.
		
		position x <= 0 ifTrue: [
			velocity := velocity x negated @ velocity y.
			position := 0 @ position y].
		position x + self width >= windowWidth ifTrue: [
			velocity := velocity x negated @ velocity y.
			position := windowWidth - self width @ position y].
		position y <= 0 ifTrue: [
			velocity := velocity x @ velocity y negated.
			position := position x @ 0]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> radius [

	^ radius
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 18:02'
}
LOGLBreakoutBall >> radius: anObject [

	radius := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 1/9/2021 18:14'
}
LOGLBreakoutBall >> resetTo: aPosition velocity: aVelocity [

	position := aPosition.
	velocity := aVelocity.
	isStuck := true.
	isSticky := false.
	isPassthrough := false.
	color := Color white
]
