Class {
	#name : #GL2DMultisampleTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GL2DMultisampleTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit multisampleTexture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GL2DMultisampleTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit multisampleTexture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GL2DMultisampleTexture class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE
]
