Class {
	#name : #GLBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'stateAccessImp',
		'arrayBuffer',
		'atomicCounterBuffer',
		'copyReadBuffer',
		'copyWriteBuffer',
		'dispatchIndirectBuffer',
		'drawIndirectBuffer',
		'parameterBuffer',
		'pixelPackBuffer',
		'pixelUnpackBuffer',
		'queryBuffer',
		'shaderStorageBuffer',
		'textureBuffer',
		'transformFeedbackBuffer',
		'uniformBuffer'
	],
	#category : #'OpenGLObjects-Buffers'
}

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager class >> generateBindingMethods [
"
	self generateBindingMethods.
"
	| bindToCases boundToDuringCases boundToCases |
	bindToCases := ''.
	boundToDuringCases := ''.
	boundToCases := ''.
	self targetsAndVariables do: [:targetAndVariable |
		| target variable formatArgs |
		target := targetAndVariable first.
		variable := targetAndVariable second.
		(self instVarNames includes: variable) ifFalse: [
			self addInstVarName: variable].
		formatArgs := {
			target name.
			variable.
			variable capitalized}.
			
		bindToCases := bindToCases , ('
		[{1}] -> [
			self bindAs{3}].') format: formatArgs.
		boundToDuringCases := boundToDuringCases , ('
		[{1}] -> [
			^ self boundAs{3}During: aBlock].') format: formatArgs.
		boundToCases := boundToCases , ('
		[{1}] -> [
			^ self boundAs{3}].') format: formatArgs.
		
		self compile: (
'{2}

	^ {2}' format: formatArgs)
			classified: #bindings.
		
		self compile: (
'bind{3}: bufferOrNil

	{2} == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: {1}.
	{2} := bufferOrNil.' format: formatArgs)
			classified: #binding.
		
		self compile: (
'bind{3}: bufferOrNil during: aBlock

	| previous |
	previous := {2}.
	self bind{3}: bufferOrNil.
	^ aBlock ensure: [
		self bind{3}: previous]' format: formatArgs)
			classified: #binding.
		
		GLBuffer compile: (
'bindAs{3}

	manager bind{3}: self.' format: formatArgs)
			classified: #binding.
		
		GLBuffer compile: (
'boundAs{3}During: aBlock

	^ manager bind{3}: self during: aBlock' format: formatArgs)
			classified: #binding.
		
		GLBuffer theMetaClass compile: (
'boundAs{3}

	^ self manager {2}' format: formatArgs)
			classified: #bindings].
	
	GLBuffer compile: (
'bindTo: targetEnum
	"Please avoid. Use respective #bindAs* selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { bindToCases })
		classified: #binding.
	
	GLBuffer compile: (
'boundTo: targetEnum during: aBlock
	"Please avoid. Use respective #boundAs*During: selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { boundToDuringCases })
		classified: #binding.
	
	GLBuffer theMetaClass compile: (
'boundTo: targetEnum
	"Please avoid. Use respective #boundAs* selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { boundToCases })
		classified: #bindings.
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager class >> generateBindingMethods [
"
	self generateBindingMethods.
"
	| bindToCases boundToDuringCases boundToCases |
	bindToCases := ''.
	boundToDuringCases := ''.
	boundToCases := ''.
	self targetsAndVariables do: [:targetAndVariable |
		| target variable formatArgs |
		target := targetAndVariable first.
		variable := targetAndVariable second.
		(self instVarNames includes: variable) ifFalse: [
			self addInstVarName: variable].
		formatArgs := {
			target name.
			variable.
			variable capitalized}.
			
		bindToCases := bindToCases , ('
		[{1}] -> [
			self bindAs{3}].') format: formatArgs.
		boundToDuringCases := boundToDuringCases , ('
		[{1}] -> [
			^ self boundAs{3}During: aBlock].') format: formatArgs.
		boundToCases := boundToCases , ('
		[{1}] -> [
			^ self boundAs{3}].') format: formatArgs.
		
		self compile: (
'{2}

	^ {2}' format: formatArgs)
			classified: #bindings.
		
		self compile: (
'bind{3}: bufferOrNil

	{2} == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: {1}.
	{2} := bufferOrNil.' format: formatArgs)
			classified: #binding.
		
		self compile: (
'bind{3}: bufferOrNil during: aBlock

	| previous |
	previous := {2}.
	self bind{3}: bufferOrNil.
	^ aBlock ensure: [
		self bind{3}: previous]' format: formatArgs)
			classified: #binding.
		
		GLBuffer compile: (
'bindAs{3}

	manager bind{3}: self.' format: formatArgs)
			classified: #binding.
		
		GLBuffer compile: (
'boundAs{3}During: aBlock

	^ manager bind{3}: self during: aBlock' format: formatArgs)
			classified: #binding.
		
		GLBuffer theMetaClass compile: (
'boundAs{3}

	^ self manager {2}' format: formatArgs)
			classified: #bindings].
	
	GLBuffer compile: (
'bindTo: targetEnum
	"Please avoid. Use respective #bindAs* selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { bindToCases })
		classified: #binding.
	
	GLBuffer compile: (
'boundTo: targetEnum during: aBlock
	"Please avoid. Use respective #boundAs*During: selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { boundToDuringCases })
		classified: #binding.
	
	GLBuffer theMetaClass compile: (
'boundTo: targetEnum
	"Please avoid. Use respective #boundAs* selector directly instead."
	targetEnum caseOf: \{{1}
	\}' format: { boundToCases })
		classified: #bindings.
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 9/9/2021 14:15'
}
GLBufferManager class >> targetsAndVariables [

	^ { "buffer target enum" "inst var name" "is indexed"
		{ GL_ARRAY_BUFFER. 'arrayBuffer'. false }.
		{ GL_ATOMIC_COUNTER_BUFFER. 'atomicCounterBuffer'. true }.
		{ GL_COPY_READ_BUFFER. 'copyReadBuffer'. false }.
		{ GL_COPY_WRITE_BUFFER. 'copyWriteBuffer'. false }.
		{ GL_DISPATCH_INDIRECT_BUFFER. 'dispatchIndirectBuffer'. false }.
		{ GL_DRAW_INDIRECT_BUFFER. 'drawIndirectBuffer'. false }.
		{ GL_PARAMETER_BUFFER. 'parameterBuffer'. false }.
		{ GL_PIXEL_PACK_BUFFER. 'pixelPackBuffer'. false }.
		{ GL_PIXEL_UNPACK_BUFFER. 'pixelUnpackBuffer'. false }.
		{ GL_QUERY_BUFFER. 'queryBuffer'. false }.
		{ GL_SHADER_STORAGE_BUFFER. 'shaderStorageBuffer'. true }.
		{ GL_TEXTURE_BUFFER. 'textureBuffer'. false }.
		{ GL_TRANSFORM_FEEDBACK_BUFFER. 'transformFeedbackBuffer'. true }.
		{ GL_UNIFORM_BUFFER. 'uniformBuffer'. true }}
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 9/9/2021 14:15'
}
GLBufferManager class >> targetsAndVariables [

	^ { "buffer target enum" "inst var name" "is indexed"
		{ GL_ARRAY_BUFFER. 'arrayBuffer'. false }.
		{ GL_ATOMIC_COUNTER_BUFFER. 'atomicCounterBuffer'. true }.
		{ GL_COPY_READ_BUFFER. 'copyReadBuffer'. false }.
		{ GL_COPY_WRITE_BUFFER. 'copyWriteBuffer'. false }.
		{ GL_DISPATCH_INDIRECT_BUFFER. 'dispatchIndirectBuffer'. false }.
		{ GL_DRAW_INDIRECT_BUFFER. 'drawIndirectBuffer'. false }.
		{ GL_PARAMETER_BUFFER. 'parameterBuffer'. false }.
		{ GL_PIXEL_PACK_BUFFER. 'pixelPackBuffer'. false }.
		{ GL_PIXEL_UNPACK_BUFFER. 'pixelUnpackBuffer'. false }.
		{ GL_QUERY_BUFFER. 'queryBuffer'. false }.
		{ GL_SHADER_STORAGE_BUFFER. 'shaderStorageBuffer'. true }.
		{ GL_TEXTURE_BUFFER. 'textureBuffer'. false }.
		{ GL_TRANSFORM_FEEDBACK_BUFFER. 'transformFeedbackBuffer'. true }.
		{ GL_UNIFORM_BUFFER. 'uniformBuffer'. true }}
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> arrayBuffer [

	^ arrayBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> atomicCounterBuffer [

	^ atomicCounterBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindArrayBuffer: bufferOrNil [

	arrayBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_ARRAY_BUFFER.
	arrayBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindArrayBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := arrayBuffer.
	self bindArrayBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindArrayBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindAtomicCounterBuffer: bufferOrNil [

	atomicCounterBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_ATOMIC_COUNTER_BUFFER.
	atomicCounterBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindAtomicCounterBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := atomicCounterBuffer.
	self bindAtomicCounterBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindAtomicCounterBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindCopyReadBuffer: bufferOrNil [

	copyReadBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_COPY_READ_BUFFER.
	copyReadBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindCopyReadBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := copyReadBuffer.
	self bindCopyReadBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindCopyReadBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindCopyWriteBuffer: bufferOrNil [

	copyWriteBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_COPY_WRITE_BUFFER.
	copyWriteBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindCopyWriteBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := copyWriteBuffer.
	self bindCopyWriteBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindCopyWriteBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindDispatchIndirectBuffer: bufferOrNil [

	dispatchIndirectBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_DISPATCH_INDIRECT_BUFFER.
	dispatchIndirectBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindDispatchIndirectBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := dispatchIndirectBuffer.
	self bindDispatchIndirectBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindDispatchIndirectBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindDrawIndirectBuffer: bufferOrNil [

	drawIndirectBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_DRAW_INDIRECT_BUFFER.
	drawIndirectBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindDrawIndirectBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := drawIndirectBuffer.
	self bindDrawIndirectBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindDrawIndirectBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindParameterBuffer: bufferOrNil [

	parameterBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_PARAMETER_BUFFER.
	parameterBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindParameterBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := parameterBuffer.
	self bindParameterBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindParameterBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindPixelPackBuffer: bufferOrNil [

	pixelPackBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_PIXEL_PACK_BUFFER.
	pixelPackBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindPixelPackBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := pixelPackBuffer.
	self bindPixelPackBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindPixelPackBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindPixelUnpackBuffer: bufferOrNil [

	pixelUnpackBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_PIXEL_UNPACK_BUFFER.
	pixelUnpackBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindPixelUnpackBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := pixelUnpackBuffer.
	self bindPixelUnpackBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindPixelUnpackBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindQueryBuffer: bufferOrNil [

	queryBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_QUERY_BUFFER.
	queryBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindQueryBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := queryBuffer.
	self bindQueryBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindQueryBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindShaderStorageBuffer: bufferOrNil [

	shaderStorageBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_SHADER_STORAGE_BUFFER.
	shaderStorageBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindShaderStorageBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := shaderStorageBuffer.
	self bindShaderStorageBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindShaderStorageBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindTextureBuffer: bufferOrNil [

	textureBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_TEXTURE_BUFFER.
	textureBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindTextureBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := textureBuffer.
	self bindTextureBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindTextureBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindTransformFeedbackBuffer: bufferOrNil [

	transformFeedbackBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_TRANSFORM_FEEDBACK_BUFFER.
	transformFeedbackBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindTransformFeedbackBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := transformFeedbackBuffer.
	self bindTransformFeedbackBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindTransformFeedbackBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindUniformBuffer: bufferOrNil [

	uniformBuffer == bufferOrNil ifTrue: [^ self].
	mainImp bindBuffer: bufferOrNil to: GL_UNIFORM_BUFFER.
	uniformBuffer := bufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> bindUniformBuffer: bufferOrNil during: aBlock [

	| previous |
	previous := uniformBuffer.
	self bindUniformBuffer: bufferOrNil.
	^ aBlock ensure: [
		self bindUniformBuffer: previous]
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> copyReadBuffer [

	^ copyReadBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> copyWriteBuffer [

	^ copyWriteBuffer
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:20'
}
GLBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:21'
}
GLBufferManager >> creationImp: anObject [

	creationImp := anObject.
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> dispatchIndirectBuffer [

	^ dispatchIndirectBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> drawIndirectBuffer [

	^ drawIndirectBuffer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/9/2021 14:56'
}
GLBufferManager >> initialize [

	super initialize.
	
	mainImp := GLBufferImp new.
	creationImp := GLDirectStateAccessImp new.
	stateAccessImp := GLDirectStateAccessImp new.
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> parameterBuffer [

	^ parameterBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> pixelPackBuffer [

	^ pixelPackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> pixelUnpackBuffer [

	^ pixelUnpackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> queryBuffer [

	^ queryBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> shaderStorageBuffer [

	^ shaderStorageBuffer
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:39'
}
GLBufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 8/4/2021 14:39'
}
GLBufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject.
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> textureBuffer [

	^ textureBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> transformFeedbackBuffer [

	^ transformFeedbackBuffer
]

{
	#category : #bindings,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:56'
}
GLBufferManager >> uniformBuffer [

	^ uniformBuffer
]
