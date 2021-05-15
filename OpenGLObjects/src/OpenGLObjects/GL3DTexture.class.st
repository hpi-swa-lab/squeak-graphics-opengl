Class {
	#name : #GL3DTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GL3DTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit texture3D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GL3DTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit texture3D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GL3DTexture class >> target [

	^ GL_TEXTURE_3D
]
