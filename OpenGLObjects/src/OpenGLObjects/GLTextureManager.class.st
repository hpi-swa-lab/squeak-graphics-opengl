Class {
	#name : #GLTextureManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'textureImageUnits',
		'activeTextureImageUnitIndex',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #'texture image units',
	#'squeak_changestamp' : 'stlu 7/30/2021 02:17'
}
GLTextureManager >> activateTextureImageUnitAt: index [

	mainImp activateTextureImageUnitAt: index.
	activeTextureImageUnitIndex := index.
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
	#'squeak_changestamp' : 'stlu 7/30/2021 00:56'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass [

	| textureImageUnit |
	textureImageUnit := self activeTextureImageUnit.
	(aClass privateGetBindingIn: textureImageUnit) == textureOrNil ifTrue: [^ self].

	mainImp
		bindTexture: textureOrNil
		to: aClass target.
	
	aClass privateSetBindingIn: textureImageUnit to: textureOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/30/2021 00:48'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass at: textureImageUnitIndex [

	| textureImageUnit |
	textureImageUnit := self textureImageUnitAt: textureImageUnitIndex.
	(aClass privateGetBindingIn: textureImageUnit) == textureOrNil ifTrue: [^ self].
	
	mainImp
		bindTexture: textureOrNil
		to: aClass target
		at: textureImageUnitIndex.
	
	aClass privateSetBindingIn: textureImageUnit to: textureOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/30/2021 00:54'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass at: textureImageUnitIndex during: aBlock [

	| previous |
	previous := aClass privateGetBindingIn: (self textureImageUnitAt: textureImageUnitIndex).
	self
		bindTexture: textureOrNil
		ofClass: aClass
		at: textureImageUnitIndex.
	^ aBlock ensure: [
		self
			bindTexture: previous
			ofClass: aClass
			at: textureImageUnitIndex]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/30/2021 00:58'
}
GLTextureManager >> bindTexture: textureOrNil ofClass: aClass during: aBlock [

	| previous |
	previous := aClass privateGetBindingIn: self activeTextureImageUnit.
	self
		bindTexture: textureOrNil
		ofClass: aClass.
	^ aBlock ensure: [
		self
			bindTexture: previous
			ofClass: aClass]
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:17'
}
GLTextureManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/11/2021 14:03'
}
GLTextureManager >> creationImp: anObject [

	creationImp := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:49'
}
GLTextureManager >> initialize [

	super initialize.
	
	activeTextureImageUnitIndex := 0. "zero-indexed"
	self initializeTextureImageUnits.
	
	mainImp := GLTextureImp new.
	creationImp := GLTextureImp new.
	stateAccessImp := GLDirectStateAccessImp new.
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
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/11/2021 14:03'
}
GLTextureManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
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
