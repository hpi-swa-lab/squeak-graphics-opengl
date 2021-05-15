Class {
	#name : #GLCubeMapTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLCubeMapTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit cubeMapTexture
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLCubeMapTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit cubeMapTexture: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLCubeMapTexture class >> target [

	^ GL_TEXTURE_CUBE_MAP
]
