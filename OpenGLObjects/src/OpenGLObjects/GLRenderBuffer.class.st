Class {
	#name : #GLRenderBuffer,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:22'
}
GLRenderBuffer class >> bound [

	^ GLObjectBindings current renderBuffer
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:48'
}
GLRenderBuffer class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createRenderBufferIDs: count)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:48'
}
GLRenderBuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:48'
}
GLRenderBuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateRenderBufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:49'
}
GLRenderBuffer class >> manager [

	^ GL objectState renderBufferManager
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:23'
}
GLRenderBuffer class >> unbind [

	GL bindRenderbuffer: GL_RENDERBUFFER with: GL_NONE.
	GLObjectBindings current renderBuffer: nil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:20'
}
GLRenderBuffer >> bind [

	GL bindRenderbuffer: GL_RENDERBUFFER with: id.
	GLObjectBindings current renderBuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:17'
}
GLRenderBuffer >> boundDuring: aBlock [

	| previous |
	(previous := self class bound) = self ifTrue: [^ aBlock value].
	self bind.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbind]
			ifNotNil: [previous bind]]
]

{
	#category : #storage,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:15'
}
GLRenderBuffer >> initializeStorage: extent format: internalFormatEnum samples: numSamples [

	self stateAccessImp
		renderbuffer: self
		initializeStorage: extent
		format: internalFormatEnum
		samples: numSamples
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:33'
}
GLRenderBuffer >> stateAccessImp [

	^ manager stateAccessImp
]
