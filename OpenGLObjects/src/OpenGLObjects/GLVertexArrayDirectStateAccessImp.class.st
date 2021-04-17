Class {
	#name : #GLVertexArrayDirectStateAccessImp,
	#superclass : #GLVertexArrayImp,
	#category : #'OpenGLObjects-VertexArrays',
	#commentStamp : ''
}

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:32'
}
GLVertexArrayDirectStateAccessImp >> disableVertexAttribute: aVertexAttribute [

	GL
		disableVertexArrayAttrib: aVertexAttribute vertexArray id
		with: aVertexAttribute location
]

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:08'
}
GLVertexArrayDirectStateAccessImp >> enableVertexAttribute: aVertexAttribute [

	GL
		enableVertexArrayAttrib: aVertexAttribute vertexArray id
		with: aVertexAttribute location
]

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:46'
}
GLVertexArrayDirectStateAccessImp >> vertexAttribute: aVertexAttribute associateVertexBufferBinding: aVertexBufferBinding [

	GL
		vertexArrayAttribBinding: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: aVertexBufferBinding location
]

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:52'
}
GLVertexArrayDirectStateAccessImp >> vertexAttribute: aVertexAttribute doubleFormat: typeEnum numComponents: numComponents offset: relativeByteOffset [

	GL
		vertexArrayAttribLFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: relativeByteOffset
]

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:51'
}
GLVertexArrayDirectStateAccessImp >> vertexAttribute: aVertexAttribute floatFormat: typeEnum numComponents: numComponents offset: relativeByteOffset normalize: shouldNormalize [

	GL
		vertexArrayAttribFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: shouldNormalize
		with: relativeByteOffset
]

{
	#category : #'vertex attributes',
	#timestamp : 'stlu 3/17/2021 12:51'
}
GLVertexArrayDirectStateAccessImp >> vertexAttribute: aVertexAttribute integerFormat: typeEnum numComponents: numComponents offset: relativeByteOffset [

	GL
		vertexArrayAttribIFormat: aVertexAttribute vertexArray id
		with: aVertexAttribute location
		with: numComponents
		with: typeEnum
		with: relativeByteOffset
]

{
	#category : #'vertex buffer bindings',
	#timestamp : 'stlu 3/17/2021 22:26'
}
GLVertexArrayDirectStateAccessImp >> vertexBufferBinding: aVertexBufferBinding buffer: aBuffer stride: byteStride offset: byteOffset [

	GL
		vertexArrayVertexBuffer: aVertexBufferBinding vertexArray id
		with: aVertexBufferBinding location
		with: aBuffer id
		with: byteOffset
		with: byteStride
]

{
	#category : #'vertex buffer bindings',
	#timestamp : 'stlu 3/17/2021 23:17'
}
GLVertexArrayDirectStateAccessImp >> vertexBufferBinding: aVertexBufferBinding instanceDivisor: instanceDivisor [

	GL
		vertexArrayBindingDivisor: aVertexBufferBinding vertexArray id
		with: aVertexBufferBinding location
		with: instanceDivisor
]
