Class {
	#name : #GLVertexArray,
	#superclass : #GLObject,
	#instVars : [
		'vertexBufferBindings',
		'elementArrayBuffer',
		'vertexAttributes'
	],
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:19'
}
GLVertexArray class >> bound [

	^ self manager boundVertexArray
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:53'
}
GLVertexArray class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createVertexArrayIDs: count)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:54'
}
GLVertexArray class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/29/2021 23:24'
}
GLVertexArray class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager mainImp generateVertexArrayIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:50'
}
GLVertexArray class >> manager [

	^ GL objectState vertexArrayManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:30'
}
GLVertexArray class >> maxNumVertexAttributes [

	self flag: #todo. "GL_MAX_VERTEX_ATTRIBS"
	^ 16
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:30'
}
GLVertexArray class >> maxNumVertexBufferBindings [

	self flag: #todo. "GL_MAX_VERTEX_ATTRIB_BINDINGS"
	^ 16
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:30'
}
GLVertexArray class >> maxVertexAttributeOffset [

	self flag: #todo. "GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET"
	^ 2047
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:30'
}
GLVertexArray class >> maxVertexAttributeStride [

	self flag: #todo. "GL_MAX_VERTEX_ATTRIB_STRIDE"
	^ 2048
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:19'
}
GLVertexArray class >> unbind [

	self flag: #todo. "compat profile makes 0 the default VAO"
	self manager bindVertexArray: nil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:15'
}
GLVertexArray >> bind [

	manager bindVertexArray: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:18'
}
GLVertexArray >> boundDuring: aBlock [

	^ manager bindVertexArray: self during: aBlock
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:51'
}
GLVertexArray >> delete [

	manager mainImp deleteVertexArray: self.
	super delete.
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:43'
}
GLVertexArray >> drawArrays: primitiveTypeEnum command: aDrawArraysIndirectCommand [

	self boundDuring: [
		GL
			drawArraysIndirect: primitiveTypeEnum
			with: aDrawArraysIndirectCommand].
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:43'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices [

	self
		drawArrays: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0.
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:43'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices numInstances: numInstances [

	self
		drawArrays: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		numInstances: numInstances.
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:43'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices numInstances: numInstances startingInstance: startingInstance [

	self
		drawArrays: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		numInstances: numInstances
		startingInstance: startingInstance.
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:43'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex [

	self boundDuring: [
		GL
			drawArrays: primitiveTypeEnum
			with: startingVertex
			with: numVertices].
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:44'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex numInstances: numInstances [

	self boundDuring: [
		GL
			drawArraysInstanced: primitiveTypeEnum
			with: startingVertex
			with: numVertices
			with: numInstances].
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:44'
}
GLVertexArray >> drawArrays: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex numInstances: numInstances startingInstance: startingInstance [

	self boundDuring: [
		GL
			drawArraysInstancedBaseInstance: primitiveTypeEnum
			with: startingVertex
			with: numVertices
			with: numInstances
			with: startingInstance].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:45'
}
GLVertexArray >> drawElements: primitiveTypeEnum indexType: indexTypeEnum command: aDrawElementsIndirectCommand [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsIndirect: primitiveTypeEnum
			with: indexTypeEnum
			with: aDrawElementsIndirectCommand].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:29'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:00'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum indexOffset: indexOffset [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum
		indexOffset: indexOffset.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:29'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum numInstances: numInstances [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum
		numInstances: numInstances.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:00'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum numInstances: numInstances indexOffset: indexOffset [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum
		numInstances: numInstances
		indexOffset: indexOffset.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:29'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum numInstances: numInstances startingInstance: startingInstance [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum
		numInstances: numInstances
		startingInstance: startingInstance.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:00'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices indexType: indexTypeEnum numInstances: numInstances startingInstance: startingInstance indexOffset: indexOffset [

	self
		drawElements: primitiveTypeEnum
		numVertices: numVertices
		startingVertex: 0
		indexType: indexTypeEnum
		numInstances: numInstances
		startingInstance: startingInstance
		indexOffset: indexOffset.
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElements: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum indexOffset: indexOffset [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsBaseVertex: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)
			with: indexOffset].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum numInstances: numInstances [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsInstanced: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)
			with: numInstances].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum numInstances: numInstances indexOffset: indexOffset [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsInstancedBaseVertex: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)
			with: numInstances
			with: indexOffset].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum numInstances: numInstances startingInstance: startingInstance [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsInstancedBaseInstance: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)
			with: numInstances
			with: startingInstance].
]

{
	#category : #'drawing elements',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:32'
}
GLVertexArray >> drawElements: primitiveTypeEnum numVertices: numVertices startingVertex: startingVertex indexType: indexTypeEnum numInstances: numInstances startingInstance: startingInstance indexOffset: indexOffset [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElementsInstancedBaseVertexBaseInstance: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: startingVertex)
			with: numInstances
			with: indexOffset
			with: startingInstance].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/9/2021 11:35'
}
GLVertexArray >> elementArrayBuffer [

	^ elementArrayBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/9/2021 11:48'
}
GLVertexArray >> elementArrayBuffer: bufferOrNil [

	elementArrayBuffer == bufferOrNil ifTrue: [^ self].
	manager mainImp
		vertexArray: self
		bindElementArrayBuffer: bufferOrNil.
	elementArrayBuffer := bufferOrNil.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 3/17/2021 12:30'
}
GLVertexArray >> initialize [

	super initialize.
	
	vertexAttributes := Array new: self class maxNumVertexAttributes.
	1 to: vertexAttributes size do: [:i |
		vertexAttributes at: i put: (GLVertexAttribute vertexArray: self location: i - 1)].
	
	vertexBufferBindings := Array new: self class maxNumVertexBufferBindings.
	1 to: vertexBufferBindings size do: [:i |
		vertexBufferBindings at: i put: (GLVertexBufferBinding vertexArray: self location: i - 1)]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:15'
}
GLVertexArray >> isVertexArray [

	^ true
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:52'
}
GLVertexArray >> multiDrawArrays: primitiveTypeEnum numVertices: rawBitsArrayOfNumVertices startVertices: rawBitsArrayOfStartVertices numDraws: numDraws [

	self boundDuring: [
		GL
			multiDrawArrays: primitiveTypeEnum
			with: rawBitsArrayOfStartVertices
			with: rawBitsArrayOfNumVertices
			with: numDraws].
]

{
	#category : #'drawing arrays',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:56'
}
GLVertexArray >> multiDrawArraysIndirect: primitiveTypeEnum commands: contiguousMemoryOfDrawArraysIndirectCommands numCommands: numCommands stride: byteStrideBetweenCommands [

	self boundDuring: [
		GL
			multiDrawArraysIndirect: primitiveTypeEnum
			with: contiguousMemoryOfDrawArraysIndirectCommands
			with: numCommands
			with: byteStrideBetweenCommands].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 12:31'
}
GLVertexArray >> vertexAttributeAt: location [

	^ vertexAttributes at: location + 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 12:31'
}
GLVertexArray >> vertexAttributes [

	^ vertexAttributes
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:27'
}
GLVertexArray >> vertexBufferBindingAt: location [

	^ vertexBufferBindings at: location + 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/17/2021 11:27'
}
GLVertexArray >> vertexBufferBindings [

	^ vertexBufferBindings
]
