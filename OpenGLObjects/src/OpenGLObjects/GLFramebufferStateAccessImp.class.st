Class {
	#name : #GLFramebufferStateAccessImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:28'
}
GLFramebufferStateAccessImp >> blit: mask from: readFramebuffer bounds: readBounds to: drawFramebuffer bounds: drawBounds filter: filterEnum [

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
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer attachRenderbuffer: aRenderbuffer to: attachmentEnum [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toFloat32Vector4: aFloat32Array [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toIntegerVector4: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toUnsignedIntegerVector4: aWordArray [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer clearDepthBufferTo: aFloat [

	self subclassResponsibility
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer clearStencilBufferTo: anInteger [

	self subclassResponsibility
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:34'
}
GLFramebufferStateAccessImp >> framebuffer: aFramebuffer completionStatusFor: targetEnum [

	self subclassResponsibility
]
