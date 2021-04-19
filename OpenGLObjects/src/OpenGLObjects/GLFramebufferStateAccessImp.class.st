Class {
	#name : #GLFramebufferStateAccessImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-FrameBuffers',
	#'squeak_changestamp' : ''
}

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:28'
}
GLFramebufferStateAccessImp >> blit: mask from: readFramebuffer bounds: readBounds to: drawFramebuffer bounds: drawBounds filter: filterEnum [

	self subclassResponsibility
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 12:26'
}
GLFramebufferStateAccessImp >> frameBuffer: aFrameBuffer completionStatusFor: targetEnum [

	self subclassResponsibility
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:03'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer attach2DTexture: a2DTexture level: mipMapLevel to: attachmentEnum [

	self subclassResponsibility
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 13:56'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer attachRenderbuffer: aRenderbuffer to: attachmentEnum [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:24'
}
GLFramebufferStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toFloat32Vector4: aFloat32Array [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:24'
}
GLFramebufferStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toIntegerVector4: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:24'
}
GLFramebufferStateAccessImp >> framebuffer: aFrameBuffer clearColorBuffer: drawBufferEnum toUnsignedIntegerVector4: aWordArray [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:24'
}
GLFramebufferStateAccessImp >> framebuffer: aFrameBuffer clearDepthBufferTo: aFloat [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:24'
}
GLFramebufferStateAccessImp >> framebuffer: aFrameBuffer clearStencilBufferTo: anInteger [

	self subclassResponsibility
]
