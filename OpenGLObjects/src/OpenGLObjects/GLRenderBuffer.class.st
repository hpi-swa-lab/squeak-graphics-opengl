Class {
	#name : #GLRenderBuffer,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-FrameBuffers',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 1/8/2021 18:10'
}
GLRenderBuffer class >> allocate: n in: anIntegerArray [

	GL genRenderbuffers: n with: anIntegerArray
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:22'
}
GLRenderBuffer class >> bound [

	^ GLObjectBindings current renderBuffer
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:23'
}
GLRenderBuffer class >> unbind [

	GL bindRenderbuffer: GL_RENDERBUFFER with: GL_NONE.
	GLObjectBindings current renderBuffer: nil
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:20'
}
GLRenderBuffer >> bind [

	GL bindRenderbuffer: GL_RENDERBUFFER with: id.
	GLObjectBindings current renderBuffer: self
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:17'
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
	#timestamp : 'stlu 1/9/2021 14:15'
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
	#timestamp : 'stlu 1/9/2021 14:14'
}
GLRenderBuffer >> stateAccessImp [

	^ GLRenderbufferDirectStateAccessImp new
]
