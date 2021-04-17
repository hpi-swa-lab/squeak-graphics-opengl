Class {
	#name : #GL2DTexture,
	#superclass : #GLTexture,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:38'
}
GL2DTexture class >> bound [

	^ GLObjectBindings current texture2D
]

{
	#category : #private,
	#timestamp : 'stlu 3/15/2021 11:51'
}
GL2DTexture class >> privateSetBinding: aTexture [

	GLObjectBindings current texture2D: aTexture.
]

{
	#category : #binding,
	#timestamp : 'stlu 10/29/2020 00:43'
}
GL2DTexture class >> target [

	^ GL_TEXTURE_2D
]

{
	#category : #binding,
	#timestamp : 'stlu 11/3/2020 15:31'
}
GL2DTexture >> asForm [

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
	#timestamp : 'stlu 11/3/2020 15:31'
}
GL2DTexture >> delete [

	GL deleteTextures: 1 with: (IntegerArray with: id)
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 12:43'
}
GL2DTexture >> extent [

	^ self width @ self height
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/3/2020 15:32'
}
GL2DTexture >> extent: aPoint [

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
	#timestamp : 'stlu 11/3/2020 15:32'
}
GL2DTexture >> getTextureParameterI: parameter [

	self boundDuring: [
		IntegerArray new: 1 during: [:result |
			GL getTexLevelParameteriv: GL_TEXTURE_2D with: 0 with: parameter with: result.
			^ result first]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 12:43'
}
GL2DTexture >> height [

	^ self getTextureParameterI: GL_TEXTURE_HEIGHT
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GL2DTexture >> image: aForm [

	self image: aForm minFilter: GL_LINEAR magFilter: GL_LINEAR
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 16:30'
}
GL2DTexture >> image: aForm minFilter: anEnum magFilter: anEnum2 [

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
	#timestamp : 'stlu 11/3/2020 15:32'
}
GL2DTexture >> subImage: aForm at: aPoint [

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
	#timestamp : 'stlu 10/26/2020 12:44'
}
GL2DTexture >> width [

	^ self getTextureParameterI: GL_TEXTURE_WIDTH
]
