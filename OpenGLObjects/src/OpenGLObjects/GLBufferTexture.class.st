Class {
	#name : #GLBufferTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:39'
}
GLBufferTexture class >> bound [

	^ GLObjectBindings current bufferTexture
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 3/15/2021 11:51'
}
GLBufferTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current bufferTexture: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLBufferTexture class >> target [

	^ GL_TEXTURE_BUFFER
]
