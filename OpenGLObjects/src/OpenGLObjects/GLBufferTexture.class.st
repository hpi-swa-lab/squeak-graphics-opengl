Class {
	#name : #GLBufferTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:39'
}
GLBufferTexture class >> bound [

	^ GLObjectBindings current bufferTexture
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GLBufferTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current bufferTexture: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GLBufferTexture class >> target [

	^ GL_TEXTURE_BUFFER
]
