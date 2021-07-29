Class {
	#name : #GLTextureManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'textureImageUnits',
		'activeTextureImageUnitIndex',
		'creationImp',
		'stateAccessImp',
		'bindingImp'
	],
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/14/2021 22:39'
}
GLTextureManager >> activateTextureImageUnitAt: index [

	GL activeTexture: GL_TEXTURE0 + index.
	activeTextureImageUnitIndex := index
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/14/2021 14:43'
}
GLTextureManager >> activateTextureImageUnitAt: index during: aBlock [

	| previous |
	activeTextureImageUnitIndex = index ifTrue: [^ aBlock value].
	previous := activeTextureImageUnitIndex.
	self activateTextureImageUnitAt: index.
	^ aBlock ensure: [
		self activateTextureImageUnitAt: previous]
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/14/2021 14:44'
}
GLTextureManager >> activeTextureImageUnit [

	^ self textureImageUnitAt: activeTextureImageUnitIndex
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/13/2021 10:17'
}
GLTextureManager >> activeTextureImageUnitIndex [

	^ activeTextureImageUnitIndex
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:18'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass [

	bindingImp
		bindTexture: textureOrNil
		to: aClass target.
	aClass
		privateSetBindingIn: self activeTextureImageUnit
		to: textureOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:16'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass at: textureImageUnitIndex [

	bindingImp
		bindTexture: textureOrNil
		to: aClass target
		at: textureImageUnitIndex.
	aClass
		privateSetBindingIn: (self textureImageUnitAt: textureImageUnitIndex)
		to: textureOrNil.
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:37'
}
GLTextureManager >> bindingImp [

	^ bindingImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:37'
}
GLTextureManager >> bindingImp: anObject [

	bindingImp := anObject
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:17'
}
GLTextureManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/11/2021 14:03'
}
GLTextureManager >> creationImp: anObject [

	creationImp := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:15'
}
GLTextureManager >> initialize [

	super initialize.
	
	activeTextureImageUnitIndex := 0. "zero-indexed"
	self initializeTextureImageUnits.
	
	creationImp := GLTextureImp new.
	stateAccessImp := GLDirectStateAccessImp new.
	bindingImp := GLTextureImp new.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/14/2021 20:49'
}
GLTextureManager >> initializeTextureImageUnits [

	textureImageUnits := Array new: GL maxCombinedTextureImageUnits. "one-indexed"
	1 to: textureImageUnits size do: [:index |
		textureImageUnits
			at: index
			put: GLTextureImageUnit new].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:53'
}
GLTextureManager >> isValidID: anInteger [

	^ GL isTexture: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/11/2021 14:03'
}
GLTextureManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/11/2021 14:03'
}
GLTextureManager >> stateAccessImp: anObject [

	stateAccessImp := anObject.
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/14/2021 14:44'
}
GLTextureManager >> textureImageUnitAt: index [

	^ textureImageUnits at: index + 1
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/11/2021 14:17'
}
GLTextureManager >> textureImageUnits [

	^ textureImageUnits
]

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 5/11/2021 14:17'
}
GLTextureManager >> textureImageUnits: anObject [

	textureImageUnits := anObject
]
