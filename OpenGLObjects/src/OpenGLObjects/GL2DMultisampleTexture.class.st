Class {
	#name : #GL2DMultisampleTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:38'
}
GL2DMultisampleTexture class >> bound [

	^ GLObjectBindings current multisampleTexture2D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GL2DMultisampleTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current multisampleTexture2D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GL2DMultisampleTexture class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE
]
