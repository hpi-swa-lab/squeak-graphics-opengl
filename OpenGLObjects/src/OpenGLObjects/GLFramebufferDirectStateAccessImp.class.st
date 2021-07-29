Class {
	#name : #GLFramebufferDirectStateAccessImp,
	#superclass : #GLFramebufferStateAccessImp,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:27'
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
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:03'
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
	#'squeak_changestamp' : 'stlu 3/15/2021 13:15'
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
	#'squeak_changestamp' : 'stlu 7/26/2021 13:35'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toFloat32Vector4: aFloat32Array [

	GL
		clearNamedFramebufferfv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aFloat32Array
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:35'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toIntegerVector4: anIntegerArray [

	GL
		clearNamedFramebufferiv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: anIntegerArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:35'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toUnsignedIntegerVector4: aWordArray [

	GL
		clearNamedFramebufferuiv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aWordArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:35'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer clearDepthBufferTo: aFloat [

	GL
		clearNamedFramebufferfv: aFramebuffer
		with: GL_DEPTH
		with: GL_NONE
		with: aFloat
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:35'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer clearStencilBufferTo: anInteger [

	GL
		clearNamedFramebufferiv: aFramebuffer
		with: GL_DEPTH
		with: GL_NONE
		with: anInteger
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:34'
}
GLFramebufferDirectStateAccessImp >> framebuffer: aFramebuffer completionStatusFor: targetEnum [

	^ GL
		checkNamedFramebufferStatus: aFramebuffer id
		with: targetEnum
]
