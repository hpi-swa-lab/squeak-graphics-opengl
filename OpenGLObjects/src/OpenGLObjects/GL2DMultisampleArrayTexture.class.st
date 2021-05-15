Class {
	#name : #GL2DMultisampleArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GL2DMultisampleArrayTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit multisampleArrayTexture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GL2DMultisampleArrayTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit multisampleArrayTexture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GL2DMultisampleArrayTexture class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE_ARRAY
]
