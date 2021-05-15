Class {
	#name : #GLTextureBindingImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 5/14/2021 21:02'
}
GLTextureBindingImp >> bindTexture: textureOrNil to: targetEnum [

	GL
		bindTexture: targetEnum
		with: (textureOrNil ifNil: [0] ifNotNil: [textureOrNil id])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 5/14/2021 21:03'
}
GLTextureBindingImp >> bindTexture: textureOrNil to: targetEnum at: textureImageUnitIndex [

	GLTexture
		activateTextureImageUnitAt: textureImageUnitIndex
		during: [
			self bindTexture: textureOrNil to: targetEnum]
]
