Extension { #name : #GLBufferManager }

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 9/9/2021 14:53'
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
'bindAs{3}During: aBlock

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
