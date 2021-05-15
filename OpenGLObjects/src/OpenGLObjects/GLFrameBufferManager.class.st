Class {
	#name : #GLFrameBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:18'
}
GLFrameBufferManager >> initialize [

	super initialize.
	creationImp := GLFrameBufferCreationImp new.
	stateAccessImp := GLFramebufferDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:51'
}
GLFrameBufferManager >> isValidID: anInteger [

	^ GL isFramebuffer: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFrameBufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFrameBufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]
