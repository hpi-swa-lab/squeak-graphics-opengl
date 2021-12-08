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
	#'squeak_changestamp' : 'stlu 12/8/2021 15:38'
}
GLFramebuffer >> attachColorRenderbuffer: aRenderbufferOrNil at: colorAttachmentIndex [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbufferOrNil
		as: GL_COLOR_ATTACHMENT0 + colorAttachmentIndex.
	colorAttachments
		at: colorAttachmentIndex + 1
		put: (aRenderbufferOrNil ifNotNil: [
			GLFramebufferRenderbufferAttachment renderbuffer: aRenderbufferOrNil]).
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:41'
}
GLFramebuffer >> attachColorTexture: aTextureOrNil level: mipMapLevel at: colorAttachmentIndex [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTextureOrNil
		level: mipMapLevel
		as: GL_COLOR_ATTACHMENT0 + colorAttachmentIndex.
	colorAttachments
		at: colorAttachmentIndex + 1
		put: (aTextureOrNil ifNotNil: [
			GLFramebufferTextureAttachment
				texture: aTextureOrNil
				level: mipMapLevel
				layer: 0]).
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:43'
}
GLFramebuffer >> attachDepthAndStencilRenderbuffer: aRenderbufferOrNil [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbufferOrNil
		as: GL_DEPTH_STENCIL_ATTACHMENT.
	depthAttachment := stencilAttachment := aRenderbufferOrNil ifNotNil: [
		GLFramebufferRenderbufferAttachment renderbuffer: aRenderbufferOrNil].
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:42'
}
GLFramebuffer >> attachDepthAndStencilTexture: aTextureOrNil level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTextureOrNil
		level: mipMapLevel
		as: GL_DEPTH_STENCIL_ATTACHMENT.
	depthAttachment := stencilAttachment := aTextureOrNil ifNotNil: [
		GLFramebufferTextureAttachment
			texture: aTextureOrNil
			level: mipMapLevel
			layer: 0].
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:43'
}
GLFramebuffer >> attachDepthRenderbuffer: aRenderbufferOrNil [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbufferOrNil
		as: GL_DEPTH_ATTACHMENT.
	depthAttachment := aRenderbufferOrNil ifNotNil: [
		GLFramebufferRenderbufferAttachment renderbuffer: aRenderbufferOrNil].
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:42'
}
GLFramebuffer >> attachDepthTexture: aTextureOrNil level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTextureOrNil
		level: mipMapLevel
		as: GL_DEPTH_ATTACHMENT.
	depthAttachment := aTextureOrNil ifNotNil: [
		GLFramebufferTextureAttachment
			texture: aTextureOrNil
			level: mipMapLevel
			layer: 0].
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:43'
}
GLFramebuffer >> attachStencilRenderbuffer: aRenderbufferOrNil [

	manager stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbufferOrNil
		as: GL_STENCIL_ATTACHMENT.
	stencilAttachment := aRenderbufferOrNil ifNotNil: [
		GLFramebufferRenderbufferAttachment renderbuffer: aRenderbufferOrNil].
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 12/8/2021 15:42'
}
GLFramebuffer >> attachStencilTexture: aTextureOrNil level: mipMapLevel [

	manager stateAccessImp
		framebuffer: self
		attachTexture: aTextureOrNil
		level: mipMapLevel
		as: GL_STENCIL_ATTACHMENT.
	stencilAttachment := aTextureOrNil ifNotNil: [
		GLFramebufferTextureAttachment
			texture: aTextureOrNil
			level: mipMapLevel
			layer: 0].
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
