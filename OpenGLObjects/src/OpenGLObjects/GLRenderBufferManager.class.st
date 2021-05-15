Class {
	#name : #GLRenderBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'boundRenderBuffer',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:10'
}
GLRenderBufferManager >> bindRenderBuffer: renderBufferOrNil [

	GL
		bindRenderbuffer: GL_RENDERBUFFER
		with: (renderBufferOrNil ifNil: [0] ifNotNil: [renderBufferOrNil id]).
	boundRenderBuffer := renderBufferOrNil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:14'
}
GLRenderBufferManager >> bindRenderBuffer: renderBufferOrNil during: aBlock [

	| previous |
	boundRenderBuffer == renderBufferOrNil ifTrue: [^ aBlock value].
	previous := boundRenderBuffer.
	self bindRenderBuffer: renderBufferOrNil.
	^ aBlock ensure: [
		self bindRenderBuffer: previous]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:08'
}
GLRenderBufferManager >> boundRenderBuffer [

	^ boundRenderBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:08'
}
GLRenderBufferManager >> boundRenderBuffer: anObject [

	boundRenderBuffer := anObject
]

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
