Class {
	#name : #GLTexture,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:04'
}
GLTexture class >> activateTextureImageUnitAt: index [

	self manager activateTextureImageUnitAt: index
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:04'
}
GLTexture class >> activateTextureImageUnitAt: index during: aBlock [

	self manager activateTextureImageUnitAt: index during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:03'
}
GLTexture class >> bound [

	^ self privateGetBindingIn: self manager activeTextureImageUnit
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:03'
}
GLTexture class >> boundAt: textureImageUnitIndex [

	^ self privateGetBindingIn: (self manager textureImageUnitAt: textureImageUnitIndex)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:15'
}
GLTexture class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createTextureIDs: count target: self target)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:11'
}
GLTexture class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 13:11'
}
GLTexture class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateTextureIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:16'
}
GLTexture class >> manager [

	^ GL objectState textureManager
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:02'
}
GLTexture class >> privateGetBindingIn: aTextureImageUnit [

	^ self subclassResponsibility
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:57'
}
GLTexture class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 13:12'
}
GLTexture class >> target [

	self subclassResponsibility
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:19'
}
GLTexture class >> unbind [

	self manager
		bindTexture: nil
		ofClass: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:18'
}
GLTexture class >> unbindAt: textureImageUnitIndex [

	self manager
		bindTexture: nil
		ofClass: self
		at: textureImageUnitIndex
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:12'
}
GLTexture >> baseLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_BASE_LEVEL
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> baseLevel: anInteger [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_BASE_LEVEL
		toInteger: anInteger
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:20'
}
GLTexture >> bind [

	manager
		bindTexture: self
		ofClass: self class
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:20'
}
GLTexture >> bindAt: textureImageUnitIndex [

	manager
		bindTexture: self
		ofClass: self class
		at: textureImageUnitIndex
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> borderColor [

	| rgba |
	rgba := self stateAccessImp
				texture: self
				getFloatParameter: GL_TEXTURE_BORDER_COLOR
				size: 4.
	^ Color fromArray: rgba
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> borderColor: aColor [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_BORDER_COLOR
		toFloatArray: { aColor red . aColor green . aColor blue . aColor alpha } asFloat32Array
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:22'
}
GLTexture >> boundAt: textureImageUnitIndex during: aBlock [

	| previous |
	(previous := self class boundAt: textureImageUnitIndex) = self ifTrue: [^ aBlock value].
	self bindAt: textureImageUnitIndex.
	^ aBlock ensure: [
		manager
			bindTexture: previous "could be nil"
			ofClass: self class
			at: textureImageUnitIndex]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:22'
}
GLTexture >> boundDuring: aBlock [

	| previous |
	(previous := self class bound) = self ifTrue: [^ aBlock value].
	self bind.
	^ aBlock ensure: [
		manager
			bindTexture: previous "could be nil"
			ofClass: self class]
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:32'
}
GLTexture >> comparisonFunction [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_COMPARE_FUNC
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:32'
}
GLTexture >> comparisonFunction: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_COMPARE_FUNC
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:31'
}
GLTexture >> comparisonMode [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_COMPARE_MODE
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:31'
}
GLTexture >> comparisonMode: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_COMPARE_MODE
		toInteger: enum
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> depthStencilMode [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_DEPTH_STENCIL_TEXTURE_MODE
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> depthStencilMode: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_DEPTH_STENCIL_TEXTURE_MODE
		toInteger: enum
]

{
	#category : #mipmaps,
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> generateMipmap [

	self stateAccessImp generateMipmap: self
]

{
	#category : #'image loading',
	#'squeak_changestamp' : 'stlu 1/4/2021 13:52'
}
GLTexture >> imageData: aRawBitsArray level: lodNumber extent: extent interalFormat: internalFormat format: format type: type [

	GL
		texImage2D: self target
		with: lodNumber
		with: internalFormat
		with: extent x
		with: extent y
		with: 0
		with: format
		with: type
		with: aRawBitsArray
]

{
	#category : #'image loading',
	#'squeak_changestamp' : 'stlu 1/4/2021 13:19'
}
GLTexture >> imageForm: aForm [

	| form |
	form := aForm asFormOfDepth: 32.
	GL
		texImage2D: GL_TEXTURE_2D
		with: 0
		with: GL_RGBA
		with: form width
		with: form height
		with: 0
		with: GL_BGRA
		with: GL_UNSIGNED_BYTE
		with: form bits
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> imageFormatCompatibilityType [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_IMAGE_FORMAT_COMPATIBILITY_TYPE
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:13'
}
GLTexture >> immutableFormat [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_IMMUTABLE_FORMAT
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:14'
}
GLTexture >> immutableLevels [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_IMMUTABLE_LEVELS
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 1/4/2021 14:14'
}
GLTexture >> isComplete [

	self isMipmapComplete ifFalse: [^ false].
	self isCubemapComplete ifFalse: [^ false].
	self isImageFormatComplete ifFalse: [^ false].
	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:16'
}
GLTexture >> isTexture [

	^ true
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:14'
}
GLTexture >> lodBias [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_LOD_BIAS
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:14'
}
GLTexture >> lodBias: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_LOD_BIAS
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:14'
}
GLTexture >> magnificationFilter [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MAG_FILTER
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:14'
}
GLTexture >> magnificationFilter: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAG_FILTER
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxAnisotropy [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MAX_ANISOTROPY
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxAnisotropy: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_ANISOTROPY
		toFloat: aFloat
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MAX_LEVEL
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLevel: anInteger [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_LEVEL
		toInteger: anInteger
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLod [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MAX_LOD
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLod: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_LOD
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> minLod [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MIN_LOD
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> minLod: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MIN_LOD
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> minificationFilter [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MIN_FILTER
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> minificationFilter: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MIN_FILTER
		toInteger: enum
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/11/2021 13:00'
}
GLTexture >> stateAccessImp [

	^ self manager stateAccessImp
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleA [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_A
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleA: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_A
		toInteger: enum
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleB [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_B
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleB: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_B
		toInteger: enum
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleG [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_G
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleG: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_G
		toInteger: enum
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleR [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_R
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleR: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_R
		toInteger: enum
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 08:01'
}
GLTexture >> swizzleR: rEnum g: gEnum b: bEnum a: aEnum [

	self swizzleRGBA: { rEnum . gEnum . bEnum . aEnum } asWordArray
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleRGBA [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_RGBA
		size: 4
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleRGBA: aWordArray [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_RGBA
		toUnsignedIntegerArray: aWordArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/15/2021 13:16'
}
GLTexture >> target [

	^ self class target
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewMinLayer [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_MIN_LAYER
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewMinLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_MIN_LEVEL
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewNumLayers [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_NUM_LAYERS
]

{
	#category : #'texture parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewNumLevels [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_NUM_LEVELS
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapR [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_R
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapR: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_R
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapS [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_S
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapS: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_S
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapT [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_T
]

{
	#category : #'sampling parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapT: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_T
		toInteger: enum
]
