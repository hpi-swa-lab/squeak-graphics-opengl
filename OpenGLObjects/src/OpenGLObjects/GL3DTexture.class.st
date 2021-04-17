Class {
	#name : #GL3DTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:39'
}
GL3DTexture class >> bound [

	^ GLObjectBindings current texture3D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GL3DTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current texture3D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GL3DTexture class >> target [

	^ GL_TEXTURE_3D
]
