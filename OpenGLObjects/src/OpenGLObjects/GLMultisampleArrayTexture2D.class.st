Class {
	#name : #GLMultisampleArrayTexture2D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLMultisampleArrayTexture2D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit multisampleArrayTexture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLMultisampleArrayTexture2D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit multisampleArrayTexture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:42'
}
GLMultisampleArrayTexture2D class >> target [

	^ GL_TEXTURE_2D_MULTISAMPLE_ARRAY
]