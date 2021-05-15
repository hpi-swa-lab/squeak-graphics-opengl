Class {
	#name : #GLTextureCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:13'
}
GLTextureCreationImp >> createTextureIDs: count target: textureTargetEnum [

	| ids |
	ids := IntegerArray new: count.
	self createTextureIDs: count target: textureTargetEnum into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:18'
}
GLTextureCreationImp >> createTextureIDs: count target: textureTargetEnum into: anIntegerArray [

	GL createTextures: textureTargetEnum with: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:06'
}
GLTextureCreationImp >> generateTextureIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateTextureIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:06'
}
GLTextureCreationImp >> generateTextureIDs: count into: anIntegerArray [

	GL genTextures: count with: anIntegerArray
]
