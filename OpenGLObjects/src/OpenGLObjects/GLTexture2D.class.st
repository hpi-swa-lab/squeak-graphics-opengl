Class {
	#name : #GLTexture2D,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 14:04'
}
GLTexture2D class >> privateGetBindingIn: aTextureImageUnit [

	^ aTextureImageUnit texture2D
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 5/14/2021 13:58'
}
GLTexture2D class >> privateSetBindingIn: aTextureImageUnit to: aTexture [

	aTextureImageUnit texture2D: aTexture.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 10/29/2020 00:43'
}
GLTexture2D class >> target [

	^ GL_TEXTURE_2D
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 8/27/2021 00:10'
}
GLTexture2D >> asForm [

	| form |
	form := Form extent: self extent depth: 32.
	GL
		getTextureImage: id
		with: 0
		with: GL_BGRA
		with: GL_UNSIGNED_BYTE
		with: form bits byteSize
		with: form bits.
	^ form
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 11/3/2020 15:31'
}
GLTexture2D >> delete [

	GL deleteTextures: 1 with: (IntegerArray with: id)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:43'
}
GLTexture2D >> extent [

	^ self width @ self height
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 13:30'
}
GLTexture2D >> extent: aPoint [

	self boundDuring: [
		GL
			texImage2D: GL_TEXTURE_2D
			with: 0
			with: GL_RGBA
			with: aPoint x truncated
			with: aPoint y truncated
			with: 0
			with: GL_BGRA
			with: GL_UNSIGNED_BYTE
			with: nil.
		GL
			texParameteri: GL_TEXTURE_2D
			with: GL_TEXTURE_MIN_FILTER
			with: GL_LINEAR.
		GL
			texParameteri: GL_TEXTURE_2D
			with: GL_TEXTURE_MAG_FILTER
			with: GL_LINEAR]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/4/2021 22:18'
}
GLTexture2D >> extent: anExtent internalFormat: internalFormatEnum data: aRawBitsArray format: pixelFormatEnum type: pixelDataType [

	self boundDuring: [
		GL
			texImage2D: GL_TEXTURE_2D
			with: 0 "level of detail (0=base image level)"
			with: internalFormatEnum
			with: anExtent x
			with: anExtent y
			with: 0 "must be 0"
			with: pixelFormatEnum
			with: pixelDataType
			with: aRawBitsArray]
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:32'
}
GLTexture2D >> getTextureParameterI: parameter [

	self boundDuring: [
		IntegerArray new: 1 during: [:result |
			GL getTexLevelParameteriv: GL_TEXTURE_2D with: 0 with: parameter with: result.
			^ result first]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:43'
}
GLTexture2D >> height [

	^ self getTextureParameterI: GL_TEXTURE_HEIGHT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/11/2021 14:41'
}
GLTexture2D >> image: aForm [

	self boundDuring: [
		aForm unhibernate.
		self
			extent: aForm extent
			internalFormat: GL_RGBA
			data: (aForm asFormOfDepth: 32) bits
			format: GL_BGRA
			type: GL_UNSIGNED_BYTE]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 13:30'
}
GLTexture2D >> subImage: aForm at: aPoint [

	self boundDuring: [
		GL
			texSubImage2D: GL_TEXTURE_2D
			with: 0
			with: aPoint x
			with: aPoint y
			with: aForm width
			with: aForm height
			with: GL_BGRA
			with: GL_UNSIGNED_BYTE
			with: (aForm asFormOfDepth: 32) bits]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:44'
}
GLTexture2D >> width [

	^ self getTextureParameterI: GL_TEXTURE_WIDTH
]
