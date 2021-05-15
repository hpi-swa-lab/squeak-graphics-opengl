Class {
	#name : #GLRenderBuffer,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:14'
}
GLRenderBuffer class >> bound [

	^ self manager boundRenderBuffer
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
	#'squeak_changestamp' : 'stlu 5/15/2021 15:14'
}
GLRenderBuffer class >> unbind [

	self manager bindRenderBuffer: nil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:11'
}
GLRenderBuffer >> bind [

	manager bindRenderBuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:13'
}
GLRenderBuffer >> boundDuring: aBlock [

	^ manager bindRenderBuffer: self during: aBlock
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
