Class {
	#name : #GLMultisampleTexture2D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLMultisampleTexture2D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit multisampleTexture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLMultisampleTexture2D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit multisampleTexture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLMultisampleTexture2D class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE
]
