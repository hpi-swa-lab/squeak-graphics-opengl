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
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 3/16/2021 13:40'
}
GLVertexAttribute class >> vertexArray: aVertexArray location: anInteger [

	^ self basicNew
		initializeForVertexArray: aVertexArray location: anInteger;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> actualType [

	^ actualType
]

{
	#category : #'vertex buffer binding',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> associateVertexBufferBinding: aVertexBufferBinding [

	vertexArray manager stateAccessImp
		vertexAttribute: self
		associateVertexBufferBinding: aVertexBufferBinding.
	vertexBufferBinding := aVertexBufferBinding
]

{
	#category : #'vertex buffer binding',
	#'squeak_changestamp' : 'stlu 3/17/2021 12:43'
}
GLVertexAttribute >> associateVertexBufferBindingAt: anInteger [

	self associateVertexBufferBinding: (vertexArray vertexBufferBindingAt: anInteger)
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> disable [

	vertexArray manager stateAccessImp disableVertexAttribute: self.
	isEnabled := false
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> enable [

	vertexArray manager stateAccessImp enableVertexAttribute: self.
	isEnabled := true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> format [

	^ format
]

{
	#category : #format,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> formatAsDouble: formatEnum numComponents: vectorSize offset: relativeByteOffset [

	vertexArray manager stateAccessImp
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
	#'squeak_changestamp' : 'stlu 3/17/2021 13:22'
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
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> formatAsFloat: formatEnum numComponents: vectorSize offset: relativeByteOffset normalize: shouldNormalize [

	self flag: #todo. "This set of functions definitiely needs good comments."
	vertexArray manager stateAccessImp
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
	#'squeak_changestamp' : 'stlu 5/15/2021 14:11'
}
GLVertexAttribute >> formatAsInteger: formatEnum numComponents: vectorSize offset: relativeByteOffset [

	vertexArray manager stateAccessImp
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
	#'squeak_changestamp' : 'stlu 3/17/2021 13:21'
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
	#'squeak_changestamp' : 'stlu 3/14/2021 12:30'
}
GLVertexAttribute >> isEnabled [

	^ isEnabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/15/2021 17:28'
}
GLVertexAttribute >> location [

	^ location
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> normalize [

	^ normalize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> numComponents [

	^ numComponents
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 23:00'
}
GLVertexAttribute >> offset [

	^ offset
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:42'
}
GLVertexAttribute >> printOn: aStream [

	self flag: #todo.
	super printOn: aStream.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:30'
}
GLVertexAttribute >> vertexArray [

	^ vertexArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 12:37'
}
GLVertexAttribute >> vertexBufferBinding [

	^ vertexBufferBinding
]
