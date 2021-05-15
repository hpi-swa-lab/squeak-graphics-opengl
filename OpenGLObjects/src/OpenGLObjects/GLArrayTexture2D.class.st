Class {
	#name : #GLArrayTexture2D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLArrayTexture2D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit arrayTexture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLArrayTexture2D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit arrayTexture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GLArrayTexture2D class >> target [

	^ GL_TEXTURE_2D_ARRAY
]
