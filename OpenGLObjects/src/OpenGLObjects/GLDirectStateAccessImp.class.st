Class {
	#name : #GLDirectStateAccessImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:12'
}
GLDirectStateAccessImp >> blit: mask from: readFramebuffer bounds: readBounds to: drawFramebuffer bounds: drawBounds filter: filterEnum [

	GL
		blitNamedFramebuffer: readFramebuffer id
		with: drawFramebuffer id
		with: readBounds left
		with: readBounds top
		with: readBounds right
		with: readBounds bottom
		with: drawBounds left
		with: drawBounds top
		with: drawBounds right
		with: drawBounds bottom
		with: mask
		with: filterEnum
]

{
	#category : #buffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:38'
}
GLDirectStateAccessImp >> createBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createBufferIDs: count into: ids.
	^ ids
]

{
	#category : #buffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:38'
}
GLDirectStateAccessImp >> createBufferIDs: count into: anIntegerArray [

	GL createBuffers: count with: anIntegerArray.
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:21'
}
GLDirectStateAccessImp >> createFramebufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createFramebufferIDs: count into: ids.
	^ ids
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:21'
}
GLDirectStateAccessImp >> createFramebufferIDs: count into: anIntegerArray [

	GL createFramebuffers: count with: anIntegerArray.
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:03'
}
GLDirectStateAccessImp >> disableVertexAttribute: aVertexAttribute [

	GL
		disableVertexArrayAttrib: aVertexAttribute vertexArray id
		with: aVertexAttribute location
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:03'
}
GLDirectStateAccessImp >> enableVertexAttribute: aVertexAttribute [

	GL
		enableVertexArrayAttrib: aVertexAttribute vertexArray id
		with: aVertexAttribute location
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:31'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer attachRenderbuffer: aRenderbuffer as: attachmentEnum [

	GL
		namedFramebufferRenderbuffer: aFramebuffer id
		with: attachmentEnum
		with: GL_RENDERBUFFER
		with: aRenderbuffer id
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 12/8/2021 14:42'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer attachTexture: aTexture level: mipMapLevel as: attachmentEnum [

	GL
		namedFramebufferTexture: aFramebuffer id
		with: attachmentEnum
		with: aTexture id
		with: mipMapLevel.
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:12'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toFloat32Vector4: aFloat32Array [

	GL
		clearNamedFramebufferfv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aFloat32Array
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:13'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toIntegerVector4: anIntegerArray [

	GL
		clearNamedFramebufferiv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: anIntegerArray
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:13'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer clearColorBuffer: drawBufferEnum toUnsignedIntegerVector4: aWordArray [

	GL
		clearNamedFramebufferuiv: aFramebuffer id
		with: GL_COLOR
		with: drawBufferEnum
		with: aWordArray
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:13'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer clearDepthBufferTo: aFloat [

	GL
		clearNamedFramebufferfv: aFramebuffer
		with: GL_DEPTH
		with: GL_NONE
		with: aFloat
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:13'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer clearStencilBufferTo: anInteger [

	GL
		clearNamedFramebufferiv: aFramebuffer
		with: GL_DEPTH
		with: GL_NONE
		with: anInteger
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:10'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer completenessStatusFor: targetEnum [

	^ GL
		checkNamedFramebufferStatus: aFramebuffer id
		with: targetEnum
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:11'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer getIntegerParameter: parameterEnum [

	| result |
	result := IntegerArray new: 1.
	GL
		getNamedFramebufferParameteriv: aFramebuffer id
		with: parameterEnum
		with: result.
	^ result first
]

{
	#category : #framebuffers,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:14'
}
GLDirectStateAccessImp >> framebuffer: aFramebuffer setParameter: parameterEnum toInteger: anInteger [

	GL
		namedFramebufferParameteri: aFramebuffer id
		with: parameterEnum
		with: anInteger.
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:05'
}
GLDirectStateAccessImp >> generateMipmap: aTexture [

	GL generateTextureMipmap: aTexture id
]

{
	#category : #buffers,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:03'
}
GLDirectStateAccessImp >> initBuffer: aBuffer data: rawBitsOrNil size: byteSize usage: usageEnum [

	GL
		namedBufferData: aBuffer id
		with: byteSize
		with: rawBitsOrNil
		with: usageEnum.
]

