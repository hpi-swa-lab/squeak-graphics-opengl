Class {
	#name : #GLRectangleTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:39'
}
GLRectangleTexture class >> bound [

	^ GLObjectBindings current rectangleTexture
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GLRectangleTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current rectangleTexture: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GLRectangleTexture class >> target [

	^ GL_TEXTURE_RECTANGLE
]
