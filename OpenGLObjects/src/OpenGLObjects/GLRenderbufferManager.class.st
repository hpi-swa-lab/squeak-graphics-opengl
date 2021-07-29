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
	#'squeak_changestamp' : 'stlu 7/26/2021 13:49'
}
GLRenderbufferManager >> bindRenderbuffer: renderbufferOrNil [

	GL
		bindRenderbuffer: GL_RENDERBUFFER
		with: (renderbufferOrNil ifNil: [0] ifNotNil: [renderbufferOrNil id]).
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
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderbufferManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderbufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:47'
}
GLRenderbufferManager >> initialize [

	super initialize.
	creationImp := GLRenderbufferCreationImp new.
	stateAccessImp := GLRenderbufferDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLRenderbufferManager >> isValidID: anInteger [

	^ GL isRenderbuffer: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderbufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderbufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]
