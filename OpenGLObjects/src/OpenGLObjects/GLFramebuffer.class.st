Class {
	#name : #GLFramebuffer,
	#superclass : #GLAbstractFramebuffer,
	#instVars : [
		'colorAttachments',
		'depthAttachment',
		'stencilAttachment',
		'defaultExtent',
		'defaultNumberOfLayers',
		'defaultNumberOfSamples'
	],
	#category : #'OpenGLObjects-Framebuffers'
}

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:47'
}
GLFramebuffer >> attachColorRenderbuffer: aRenderbuffer at: colorAttachmentIndex [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		as: GL_COLOR_ATTACHMENT0 + colorAttachmentIndex.
	colorAttachments
		at: colorAttachmentIndex + 1
		put: (GLFramebufferRenderbufferAttachment renderbuffer: aRenderbuffer).
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:48'
}
GLFramebuffer >> attachColorTexture: aTexture level: mipMapLevel at: colorAttachmentIndex [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTexture
		level: mipMapLevel
		as: GL_COLOR_ATTACHMENT0 + colorAttachmentIndex.
	colorAttachments
		at: colorAttachmentIndex + 1
		put: (GLFramebufferTextureAttachment
			texture: aTexture
			level: mipMapLevel
			layer: 0).
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:04'
}
GLFramebuffer >> attachDepthAndStencilRenderbuffer: aRenderbuffer [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		as: GL_DEPTH_STENCIL_ATTACHMENT.
	depthAttachment := stencilAttachment := GLFramebufferRenderbufferAttachment renderbuffer: aRenderbuffer.
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:03'
}
GLFramebuffer >> attachDepthAndStencilTexture: aTexture level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTexture
		level: mipMapLevel
		as: GL_DEPTH_STENCIL_ATTACHMENT.
	depthAttachment := stencilAttachment := GLFramebufferTextureAttachment
		texture: aTexture
		level: mipMapLevel
		layer: 0.
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:55'
}
GLFramebuffer >> attachDepthRenderbuffer: aRenderbuffer [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		as: GL_DEPTH_ATTACHMENT.
	depthAttachment := GLFramebufferRenderbufferAttachment renderbuffer: aRenderbuffer.
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:52'
}
GLFramebuffer >> attachDepthTexture: aTexture level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTexture
		level: mipMapLevel
		as: GL_DEPTH_ATTACHMENT.
	depthAttachment := GLFramebufferTextureAttachment
		texture: aTexture
		level: mipMapLevel
		layer: 0.
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:55'
}
GLFramebuffer >> attachStencilRenderbuffer: aRenderbuffer [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		as: GL_STENCIL_ATTACHMENT.
	stencilAttachment := GLFramebufferRenderbufferAttachment renderbuffer: aRenderbuffer.
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:53'
}
GLFramebuffer >> attachStencilTexture: aTexture level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTexture
		level: mipMapLevel
		as: GL_STENCIL_ATTACHMENT.
	stencilAttachment := GLFramebufferTextureAttachment
		texture: aTexture
		level: mipMapLevel
		layer: 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:15'
}
GLFramebuffer >> defaultExtent [

	^ defaultExtent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:18'
}
GLFramebuffer >> defaultExtent: aPoint [

	manager stateAccessImp
		framebuffer: self
		setParameter: GL_FRAMEBUFFER_DEFAULT_WIDTH
		toInteger: aPoint x;
		framebuffer: self
		setParameter: GL_FRAMEBUFFER_DEFAULT_HEIGHT
		toInteger: aPoint y.
	defaultExtent := aPoint.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:19'
}
GLFramebuffer >> defaultHeight [

	^ defaultExtent y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:23'
}
GLFramebuffer >> defaultNumberOfLayers [

	^ defaultNumberOfLayers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:24'
}
GLFramebuffer >> defaultNumberOfLayers: anInteger [

	manager stateAccessImp
		framebuffer: self
		setParameter: GL_FRAMEBUFFER_DEFAULT_LAYERS
		toInteger: anInteger.
	defaultNumberOfLayers := anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:23'
}
GLFramebuffer >> defaultNumberOfSamples [

	^ defaultNumberOfSamples
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:24'
}
GLFramebuffer >> defaultNumberOfSamples: anInteger [

	manager stateAccessImp
		framebuffer: self
		setParameter: GL_FRAMEBUFFER_DEFAULT_SAMPLES
		toInteger: anInteger.
	defaultNumberOfSamples := anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:18'
}
GLFramebuffer >> defaultWidth [

	^ defaultExtent x
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/7/2021 14:56'
}
GLFramebuffer >> delete [
	
	manager mainImp deleteFramebuffer: self.
	super delete.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:35'
}
GLFramebuffer >> initialize [

	super initialize.
	self initializeAttachmentPoints.
	defaultExtent := 0@0.
	defaultNumberOfLayers := 0.
	defaultNumberOfSamples := 0.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:35'
}
GLFramebuffer >> initializeAttachmentPoints [

	colorAttachments := Array new: GL maxColorAttachments.
]
