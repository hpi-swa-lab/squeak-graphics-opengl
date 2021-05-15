Class {
	#name : #GLRenderBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderBufferManager >> initialize [

	super initialize.
	creationImp := GLRenderBufferCreationImp new.
	stateAccessImp := GLRenderbufferDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLRenderBufferManager >> isValidID: anInteger [

	^ GL isRenderbuffer: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderBufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:32'
}
GLRenderBufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]
