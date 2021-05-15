Class {
	#name : #GLArrayTexture1D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:03'
}
GLArrayTexture1D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit arrayTexture1D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:57'
}
GLArrayTexture1D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit arrayTexture1D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GLArrayTexture1D class >> target [

	^ GL_TEXTURE_1D_ARRAY
]
