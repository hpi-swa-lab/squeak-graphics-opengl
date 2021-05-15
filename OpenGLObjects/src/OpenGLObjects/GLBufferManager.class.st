Class {
	#name : #GLBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'bindings',
		'creationImp'
	],
	#category : #'OpenGLObjects-Buffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:29'
}
GLBufferManager >> bindBuffer: bufferOrNil to: targetEnum [

	| assoc |
	assoc := bindings associationAt: targetEnum.
	assoc value == bufferOrNil ifTrue: [^ self].

	GL
		bindBuffer: targetEnum
		with: (bufferOrNil ifNil: [0] ifNotNil: [bufferOrNil id]).
	assoc value: bufferOrNil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:31'
}
GLBufferManager >> bindBuffer: bufferOrNil to: targetEnum during: aBlock [

	| previous |
	previous := bindings at: targetEnum.
	self bindBuffer: bufferOrNil to: targetEnum.
	^ aBlock ensure: [
		self bindBuffer: previous to: targetEnum.]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:23'
}
GLBufferManager >> bindings [

	^ bindings
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:23'
}
GLBufferManager >> bindings: anObject [

	bindings := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 11:54'
}
GLBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 11:54'
}
GLBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:39'
}
GLBufferManager >> initialize [

	super initialize.
	bindings := Dictionary new.
	GLBuffer targets do: [:targetEnum |
		bindings at: targetEnum put: nil].
	
	creationImp := GLBufferCreationImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:50'
}
GLBufferManager >> isValidID: anInteger [

	^ GL isBuffer: anInteger
]
