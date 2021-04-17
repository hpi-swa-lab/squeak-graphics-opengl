Class {
	#name : #GLCubeMapArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:39'
}
GLCubeMapArrayTexture class >> bound [

	^ GLObjectBindings current cubeMapArrayTexture
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GLCubeMapArrayTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current cubeMapArrayTexture: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GLCubeMapArrayTexture class >> target [

	^ GL_TEXTURE_CUBE_MAP_ARRAY
]
