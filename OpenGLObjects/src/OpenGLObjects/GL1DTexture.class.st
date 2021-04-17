Class {
	#name : #GL1DTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:32'
}
GL1DTexture class >> bound [

	^ GLObjectBindings current texture1D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:49'
}
GL1DTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current texture1D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:42'
}
GL1DTexture class >> target [

	^ GL_TEXTURE_1D
]
