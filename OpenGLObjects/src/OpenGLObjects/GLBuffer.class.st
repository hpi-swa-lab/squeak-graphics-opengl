Class {
	#name : #GLBuffer,
	#superclass : #GLObject,
	#instVars : [
		'target',
		'size',
		'usage'
	],
	#category : #'OpenGLObjects-Buffers',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:47'
}
GLBuffer class >> allocate: n in: anIntegerArray [

	GL genBuffers: n with: anIntegerArray
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:06'
}
GLBuffer class >> boundTo: targetEnum [

	^ GLObjectBindings current dictionary at: targetEnum ifAbsentPut: [nil]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/30/2020 18:58'
}
GLBuffer class >> defaultTarget [

	^ GL_ARRAY_BUFFER
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:12'
}
GLBuffer class >> unbind: targetEnum [

	GL bindBuffer: targetEnum with: GL_NONE.
	GLObjectBindings current dictionary at: targetEnum put: nil
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:01'
}
GLBuffer >> bind [

	self bindTo: target
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:11'
}
GLBuffer >> bindTo: targetEnum [

	self flag: #todo. "dictionary -> inst var"
	self flag: #todo. "bindTo* vs. bindAs*"
	self flag: #todo. "bind* vs. bind*Buffer"
	GL bindBuffer: targetEnum with: id.
	GLObjectBindings current dictionary at: targetEnum put: self
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:02'
}
GLBuffer >> boundDuring: aBlock [

	^ self boundTo: target during: aBlock
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:02'
}
GLBuffer >> boundTo: targetEnum during: aBlock [

	| previous |
	previous := self class boundTo: targetEnum.
	previous = self ifTrue: [^ aBlock value].
	self bindTo: targetEnum.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbind: targetEnum]
			ifNotNil: [previous bindTo: targetEnum]]
]

{
	#category : #data,
	#timestamp : 'stlu 11/6/2020 13:59'
}
GLBuffer >> data: aRawBitsArray [

	self data: aRawBitsArray size: aRawBitsArray byteSize offset: 0
]

{
	#category : #data,
	#timestamp : 'stlu 11/6/2020 13:58'
}
GLBuffer >> data: aRawBitsArray offset: byteOffset [

	self data: aRawBitsArray size: aRawBitsArray byteSize offset: byteOffset
]

{
	#category : #data,
	#timestamp : 'stlu 11/6/2020 13:57'
}
GLBuffer >> data: aRawBitsArray size: byteSize [

	self data: aRawBitsArray size: byteSize offset: 0
]

{
	#category : #data,
	#timestamp : 'stlu 12/1/2020 02:43'
}
GLBuffer >> data: aRawBitsArray size: byteSize offset: byteOffset [

	byteSize + byteOffset > size ifTrue: [
		usage ifNil: [^ self error: 'Buffer store needs to be initialized. See #usage:size:data:'].
		byteOffset ~= 0 ifTrue: [^ self error: 'Allocated buffer store too small. Auto-reinitialization would leave undefined gap.'].
		^ self usage: usage size: byteSize data: aRawBitsArray].
	self boundDuring: [
		GL
			bufferSubData: target
			with: byteOffset
			with: byteSize
			with: aRawBitsArray]
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/3/2020 15:32'
}
GLBuffer >> delete [

	GL deleteBuffers: 1 with: (IntegerArray with: id)
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 12/1/2020 02:41'
}
GLBuffer >> initialize [

	super initialize.
	target := self class defaultTarget.
	size := 0
]

{
	#category : #data,
	#timestamp : 'stlu 12/28/2020 12:09'
}
GLBuffer >> invalidate [

	self stateAccess invalidateData: self
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:11'
}
GLBuffer >> isAllocated [

	^ GL isBuffer: id
]

{
	#category : #testing,
	#timestamp : 'stlu 10/29/2020 12:14'
}
GLBuffer >> isBuffer [

	^ true
]

{
	#category : #data,
	#timestamp : 'stlu 12/28/2020 12:08'
}
GLBuffer >> orphan [

	self invalidateData
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/6/2020 14:33'
}
GLBuffer >> size [

	^ size
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/28/2020 11:53'
}
GLBuffer >> stateAccess [

	^ nil
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/1/2020 02:41'
}
GLBuffer >> target [

	^ target
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/1/2020 02:41'
}
GLBuffer >> target: anInteger [

	target := anInteger
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:47'
}
GLBuffer >> targetArrayBuffer [

	target := GL_ARRAY_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:47'
}
GLBuffer >> targetAtomicCounterBuffer [

	target := GL_ATOMIC_COUNTER_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetCopyReadBuffer [

	target := GL_COPY_READ_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetCopyWriteBuffer [

	target := GL_COPY_WRITE_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetDispatchIndirectBuffer [

	target := GL_DISPATCH_INDIRECT_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetDrawIndirectBuffer [

	target := GL_DRAW_INDIRECT_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetElementArrayBuffer [

	target := GL_ELEMENT_ARRAY_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetParameterBuffer [

	target := GL_PARAMETER_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetPixelPackBuffer [

	target := GL_PIXEL_PACK_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetPixelUnpackBuffer [

	target := GL_PIXEL_UNPACK_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetQueryBuffer [

	target := GL_QUERY_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetShaderStorageBuffer [

	target := GL_SHADER_STORAGE_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetTextureBuffer [

	target := GL_TEXTURE_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:51'
}
GLBuffer >> targetTransformFeedbackBuffer [

	target := GL_TRANSFORM_FEEDBACK_BUFFER
]

{
	#category : #targets,
	#timestamp : 'stlu 12/1/2020 02:51'
}
GLBuffer >> targetUniformBuffer [

	target := GL_UNIFORM_BUFFER
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:02'
}
GLBuffer >> unbind [

	self class unbind: target
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/6/2020 14:33'
}
GLBuffer >> usage [

	^ usage
]

{
	#category : #data,
	#timestamp : 'stlu 11/6/2020 13:53'
}
GLBuffer >> usage: usageEnum data: aRawBitsArray [ 

	self usage: usageEnum size: aRawBitsArray byteSize data: aRawBitsArray
]

{
	#category : #data,
	#timestamp : 'stlu 11/6/2020 13:53'
}
GLBuffer >> usage: usageEnum size: byteSize [

	self usage: usageEnum size: byteSize data: nil
]

{
	#category : #data,
	#timestamp : 'stlu 12/1/2020 02:42'
}
GLBuffer >> usage: usageEnum size: byteSize data: aRawBitsArray [

	self boundDuring: [
		GL
			bufferData: target
			with: byteSize
			with: aRawBitsArray
			with: usageEnum].
	size := byteSize.
	usage := usageEnum.
]
