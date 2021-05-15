Class {
	#name : #GLTextureImageUnit,
	#superclass : #Object,
	#instVars : [
		'arrayTexture1D',
		'texture1D',
		'arrayTexture2D',
		'multisampleArrayTexture2D',
		'multisampleTexture2D',
		'texture2D',
		'texture3D',
		'bufferTexture',
		'cubeMapArrayTexture',
		'cubeMapTexture',
		'rectangleTexture'
	],
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/14/2021 17:02'
}
GLTextureImageUnit class >> default: aTexture [

	^ self new
		setAllTo: aTexture;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> arrayTexture1D [

	^ arrayTexture1D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> arrayTexture1D: anObject [

	arrayTexture1D := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> arrayTexture2D [

	^ arrayTexture2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> arrayTexture2D: anObject [

	arrayTexture2D := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> bufferTexture [

	^ bufferTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> bufferTexture: anObject [

	bufferTexture := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> cubeMapArrayTexture [

	^ cubeMapArrayTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> cubeMapArrayTexture: anObject [

	cubeMapArrayTexture := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> cubeMapTexture [

	^ cubeMapTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> cubeMapTexture: anObject [

	cubeMapTexture := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> multisampleArrayTexture2D [

	^ multisampleArrayTexture2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> multisampleArrayTexture2D: anObject [

	multisampleArrayTexture2D := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> multisampleTexture2D [

	^ multisampleTexture2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> multisampleTexture2D: anObject [

	multisampleTexture2D := anObject
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 5/14/2021 22:33'
}
GLTextureImageUnit >> printOn: aStream [

	aStream nextPutAll: '[ '.
	1 to: self class instSize do: [:index |
		(self instVarAt: index) ifNotNil: [:binding |
			aStream
				nextPutAll: (self class instVarNameForIndex: index);
				nextPutAll: '->';
				print: binding;
				space]].
	aStream nextPutAll: ']'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> rectangleTexture [

	^ rectangleTexture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> rectangleTexture: anObject [

	rectangleTexture := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/14/2021 17:02'
}
GLTextureImageUnit >> setAllTo: aTexture [

	1 to: self class instSize do: [:index |
		self instVarAt: index put: aTexture]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture1D [

	^ texture1D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture1D: anObject [

	texture1D := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture2D [

	^ texture2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture2D: anObject [

	texture2D := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture3D [

	^ texture3D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/13/2021 10:14'
}
GLTextureImageUnit >> texture3D: anObject [

	texture3D := anObject
]
