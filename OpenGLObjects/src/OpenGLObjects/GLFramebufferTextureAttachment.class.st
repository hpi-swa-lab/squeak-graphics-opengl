Class {
	#name : #GLFramebufferTextureAttachment,
	#superclass : #GLFramebufferAttachment,
	#instVars : [
		'texture',
		'level',
		'layer'
	],
	#category : #'OpenGLObjects-Framebuffers'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/8/2021 14:51'
}
GLFramebufferTextureAttachment class >> texture: aTexture level: mipMapLevel layer: textureLayer [

	^ self basicNew setTexture: aTexture level: mipMapLevel layer: textureLayer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:54'
}
GLFramebufferTextureAttachment >> layer [

	^ layer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:54'
}
GLFramebufferTextureAttachment >> level [

	^ level
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:50'
}
GLFramebufferTextureAttachment >> setTexture: aTexture level: mipMapLevel layer: textureLayer [

	texture := aTexture.
	level := mipMapLevel.
	layer := textureLayer.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:54'
}
GLFramebufferTextureAttachment >> texture [

	^ texture
]
