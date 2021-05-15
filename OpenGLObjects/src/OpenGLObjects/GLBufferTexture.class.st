Class {
	#name : #GLBufferTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLBufferTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit bufferTexture
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLBufferTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit bufferTexture: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLBufferTexture class >> target [

	^ GL_TEXTURE_BUFFER
]
