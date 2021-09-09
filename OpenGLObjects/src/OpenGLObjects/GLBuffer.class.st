Class {
	#name : #GLBuffer,
	#superclass : #GLObject,
	#instVars : [
		'size',
		'usage'
	],
	#category : #'OpenGLObjects-Buffers'
}

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsArrayBuffer [

	^ self manager arrayBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsAtomicCounterBuffer [

	^ self manager atomicCounterBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsCopyReadBuffer [

	^ self manager copyReadBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsCopyWriteBuffer [

	^ self manager copyWriteBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsDispatchIndirectBuffer [

	^ self manager dispatchIndirectBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsDrawIndirectBuffer [

	^ self manager drawIndirectBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsParameterBuffer [

	^ self manager parameterBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsPixelPackBuffer [

	^ self manager pixelPackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsPixelUnpackBuffer [

	^ self manager pixelUnpackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsQueryBuffer [

	^ self manager queryBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsShaderStorageBuffer [

	^ self manager shaderStorageBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsTextureBuffer [

	^ self manager textureBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsTransformFeedbackBuffer [

	^ self manager transformFeedbackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundAsUniformBuffer [

	^ self manager uniformBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer class >> boundTo: targetEnum [
	"Please avoid. Use respective #boundAs* selector directly instead."
	targetEnum caseOf: {
		[GL_ARRAY_BUFFER] -> [
			^ self boundAsArrayBuffer].
		[GL_ATOMIC_COUNTER_BUFFER] -> [
			^ self boundAsAtomicCounterBuffer].
		[GL_COPY_READ_BUFFER] -> [
			^ self boundAsCopyReadBuffer].
		[GL_COPY_WRITE_BUFFER] -> [
			^ self boundAsCopyWriteBuffer].
		[GL_DISPATCH_INDIRECT_BUFFER] -> [
			^ self boundAsDispatchIndirectBuffer].
		[GL_DRAW_INDIRECT_BUFFER] -> [
			^ self boundAsDrawIndirectBuffer].
		[GL_PARAMETER_BUFFER] -> [
			^ self boundAsParameterBuffer].
		[GL_PIXEL_PACK_BUFFER] -> [
			^ self boundAsPixelPackBuffer].
		[GL_PIXEL_UNPACK_BUFFER] -> [
			^ self boundAsPixelUnpackBuffer].
		[GL_QUERY_BUFFER] -> [
			^ self boundAsQueryBuffer].
		[GL_SHADER_STORAGE_BUFFER] -> [
			^ self boundAsShaderStorageBuffer].
		[GL_TEXTURE_BUFFER] -> [
			^ self boundAsTextureBuffer].
		[GL_TRANSFORM_FEEDBACK_BUFFER] -> [
			^ self boundAsTransformFeedbackBuffer].
		[GL_UNIFORM_BUFFER] -> [
			^ self boundAsUniformBuffer].
	}
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
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:28'
}
GLBuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/29/2021 23:23'
}
GLBuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager mainImp generateBufferIDs: count)
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
	#'squeak_changestamp' : 'stlu 9/9/2021 15:58'
}
GLBuffer >> bind [

	self deprecated: 'Use #bindAs* directly instead.'.
	self bindAsArrayBuffer.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsArrayBuffer [

	manager bindArrayBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsAtomicCounterBuffer [

	manager bindAtomicCounterBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsCopyReadBuffer [

	manager bindCopyReadBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsCopyWriteBuffer [

	manager bindCopyWriteBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsDispatchIndirectBuffer [

	manager bindDispatchIndirectBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsDrawIndirectBuffer [

	manager bindDrawIndirectBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsParameterBuffer [

	manager bindParameterBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsPixelPackBuffer [

	manager bindPixelPackBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsPixelUnpackBuffer [

	manager bindPixelUnpackBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsQueryBuffer [

	manager bindQueryBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsShaderStorageBuffer [

	manager bindShaderStorageBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsTextureBuffer [

	manager bindTextureBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsTransformFeedbackBuffer [

	manager bindTransformFeedbackBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindAsUniformBuffer [

	manager bindUniformBuffer: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> bindTo: targetEnum [
	"Please avoid. Use respective #bindAs* selector directly instead."
	targetEnum caseOf: {
		[GL_ARRAY_BUFFER] -> [
			self bindAsArrayBuffer].
		[GL_ATOMIC_COUNTER_BUFFER] -> [
			self bindAsAtomicCounterBuffer].
		[GL_COPY_READ_BUFFER] -> [
			self bindAsCopyReadBuffer].
		[GL_COPY_WRITE_BUFFER] -> [
			self bindAsCopyWriteBuffer].
		[GL_DISPATCH_INDIRECT_BUFFER] -> [
			self bindAsDispatchIndirectBuffer].
		[GL_DRAW_INDIRECT_BUFFER] -> [
			self bindAsDrawIndirectBuffer].
		[GL_PARAMETER_BUFFER] -> [
			self bindAsParameterBuffer].
		[GL_PIXEL_PACK_BUFFER] -> [
			self bindAsPixelPackBuffer].
		[GL_PIXEL_UNPACK_BUFFER] -> [
			self bindAsPixelUnpackBuffer].
		[GL_QUERY_BUFFER] -> [
			self bindAsQueryBuffer].
		[GL_SHADER_STORAGE_BUFFER] -> [
			self bindAsShaderStorageBuffer].
		[GL_TEXTURE_BUFFER] -> [
			self bindAsTextureBuffer].
		[GL_TRANSFORM_FEEDBACK_BUFFER] -> [
			self bindAsTransformFeedbackBuffer].
		[GL_UNIFORM_BUFFER] -> [
			self bindAsUniformBuffer].
	}
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsArrayBufferDuring: aBlock [

	^ manager bindArrayBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsAtomicCounterBufferDuring: aBlock [

	^ manager bindAtomicCounterBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsCopyReadBufferDuring: aBlock [

	^ manager bindCopyReadBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsCopyWriteBufferDuring: aBlock [

	^ manager bindCopyWriteBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsDispatchIndirectBufferDuring: aBlock [

	^ manager bindDispatchIndirectBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsDrawIndirectBufferDuring: aBlock [

	^ manager bindDrawIndirectBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsParameterBufferDuring: aBlock [

	^ manager bindParameterBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsPixelPackBufferDuring: aBlock [

	^ manager bindPixelPackBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsPixelUnpackBufferDuring: aBlock [

	^ manager bindPixelUnpackBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsQueryBufferDuring: aBlock [

	^ manager bindQueryBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsShaderStorageBufferDuring: aBlock [

	^ manager bindShaderStorageBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsTextureBufferDuring: aBlock [

	^ manager bindTextureBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsTransformFeedbackBufferDuring: aBlock [

	^ manager bindTransformFeedbackBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundAsUniformBufferDuring: aBlock [

	^ manager bindUniformBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:58'
}
GLBuffer >> boundDuring: aBlock [

	self deprecated: 'Use #boundAs*During: directly instead.'.
	^ self boundAsArrayBufferDuring: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBuffer >> boundTo: targetEnum during: aBlock [
	"Please avoid. Use respective #boundAs*During: selector directly instead."
	targetEnum caseOf: {
		[GL_ARRAY_BUFFER] -> [
			^ self boundAsArrayBufferDuring: aBlock].
		[GL_ATOMIC_COUNTER_BUFFER] -> [
			^ self boundAsAtomicCounterBufferDuring: aBlock].
		[GL_COPY_READ_BUFFER] -> [
			^ self boundAsCopyReadBufferDuring: aBlock].
		[GL_COPY_WRITE_BUFFER] -> [
			^ self boundAsCopyWriteBufferDuring: aBlock].
		[GL_DISPATCH_INDIRECT_BUFFER] -> [
			^ self boundAsDispatchIndirectBufferDuring: aBlock].
		[GL_DRAW_INDIRECT_BUFFER] -> [
			^ self boundAsDrawIndirectBufferDuring: aBlock].
		[GL_PARAMETER_BUFFER] -> [
			^ self boundAsParameterBufferDuring: aBlock].
		[GL_PIXEL_PACK_BUFFER] -> [
			^ self boundAsPixelPackBufferDuring: aBlock].
		[GL_PIXEL_UNPACK_BUFFER] -> [
			^ self boundAsPixelUnpackBufferDuring: aBlock].
		[GL_QUERY_BUFFER] -> [
			^ self boundAsQueryBufferDuring: aBlock].
		[GL_SHADER_STORAGE_BUFFER] -> [
			^ self boundAsShaderStorageBufferDuring: aBlock].
		[GL_TEXTURE_BUFFER] -> [
			^ self boundAsTextureBufferDuring: aBlock].
		[GL_TRANSFORM_FEEDBACK_BUFFER] -> [
			^ self boundAsTransformFeedbackBufferDuring: aBlock].
		[GL_UNIFORM_BUFFER] -> [
			^ self boundAsUniformBufferDuring: aBlock].
	}
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
	#'squeak_changestamp' : 'stlu 8/4/2021 14:42'
}
GLBuffer >> data: aRawBitsArray size: byteSize offset: byteOffset [

	byteSize + byteOffset > size ifTrue: [
		usage ifNil: [^ self error: 'Buffer store needs to be initialized. See #usage:size:data:'].
		byteOffset ~= 0 ifTrue: [^ self error: 'Allocated buffer store too small. Auto-reinitialization would leave undefined gap.'].
		^ self usage: usage size: byteSize data: aRawBitsArray].
	manager stateAccessImp
		updateBuffer: self
		data: aRawBitsArray
		size: byteSize
		offset: byteOffset.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:33'
}
GLBuffer >> delete [

	manager mainImp deleteBuffer: self.
	super delete.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/9/2021 14:29'
}
GLBuffer >> initialize [

	super initialize.
	size := 0.
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:46'
}
GLBuffer >> invalidateData [

	manager stateAccessImp invalidateData: self.
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
	#'squeak_changestamp' : 'stlu 8/4/2021 14:44'
}
GLBuffer >> usage: usageEnum size: byteSize data: rawBitsOrNil [

	manager stateAccessImp
		initBuffer: self
		data: rawBitsOrNil
		size: byteSize
		usage: usageEnum.
	size := byteSize.
	usage := usageEnum.
]
