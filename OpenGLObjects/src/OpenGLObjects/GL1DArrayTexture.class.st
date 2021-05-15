Class {
	#name : #GL1DArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:03'
}
GL1DArrayTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit arrayTexture1D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:57'
}
GL1DArrayTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit arrayTexture1D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GL1DArrayTexture class >> target [

	^ GL_TEXTURE_1D_ARRAY
]
