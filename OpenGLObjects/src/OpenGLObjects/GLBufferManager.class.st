Class {
	#name : #GLBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'bindings',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-Buffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:03'
}
GLBufferManager >> bindBuffer: bufferOrNil to: targetEnum [

	| assoc |
	assoc := bindings associationAt: targetEnum.
	assoc value == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: targetEnum.
	assoc value: bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:03'
}
GLBufferManager >> bindBuffer: bufferOrNil to: targetEnum during: aBlock [

	| previous |
	previous := bindings at: targetEnum.
	self bindBuffer: bufferOrNil to: targetEnum.
	^ aBlock ensure: [
		self bindBuffer: previous to: targetEnum]
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
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:20'
}
GLBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:21'
}
GLBufferManager >> creationImp: anObject [

	creationImp := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:38'
}
GLBufferManager >> initialize [

	super initialize.
	bindings := Dictionary new.
	GLBuffer targets do: [:targetEnum |
		bindings at: targetEnum put: nil].
	
	mainImp := GLBufferImp new.
	creationImp := GLDirectStateAccessImp new.
	stateAccessImp := GLDirectStateAccessImp new.
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:39'
}
GLBufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:39'
}
GLBufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject.
]
