Class {
	#name : #GLRenderbufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'stateAccessImp',
		'boundRenderbuffer'
	],
	#category : #'OpenGLObjects-Renderbuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:38'
}
GLRenderbufferManager >> bindRenderbuffer: renderbufferOrNil [

	boundRenderbuffer == renderbufferOrNil ifTrue: [^ self].

	mainImp bindRenderbuffer: renderbufferOrNil.
	
	boundRenderbuffer := renderbufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:49'
}
GLRenderbufferManager >> bindRenderbuffer: renderbufferOrNil during: aBlock [

	| previous |
	boundRenderbuffer == renderbufferOrNil ifTrue: [^ aBlock value].
	previous := boundRenderbuffer.
	self bindRenderbuffer: renderbufferOrNil.
	^ aBlock ensure: [
		self bindRenderbuffer: previous]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:48'
}
GLRenderbufferManager >> boundRenderbuffer [

	^ boundRenderbuffer
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderbufferManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderbufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:46'
}
GLRenderbufferManager >> initialize [

	super initialize.
	
	mainImp := GLRenderbufferImp new.
	creationImp := GLRenderbufferImp new.
	stateAccessImp := GLDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLRenderbufferManager >> isValidID: anInteger [

	^ GL isRenderbuffer: anInteger
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderbufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderbufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]
