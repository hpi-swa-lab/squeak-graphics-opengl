Class {
	#name : #GLVertexBufferBinding,
	#superclass : #Object,
	#instVars : [
		'vertexArray',
		'location',
		'buffer',
		'offset',
		'stride',
		'instanceDivisor'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 3/16/2021 16:03'
}
GLVertexBufferBinding class >> vertexArray: aVertexArray location: anInteger [

	^ self new
		initializeForVertexArray: aVertexArray location: anInteger;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:33'
}
GLVertexBufferBinding >> buffer [

	^ buffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/17/2021 22:37'
}
GLVertexBufferBinding >> buffer: aBuffer [

	self
		buffer: aBuffer
		stride: stride
		offset: offset.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 4/21/2022 13:13'
}
GLVertexBufferBinding >> buffer: aBuffer offset: byteOffset [

	self
		buffer: aBuffer
		stride: stride
		offset: byteOffset.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/17/2021 22:37'
}
GLVertexBufferBinding >> buffer: aBuffer stride: byteStride [

	self
		buffer: aBuffer
		stride: byteStride
		offset: 0.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 4/21/2022 11:05'
}
GLVertexBufferBinding >> buffer: aBuffer stride: byteStride offset: byteOffset [
	"Binds 'aBuffer' to this vertex buffer binding point.
	'byteOffset' specifies the offset of the first element within aBuffer.
	'byteStride' specifies the distance between elements within aBuffer (from start to start)."
	vertexArray manager stateAccessImp
		vertexBufferBinding: self
		buffer: aBuffer
		stride: byteStride
		offset: byteOffset.
	buffer := aBuffer.
	stride := byteStride.
	offset := byteOffset.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 3/16/2021 16:03'
}
GLVertexBufferBinding >> initializeForVertexArray: aVertexArray location: anInteger [

	vertexArray := aVertexArray.
	location := anInteger.

	offset := 0.
	stride := 16.
	instanceDivisor := 0.
	buffer := nil.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:33'
}
GLVertexBufferBinding >> instanceDivisor [

	^ instanceDivisor
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:12'
}
GLVertexBufferBinding >> instanceDivisor: advancePerInstance [

	vertexArray manager stateAccessImp
		vertexBufferBinding: self
		instanceDivisor: advancePerInstance.
	instanceDivisor := advancePerInstance.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/15/2021 17:30'
}
GLVertexBufferBinding >> location [

	^ location
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:33'
}
GLVertexBufferBinding >> offset [

	^ offset
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 4/21/2022 11:06'
}
GLVertexBufferBinding >> offset: byteOffset [

	self
		buffer: buffer
		stride: stride
		offset: byteOffset.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:42'
}
GLVertexBufferBinding >> printOn: aStream [

	self flag: #todo.
	super printOn: aStream.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:33'
}
GLVertexBufferBinding >> stride [

	^ stride
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/14/2021 12:33'
}
GLVertexBufferBinding >> vertexArray [

	^ vertexArray
]
