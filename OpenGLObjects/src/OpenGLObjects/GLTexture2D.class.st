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
	#category : #binding,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:31'
}
GLTexture2D >> asForm [

	| bufSize data |
	bufSize := self extent area * 4.
	data := ByteArray new: bufSize.
	GL
		getTextureImage: id
		with: 0
		with: GL_BGRA
		with: GL_UNSIGNED_INT_8_8_8_8
		with: bufSize
		with: data.
	^ Form
		extent: self extent
		depth: 32
		bits: ((Bitmap new: bufSize)
			copyFromByteArray: data;
			yourself)
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
	#'squeak_changestamp' : 'stlu 11/3/2020 15:32'
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
		GL checkForError.
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
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLTexture2D >> image: aForm [

	self image: aForm minFilter: GL_LINEAR magFilter: GL_LINEAR
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 16:30'
}
GLTexture2D >> image: aForm minFilter: anEnum magFilter: anEnum2 [

	self boundDuring: [
			GL checkForError.
			GL
				texImage2D: GL_TEXTURE_2D
				with: 0
				with: GL_RGBA
				with: aForm width
				with: aForm height
				with: 0
				with: GL_BGRA
				with: GL_UNSIGNED_BYTE
				with: (aForm asFormOfDepth: 32) bits.
			GL checkForError.
			GL
				texParameteri: GL_TEXTURE_2D
				with: GL_TEXTURE_MIN_FILTER
				with: anEnum.
			GL
				texParameteri: GL_TEXTURE_2D
				with: GL_TEXTURE_MAG_FILTER
				with: anEnum]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:32'
}
GLTexture2D >> subImage: aForm at: aPoint [

	self boundDuring: [
		GL checkForError.
		GL
			texSubImage2D: GL_TEXTURE_2D
			with: 0
			with: aPoint x
			with: aPoint y
			with: aForm width
			with: aForm height
			with: GL_BGRA
			with: GL_UNSIGNED_BYTE
			with: (aForm asFormOfDepth: 32) bits.
		GL checkForError]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:44'
}
GLTexture2D >> width [

	^ self getTextureParameterI: GL_TEXTURE_WIDTH
]