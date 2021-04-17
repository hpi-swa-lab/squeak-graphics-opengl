Class {
	#name : #GLVertexAttribute,
	#superclass : #Object,
	#instVars : [
		'vertexArray',
		'location',
		'isEnabled',
		'vertexBufferBinding',
		'actualType',
		'format',
		'numComponents',
		'offset',
		'normalize'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-VertexArrays',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 3/16/2021 13:40'
}
GLVertexAttribute class >> vertexArray: aVertexArray location: anInteger [

	^ self basicNew
		initializeForVertexArray: aVertexArray location: anInteger;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> actualType [

	^ actualType
]

{
	#category : #'vertex buffer binding',
	#timestamp : 'stlu 3/17/2021 23:03'
}
GLVertexAttribute >> associateVertexBufferBinding: aVertexBufferBinding [

	GLObjectImps current vertexArrayImp
		vertexAttribute: self
		associateVertexBufferBinding: aVertexBufferBinding.
	vertexBufferBinding := aVertexBufferBinding
]

{
	#category : #'vertex buffer binding',
	#timestamp : 'stlu 3/17/2021 12:43'
}
GLVertexAttribute >> associateVertexBufferBindingAt: anInteger [

	self associateVertexBufferBinding: (vertexArray vertexBufferBindingAt: anInteger)
]

{
	#category : #activation,
	#timestamp : 'stlu 3/17/2021 23:03'
}
GLVertexAttribute >> disable [

	GLObjectImps current vertexArrayImp disableVertexAttribute: self.
	isEnabled := false
]

{
	#category : #activation,
	#timestamp : 'stlu 3/17/2021 23:03'
}
GLVertexAttribute >> enable [

	GLObjectImps current vertexArrayImp enableVertexAttribute: self.
	isEnabled := true
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> format [

	^ format
]

{
	#category : #format,
	#timestamp : 'stlu 3/17/2021 23:03'
}
GLVertexAttribute >> formatAsDouble: formatEnum numComponents: vectorSize offset: relativeByteOffset [

	GLObjectImps current vertexArrayImp
		vertexAttribute: self
		doubleFormat: formatEnum
		numComponents: vectorSize
		offset: relativeByteOffset.
	actualType := #double.
	format := formatEnum.
	numComponents := vectorSize.
	offset := relativeByteOffset.
]

{
	#category : #format,
	#timestamp : 'stlu 3/17/2021 13:22'
}
GLVertexAttribute >> formatAsFloat: formatEnum numComponents: vectorSize offset: relativeByteOffset [

	self
		formatAsFloat: formatEnum
		numComponents: vectorSize
		offset: relativeByteOffset
		normalize: false
]

{
	#category : #format,
	#timestamp : 'stlu 3/17/2021 23:03'
}
GLVertexAttribute >> formatAsFloat: formatEnum numComponents: vectorSize offset: relativeByteOffset normalize: shouldNormalize [

	self flag: #todo. "This set of functions definitiely needs good comments."
	GLObjectImps current vertexArrayImp
		vertexAttribute: self
		floatFormat: formatEnum
		numComponents: vectorSize
		offset: relativeByteOffset
		normalize: shouldNormalize.
	actualType := #float.
	format := formatEnum.
	numComponents := vectorSize.
	offset := relativeByteOffset.
	normalize := shouldNormalize
]

{
	#category : #format,
	#timestamp : 'stlu 3/17/2021 23:04'
}
GLVertexAttribute >> formatAsInteger: formatEnum numComponents: vectorSize offset: relativeByteOffset [

	GLObjectImps current vertexArrayImp
		vertexAttribute: self
		integerFormat: formatEnum
		numComponents: vectorSize
		offset: relativeByteOffset.
	actualType := #integer.
	format := formatEnum.
	numComponents := vectorSize.
	offset := relativeByteOffset.
]

{
	#category : #initialization,
	#timestamp : 'stlu 3/17/2021 13:21'
}
GLVertexAttribute >> initializeForVertexArray: aVertexArray location: anInteger [

	vertexArray := aVertexArray.
	location := anInteger.
	
	"defaults defined by OpenGL spec"
	isEnabled := false.
	vertexBufferBinding := location.
	offset := 0.
	
	actualType := #float.
	format := GL_FLOAT.
	numComponents := 4.
	normalize := false.
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 12:30'
}
GLVertexAttribute >> isEnabled [

	^ isEnabled
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/15/2021 17:28'
}
GLVertexAttribute >> location [

	^ location
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> normalize [

	^ normalize
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> numComponents [

	^ numComponents
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> offset [

	^ offset
]

{
	#category : #printing,
	#timestamp : 'stlu 3/14/2021 12:42'
}
GLVertexAttribute >> printOn: aStream [

	self flag: #todo.
	super printOn: aStream.
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 12:30'
}
GLVertexAttribute >> vertexArray [

	^ vertexArray
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/17/2021 12:37'
}
GLVertexAttribute >> vertexBufferBinding [

	^ vertexBufferBinding
]
