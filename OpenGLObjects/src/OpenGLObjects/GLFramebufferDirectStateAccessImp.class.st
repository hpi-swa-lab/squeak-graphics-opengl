Class {
	#name : #GLFramebufferDirectStateAccessImp,
	#superclass : #GLFramebufferStateAccessImp,
	#category : #'OpenGLObjects-FrameBuffers',
	#commentStamp : ''
}

{
	#category : #blitting,
	#timestamp : 'stlu 1/9/2021 14:27'
}
GLFramebufferDirectStateAccessImp >> blit: mask from: readFramebuffer bounds: readBounds to: drawFramebuffer bounds: drawBounds filter: filterEnum [

	GL
		blitNamedFramebuffer: readFramebuffer id
		with: drawFramebuffer id
		with: readBounds left
		with: readBounds top
		with: readBounds right
		with: readBounds bottom
		with: drawBounds left
		with: drawBounds top
		with: drawBounds right
		with: drawBounds bottom
		with: mask
		with: filterEnum
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 12:26'
}
GLFramebufferDirectStateAccessImp >> frameBuffer: aFrameBuffer completionStatusFor: targetEnum [

	^ GL
		checkNamedFramebufferStatus: aFrameBuffer id
		with: targetEnum
]

{
	#category : #attachments,
	#timestamp : 'stlu 1/9/2021 14:03'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer attach2DTexture: a2DTexture level: mipMapLevel to: attachmentEnum [

	GL
		namedFramebufferTexture: aFramebuffer id
		with: attachmentEnum
		with: a2DTexture id
		with: mipMapLevel
]

{
	#category : #attachments,
	#timestamp : 'stlu 3/15/2021 13:15'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer attachRenderbuffer: aRenderbuffer to: attachmentEnum [

	GL
		namedFramebufferRenderbuffer: aFramebuffer id
		with: attachmentEnum
		with: GL_RENDERBUFFER
		with: aRenderbuffer id
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:22'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toFloat32Vector4: aFloat32Array [

	GL
		clearNamedFramebufferfv: aFrameBuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aFloat32Array
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:28'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toIntegerVector4: anIntegerArray [

	GL
		clearNamedFramebufferiv: aFrameBuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: anIntegerArray
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:28'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toUnsignedIntegerVector4: aWordArray [

	GL
		clearNamedFramebufferuiv: aFrameBuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aWordArray
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:23'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFrameBuffer clearDepthBufferTo: aFloat [

	GL
		clearNamedFramebufferfv: aFrameBuffer
		with: GL_DEPTH
		with: GL_NONE
		with: aFloat
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:28'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFrameBuffer clearStencilBufferTo: anInteger [

	GL
		clearNamedFramebufferiv: aFrameBuffer
		with: GL_DEPTH
		with: GL_NONE
		with: anInteger
]
