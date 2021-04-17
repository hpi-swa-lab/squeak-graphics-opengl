Class {
	#name : #GLTexture,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:54'
}
GLTexture class >> allocate: n in: anIntegerArray [

	GL genTextures: n with: anIntegerArray
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:46'
}
GLTexture class >> privateSetBinding: aTexture [

	self subclassResponsibility
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 11:40'
}
GLTexture class >> unbind [

	GL bindTexture: self target with: GL_NONE.
	self privateSetBinding: nil
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:12'
}
GLTexture >> baseLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_BASE_LEVEL
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> baseLevel: anInteger [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_BASE_LEVEL
		toInteger: anInteger
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 11:54'
}
GLTexture >> bind [

	GL bindTexture: self class target with: id.
	self class privateSetBinding: self
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:13'
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
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> borderColor: aColor [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_BORDER_COLOR
		toFloatArray: { aColor red . aColor green . aColor blue . aColor alpha } asFloat32Array
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 11:53'
}
GLTexture >> boundDuring: aBlock [

	| previous |
	(previous := self class bound) = self ifTrue: [^ aBlock value].
	self bind.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbind]
			ifNotNil: [previous bind]]
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:32'
}
GLTexture >> comparisonFunction [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_COMPARE_FUNC
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:32'
}
GLTexture >> comparisonFunction: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_COMPARE_FUNC
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:31'
}
GLTexture >> comparisonMode [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_COMPARE_MODE
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:31'
}
GLTexture >> comparisonMode: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_COMPARE_MODE
		toInteger: enum
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> depthStencilMode [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_DEPTH_STENCIL_TEXTURE_MODE
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> depthStencilMode: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_DEPTH_STENCIL_TEXTURE_MODE
		toInteger: enum
]

{
	#category : #mipmaps,
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> generateMipmap [

	self stateAccessImp generateMipmap: self
]

{
	#category : #'image loading',
	#timestamp : 'stlu 1/4/2021 13:52'
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
	#timestamp : 'stlu 1/4/2021 13:19'
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
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> imageFormatCompatibilityType [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_IMAGE_FORMAT_COMPATIBILITY_TYPE
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:13'
}
GLTexture >> immutableFormat [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_IMMUTABLE_FORMAT
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:14'
}
GLTexture >> immutableLevels [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_IMMUTABLE_LEVELS
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:13'
}
GLTexture >> isAllocated [

	^ GL isTexture: id
]

{
	#category : #testing,
	#timestamp : 'stlu 1/4/2021 14:14'
}
GLTexture >> isComplete [

	self isMipmapComplete ifFalse: [^ false].
	self isCubemapComplete ifFalse: [^ false].
	self isImageFormatComplete ifFalse: [^ false].
	^ true
]

{
	#category : #testing,
	#timestamp : 'stlu 10/29/2020 12:16'
}
GLTexture >> isTexture [

	^ true
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:14'
}
GLTexture >> lodBias [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_LOD_BIAS
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:14'
}
GLTexture >> lodBias: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_LOD_BIAS
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:14'
}
GLTexture >> magnificationFilter [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MAG_FILTER
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:14'
}
GLTexture >> magnificationFilter: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAG_FILTER
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxAnisotropy [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MAX_ANISOTROPY
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxAnisotropy: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_ANISOTROPY
		toFloat: aFloat
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MAX_LEVEL
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLevel: anInteger [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_LEVEL
		toInteger: anInteger
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLod [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MAX_LOD
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> maxLod: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MAX_LOD
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> minLod [

	^ self stateAccessImp
		texture: self
		getFloatParameter: GL_TEXTURE_MIN_LOD
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> minLod: aFloat [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MIN_LOD
		toFloat: aFloat
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> minificationFilter [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_MIN_FILTER
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> minificationFilter: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_MIN_FILTER
		toInteger: enum
]

{
	#category : #imps,
	#timestamp : 'stlu 1/4/2021 10:12'
}
GLTexture >> stateAccessImp [

	^ GLTextureDirectStateAccessImp new
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleA [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_A
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleA: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_A
		toInteger: enum
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleB [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_B
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleB: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_B
		toInteger: enum
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleG [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_G
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleG: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_G
		toInteger: enum
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleR [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_R
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleR: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_R
		toInteger: enum
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 08:01'
}
GLTexture >> swizzleR: rEnum g: gEnum b: bEnum a: aEnum [

	self swizzleRGBA: { rEnum . gEnum . bEnum . aEnum } asWordArray
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleRGBA [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_SWIZZLE_RGBA
		size: 4
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> swizzleRGBA: aWordArray [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_SWIZZLE_RGBA
		toUnsignedIntegerArray: aWordArray
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/15/2021 13:16'
}
GLTexture >> target [

	^ self class target
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewMinLayer [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_MIN_LAYER
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewMinLevel [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_MIN_LEVEL
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewNumLayers [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_NUM_LAYERS
]

{
	#category : #'texture parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> viewNumLevels [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_VIEW_NUM_LEVELS
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapR [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_R
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapR: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_R
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapS [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_S
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapS: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_S
		toInteger: enum
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapT [

	^ self stateAccessImp
		texture: self
		getIntegerParameter: GL_TEXTURE_WRAP_T
]

{
	#category : #'sampling parameters',
	#timestamp : 'stlu 1/4/2021 10:22'
}
GLTexture >> wrapT: enum [

	self stateAccessImp
		texture: self
		setParameter: GL_TEXTURE_WRAP_T
		toInteger: enum
]
