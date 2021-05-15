Class {
	#name : #GLTexture3D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLTexture3D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit texture3D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLTexture3D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit texture3D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLTexture3D class >> target [

	^ GL_TEXTURE_3D
]
