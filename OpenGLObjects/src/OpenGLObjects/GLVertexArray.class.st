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
	#'squeak_changestamp' : 'stlu 4/26/2021 12:53'
}
GLVertexArray class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateVertexArrayIDs: count)
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 11/3/2020 15:41'
}
GLVertexArray >> delete [

	GL deleteVertexArrays: 1 with: (IntegerArray with: id)
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 16:58'
}
GLVertexArray >> drawArrays: primitiveTypeEnum command: aDrawArraysIndirectCommand [

	self boundDuring: [
		GL
			drawArraysIndirect: primitiveTypeEnum
			with: aDrawArraysIndirectCommand]
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:13'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices [

	self
		drawArrays: primitiveTypeEnum
		count: numVertices
		startingAt: 0
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:13'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices numInstances: numInstances [

	self
		drawArrays: primitiveTypeEnum
		count: numVertices
		startingAt: 0
		numInstances: numInstances
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:12'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices numInstances: numInstances baseInstance: baseInstance [

	self
		drawArrays: primitiveTypeEnum
		count: numVertices
		startingAt: 0
		numInstances: numInstances
		baseInstance: baseInstance
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:01'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices startingAt: startingIndex [

	self boundDuring: [
		GL
			drawArrays: primitiveTypeEnum
			with: startingIndex
			with: numVertices]
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:02'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices startingAt: startingIndex numInstances: numInstances [

	self boundDuring: [
		GL
			drawArraysInstanced: primitiveTypeEnum
			with: startingIndex
			with: numVertices
			with: numInstances]
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/14/2021 17:02'
}
GLVertexArray >> drawArrays: primitiveTypeEnum count: numVertices startingAt: startingIndex numInstances: numInstances baseInstance: baseInstance [

	self boundDuring: [
		GL
			drawArraysInstancedBaseInstance: primitiveTypeEnum
			with: startingIndex
			with: numVertices
			with: numInstances
			with: baseInstance]
]

{
	#category : #'rendering - indexed',
	#'squeak_changestamp' : 'stlu 3/14/2021 17:59'
}
GLVertexArray >> drawElements: primitiveTypeEnum count: numVertices startingAt: elementBufferOffset type: indexTypeEnum [
	"indexTypeEnum must be one of UNSIGNED_BYTE, UNSIGNED_SHORT, or UNSIGNED_INT"
	self boundDuring: [
		GL
			drawElements: primitiveTypeEnum
			with: numVertices
			with: indexTypeEnum
			with: (ExternalAddress fromInteger: elementBufferOffset)]
]

{
	#category : #'initialize-release',
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
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/15/2021 16:09'
}
GLVertexArray >> multiDrawArrays: primitiveTypeEnum counts: rawBitsCountsArray startIndices: rawBitsStartsArray drawCount: drawCount [

	self boundDuring: [
		GL
			multiDrawArrays: primitiveTypeEnum
			with: rawBitsStartsArray
			with: rawBitsCountsArray
			with: drawCount]
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 3/15/2021 16:10'
}
GLVertexArray >> multiDrawArraysIndirect: primitiveTypeEnum commands: rawBitsArrayOfDrawArraysIndirectCommand drawCount: drawCount stride: byteStride [

	self flag: #todo. "add remaining draw commands"
	self boundDuring: [
		GL
			multiDrawArraysIndirect: primitiveTypeEnum
			with: rawBitsArrayOfDrawArraysIndirectCommand
			with: drawCount
			with: byteStride]
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
