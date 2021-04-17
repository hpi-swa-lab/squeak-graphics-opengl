Class {
	#name : #GL2DMultisampleArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:38'
}
GL2DMultisampleArrayTexture class >> bound [

	^ GLObjectBindings current multisampleArrayTexture2D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:50'
}
GL2DMultisampleArrayTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current multisampleArrayTexture2D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:42'
}
GL2DMultisampleArrayTexture class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE_ARRAY
]
