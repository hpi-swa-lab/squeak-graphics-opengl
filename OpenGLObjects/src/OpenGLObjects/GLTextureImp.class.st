Class {
	#name : #GLTextureImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 7/30/2021 02:17'
}
GLTextureImp >> activateTextureImageUnitAt: index [

	GL activeTexture: GL_TEXTURE0 + index.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:50'
}
GLTextureImp >> bindTexture: textureOrNil to: targetEnum [

	GL
		bindTexture: targetEnum
		with: (textureOrNil ifNil: [0] ifNotNil: [textureOrNil id]).
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:50'
}
GLTextureImp >> bindTexture: textureOrNil to: targetEnum at: textureImageUnitIndex [

	GLTexture
		activateTextureImageUnitAt: textureImageUnitIndex
		during: [
			self bindTexture: textureOrNil to: targetEnum].
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:13'
}
GLTextureImp >> createTextureIDs: count target: textureTargetEnum [

	| ids |
	ids := IntegerArray new: count.
	self createTextureIDs: count target: textureTargetEnum into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:18'
}
GLTextureImp >> createTextureIDs: count target: textureTargetEnum into: anIntegerArray [

	GL createTextures: textureTargetEnum with: count with: anIntegerArray
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:48'
}
GLTextureImp >> deleteTexture: aTexture [

	GL
		deleteTextures: 1
		with: (WordArray with: aTexture id).
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:06'
}
GLTextureImp >> generateTextureIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateTextureIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:06'
}
GLTextureImp >> generateTextureIDs: count into: anIntegerArray [

	GL genTextures: count with: anIntegerArray
]
