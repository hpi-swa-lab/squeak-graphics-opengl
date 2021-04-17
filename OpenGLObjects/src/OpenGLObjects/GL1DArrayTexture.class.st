Class {
	#name : #GL1DArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:32'
}
GL1DArrayTexture class >> bound [

	^ GLObjectBindings current arrayTexture1D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:50'
}
GL1DArrayTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current arrayTexture1D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:42'
}
GL1DArrayTexture class >> target [

	^ GL_TEXTURE_1D_ARRAY
]
