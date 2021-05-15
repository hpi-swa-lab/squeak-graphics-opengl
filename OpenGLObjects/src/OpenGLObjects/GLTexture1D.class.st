Class {
	#name : #GLTexture1D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLTexture1D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit texture1D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLTexture1D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit texture1D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GLTexture1D class >> target [

	^ GL_TEXTURE_1D
]
