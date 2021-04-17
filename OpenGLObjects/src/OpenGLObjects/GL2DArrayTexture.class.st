Class {
	#name : #GL2DArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:33'
}
GL2DArrayTexture class >> bound [

	^ GLObjectBindings current arrayTexture2D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:50'
}
GL2DArrayTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current arrayTexture2D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:42'
}
GL2DArrayTexture class >> target [

	^ GL_TEXTURE_2D_ARRAY
]
