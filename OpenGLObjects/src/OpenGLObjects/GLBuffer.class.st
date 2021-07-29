Class {
	#name : #GLBuffer,
	#superclass : #GLObject,
	#instVars : [
		'target',
		'size',
		'usage'
	],
	#category : #'OpenGLObjects-Buffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:34'
}
GLBuffer class >> boundTo: targetEnum [

	^ self manager bindings at: targetEnum
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:25'
}
GLBuffer class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createBufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/30/2020 18:58'
}
GLBuffer class >> defaultTarget [

	^ GL_ARRAY_BUFFER
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:28'
}
GLBuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:18'
}
GLBuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateBufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:02'
}
GLBuffer class >> manager [

	^ GL objectState bufferManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:39'
}
GLBuffer class >> targets [

	^ {
		GL_ARRAY_BUFFER.
		GL_ATOMIC_COUNTER_BUFFER.
		GL_COPY_READ_BUFFER.
		GL_COPY_WRITE_BUFFER.
		GL_DISPATCH_INDIRECT_BUFFER.
		GL_DRAW_INDIRECT_BUFFER.
		GL_ELEMENT_ARRAY_BUFFER.
		GL_PARAMETER_BUFFER.
		GL_PIXEL_PACK_BUFFER.
		GL_PIXEL_UNPACK_BUFFER.
		GL_QUERY_BUFFER.
		GL_SHADER_STORAGE_BUFFER.
		GL_TEXTURE_BUFFER.
		GL_TRANSFORM_FEEDBACK_BUFFER.
		GL_UNIFORM_BUFFER.
	}
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:34'
}
GLBuffer class >> unbind: targetEnum [

	self manager bindBuffer: nil to: targetEnum
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/15/2021 13:01'
}
GLBuffer >> bind [

	self bindTo: target
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:32'
}
GLBuffer >> bindTo: targetEnum [

	self flag: #todo. "dictionary -> inst var"
	manager bindBuffer: self to: targetEnum
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 3/15/2021 13:02'
}
GLBuffer >> boundDuring: aBlock [

	^ self boundTo: target during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:33'
}
GLBuffer >> boundTo: targetEnum during: aBlock [

	^ manager bindBuffer: self to: targetEnum during: aBlock
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 5/20/2021 14:57'
}
GLBuffer >> data: aRawBitsArray [

	self
		data: aRawBitsArray
		size: aRawBitsArray byteSize
		offset: 0
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 5/20/2021 14:57'
}
GLBuffer >> data: aRawBitsArray offset: byteOffset [

	self
		data: aRawBitsArray
		size: aRawBitsArray byteSize
		offset: byteOffset
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 5/20/2021 14:57'
}
GLBuffer >> data: aRawBitsArray size: byteSize [

	self
		data: aRawBitsArray
		size: byteSize
		offset: 0
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 5/20/2021 14:54'
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
			with: aRawBitsArray getHandle]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 11/3/2020 15:32'
}
GLBuffer >> delete [

	GL deleteBuffers: 1 with: (IntegerArray with: id)
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 12/1/2020 02:41'
}
GLBuffer >> initialize [

	super initialize.
	target := self class defaultTarget.
	size := 0
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:58'
}
GLBuffer >> invalidateData [

	self stateAccess invalidateData: self.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:14'
}
GLBuffer >> isBuffer [

	^ true
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:57'
}
GLBuffer >> orphan [

	self invalidateData.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/6/2020 14:33'
}
GLBuffer >> size [

	^ size
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/28/2020 11:53'
}
GLBuffer >> stateAccess [

	^ nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:41'
}
GLBuffer >> target [

	^ target
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:41'
}
GLBuffer >> target: anInteger [

	target := anInteger
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:47'
}
GLBuffer >> targetArrayBuffer [

	target := GL_ARRAY_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:47'
}
GLBuffer >> targetAtomicCounterBuffer [

	target := GL_ATOMIC_COUNTER_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetCopyReadBuffer [

	target := GL_COPY_READ_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetCopyWriteBuffer [

	target := GL_COPY_WRITE_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetDispatchIndirectBuffer [

	target := GL_DISPATCH_INDIRECT_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:48'
}
GLBuffer >> targetDrawIndirectBuffer [

	target := GL_DRAW_INDIRECT_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetElementArrayBuffer [

	target := GL_ELEMENT_ARRAY_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetParameterBuffer [

	target := GL_PARAMETER_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:49'
}
GLBuffer >> targetPixelPackBuffer [

	target := GL_PIXEL_PACK_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetPixelUnpackBuffer [

	target := GL_PIXEL_UNPACK_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetQueryBuffer [

	target := GL_QUERY_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetShaderStorageBuffer [

	target := GL_SHADER_STORAGE_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:50'
}
GLBuffer >> targetTextureBuffer [

	target := GL_TEXTURE_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:51'
}
GLBuffer >> targetTransformFeedbackBuffer [

	target := GL_TRANSFORM_FEEDBACK_BUFFER
]

{
	#category : #targets,
	#'squeak_changestamp' : 'stlu 12/1/2020 02:51'
}
GLBuffer >> targetUniformBuffer [

	target := GL_UNIFORM_BUFFER
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/6/2020 14:33'
}
GLBuffer >> usage [

	^ usage
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 11/6/2020 13:53'
}
GLBuffer >> usage: usageEnum data: aRawBitsArray [ 

	self usage: usageEnum size: aRawBitsArray byteSize data: aRawBitsArray
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 11/6/2020 13:53'
}
GLBuffer >> usage: usageEnum size: byteSize [

	self usage: usageEnum size: byteSize data: nil
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 5/20/2021 14:56'
}
GLBuffer >> usage: usageEnum size: byteSize data: rawBitsArrayOrNil [

	self boundDuring: [
		GL
			bufferData: target
			with: byteSize
			with: (rawBitsArrayOrNil ifNotNil: [rawBitsArrayOrNil getHandle])
			with: usageEnum].
	size := byteSize.
	usage := usageEnum.
]
