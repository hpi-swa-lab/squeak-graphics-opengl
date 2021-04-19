Class {
	#name : #GLRenderbufferDirectStateAccessImp,
	#superclass : #GLRenderbufferStateAccessImp,
	#category : #'OpenGLObjects-FrameBuffers',
	#'squeak_changestamp' : ''
}

{
	#category : #storage,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:13'
}
GLRenderbufferDirectStateAccessImp >> renderbuffer: aRenderbuffer initializeStorage: extent format: internalFormatEnum samples: numSamples [

	GL
		namedRenderbufferStorageMultisample: aRenderbuffer id
		with: numSamples
		with: internalFormatEnum
		with: extent x
		with: extent y
]
