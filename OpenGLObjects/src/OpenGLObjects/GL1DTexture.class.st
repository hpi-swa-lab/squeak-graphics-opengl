Class {
	#name : #GL1DTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GL1DTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit texture1D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GL1DTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit texture1D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GL1DTexture class >> target [

	^ GL_TEXTURE_1D
]
