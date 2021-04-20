Class {
	#name : #GLCubeMapTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/14/2021 22:39'
}
GLCubeMapTexture class >> bound [

	^ GLObjectBindings current cubeMapTexture
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 3/15/2021 11:51'
}
GLCubeMapTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current cubeMapTexture: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLCubeMapTexture class >> target [

	^ GL_TEXTURE_CUBE_MAP
]