{
	#category : #buffers,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:49'
}
GLDirectStateAccessImp >> invalidateData: aBuffer [

	GL invalidateBufferData: aBuffer id.
]

{
	#category : #renderbuffers,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:09'
}
GLDirectStateAccessImp >> renderbuffer: aRenderbuffer initializeStorage: extent format: internalFormatEnum samples: numSamples [

	GL
		namedRenderbufferStorageMultisample: aRenderbuffer id
		with: numSamples
		with: internalFormatEnum
		with: extent x
		with: extent y
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:28'
}
GLDirectStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum [

	^ (self texture: aTexture getFloatParameter: parameterEnum size: 1) first
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:05'
}
GLDirectStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum size: numElements [

	| result |
	result := FloatArray new: numElements.
	GL
		getTextureParameterfv: aTexture id
		with: parameterEnum
		with: result.
	^ result
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:28'
}
GLDirectStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum [

	^ (self texture: aTexture getIntegerParameter: parameterEnum size: 1) first
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:05'
}
GLDirectStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum size: numElements [

	| result |
	result := IntegerArray new: numElements.
	GL
		getTextureParameteriv: aTexture id
		with: parameterEnum
		with: result.
	^ result
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:06'
}
GLDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloat: aFloat [

	GL
		textureParameterf: aTexture id
		with: parameterEnum
		with: aFloat
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:06'
}
GLDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloatArray: aFloatArray [

	GL
		textureParameterfv: aTexture id
		with: parameterEnum
		with: aFloatArray
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:06'
}
GLDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toInteger: anInteger [

	GL
		textureParameteri: aTexture id
		with: parameterEnum
		with: anInteger
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:08'
}
GLDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toIntegerArray: anIntegerArray [

	GL
		textureParameterIiv: aTexture id
		with: parameterEnum
		with: anIntegerArray
]

{
	#category : #textures,
	#'squeak_changestamp' : 'stlu 7/29/2021 13:08'
}
GLDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toUnsignedIntegerArray: aWordArray [

	GL
		textureParameterIuiv: aTexture id
		with: parameterEnum
		with: aWordArray
]

{
	#category : #buffers,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:03'
}
GLDirectStateAccessImp >> updateBuffer: aBuffer data: rawBitsOrNil size: byteSize offset: byteOffset [

	GL
		namedBufferSubData: aBuffer id
		with: byteOffset
		with: byteSize
		with: rawBitsOrNil.
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:03'
}
GLDirectStateAccessImp >> vertexAttribute: aVertexAttribute associateVertexBufferBinding: aVertexBufferBinding [

	GL
		vertexArrayAttribBinding: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: aVertexBufferBinding location
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:04'
}
GLDirectStateAccessImp >> vertexAttribute: aVertexAttribute doubleFormat: typeEnum numComponents: numComponents offset: relativeByteOffset [

	GL
		vertexArrayAttribLFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: relativeByteOffset
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:04'
}
GLDirectStateAccessImp >> vertexAttribute: aVertexAttribute floatFormat: typeEnum numComponents: numComponents offset: relativeByteOffset normalize: shouldNormalize [

	GL
		vertexArrayAttribFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: shouldNormalize
		with: relativeByteOffset
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:04'
}
GLDirectStateAccessImp >> vertexAttribute: aVertexAttribute integerFormat: typeEnum numComponents: numComponents offset: relativeByteOffset [

	GL
		vertexArrayAttribIFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: relativeByteOffset
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:04'
}
GLDirectStateAccessImp >> vertexBufferBinding: aVertexBufferBinding buffer: aBuffer stride: byteStride offset: byteOffset [

	GL
		vertexArrayVertexBuffer: aVertexBufferBinding vertexArray id
		with: aVertexBufferBinding location
		with: aBuffer id
		with: byteOffset
		with: byteStride
]

{
	#category : #'vertex arrays',
	#'squeak_changestamp' : 'stlu 7/29/2021 13:04'
}
GLDirectStateAccessImp >> vertexBufferBinding: aVertexBufferBinding instanceDivisor: instanceDivisor [

	GL
		vertexArrayBindingDivisor: aVertexBufferBinding vertexArray id
		with: aVertexBufferBinding location
		with: instanceDivisor
]
