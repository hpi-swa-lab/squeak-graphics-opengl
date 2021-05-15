Class {
	#name : #GLCubeMapArrayTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLCubeMapArrayTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit cubeMapArrayTexture
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLCubeMapArrayTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit cubeMapArrayTexture: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLCubeMapArrayTexture class >> target [

	^ GL_TEXTURE_CUBE_MAP_ARRAY
]
