"
I am the interface to OpenGL.

User will typically interact with me via the `GL` global variable.
"
Class {
	#name : #GLLibrary,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#classVars : [
		'ErrorMessages',
		'InvalidLibrary'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 4/14/2021 14:40'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 5/24/2022 15:30'
}
GLLibrary class >> initialize [

	GLConstants initialize.
	InvalidLibrary := GLInvalidLibrary new.
	self initializeGL.
	self initializeErrorMessages.
	Smalltalk addToStartUpList: self.
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 4/14/2021 18:26'
}
GLLibrary class >> initializeErrorMessages [

	ErrorMessages := {
		GL_INVALID_ENUM -> 'Invalid enum. An unacceptable value is specified for an enumerated argument.'.
		GL_INVALID_VALUE -> 'Invalid value. A numeric argument is out of range.'.
		GL_INVALID_OPERATION -> 'Invalid operation. The specified operation is not allowed in the current state.'.
		GL_STACK_OVERFLOW -> 'Stack overflow. An attempt has been made to perform an operation that would cause an internal stack overflow.'.
		GL_STACK_UNDERFLOW -> 'Stack underflow. An attempt has been made to perform an operation that would cause an internal stack to underflow.'.
		GL_OUT_OF_MEMORY -> 'Out of memory. There is not enought memory left to execute the command.'.
		GL_INVALID_FRAMEBUFFER_OPERATION -> 'Invalid framebuffer operation. The framebuffer object is not complete.'.
		GL_TEXTURE_TOO_LARGE_EXT -> 'Texture too large. Cannot accomodate a texture of the size requested.'.
		GL_TABLE_TOO_LARGE -> 'Table too large.'.
		GL_NO_ERROR -> 'No error. No error has been recorded.'
	} as: Dictionary
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 5/24/2022 15:30'
}
GLLibrary class >> initializeGL [

	Environment current at: #GL put: InvalidLibrary.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:31'
}
GLLibrary class >> invalid [

	^ InvalidLibrary
]

{
	#category : #'subclass creation',
	#'squeak_changestamp' : 'stlu 5/24/2022 17:22'
}
GLLibrary class >> newEnvironment [

	^ super newEnvironment
		import: Environment current;
		yourself
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 8/11/2021 12:52'
}
GLLibrary class >> startUp: resuming [

	resuming ifTrue: [
		self initializeGL].
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 5/17/2022 10:13'
}
GLLibrary class >> unload [

	Smalltalk removeFromStartUpList: self.
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 4/22/2021 11:54'
}
GLLibrary >> activateContext [

	self context activate
]

{
	#category : #'context state',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:02'
}
GLLibrary >> at: aKey [

	self deprecated: 'Access userData directly instead'.
	^ self userData at: aKey
]

{
	#category : #'context state',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:02'
}
GLLibrary >> at: aKey ifAbsentPut: aBlock [

	self deprecated: 'Access userData directly instead'.
	^ self userData at: aKey ifAbsentPut: aBlock
]

{
	#category : #'context state',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:02'
}
GLLibrary >> at: aKey put: aValue [

	self deprecated: 'Access userData directly instead'.
	^ self userData at: aKey put: aValue
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/14/2021 18:24'
}
GLLibrary >> checkForError [
	"Check for any OpenGL errors, and raise an Error if any exist."
	| errorCode |
	errorCode := self getError.
	errorCode ~= GL_NO_ERROR ifTrue: [
		self error: (self messageForErrorCode: errorCode)]
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:05'
}
GLLibrary >> clearColor: aColor [

	self
		clearColor: aColor red
		with: aColor green
		with: aColor blue
		with: aColor alpha
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/15/2021 14:18'
}
GLLibrary >> context [

	^ context
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/15/2021 22:01'
}
GLLibrary >> context: aContext [

	context := aContext
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 8/10/2021 14:03'
}
GLLibrary >> defaultDebugMessageCallback [

	self notYetImplemented.
	^ [:source :type :id :severity :length :message :userParam |
		source caseOf: {
			[GL_DEBUG_SOURCE_API] -> [].
			[GL_DEBUG_SOURCE_SHADER_COMPILER] -> [].
			[GL_DEBUG_SOURCE_WINDOW_SYSTEM] -> [].
			[GL_DEBUG_SOURCE_THIRD_PARTY] -> [].
			[GL_DEBUG_SOURCE_APPLICATION] -> [].
			[GL_DEBUG_SOURCE_OTHER] -> []}.
		type caseOf: {
			[GL_DEBUG_TYPE_ERROR] -> [].
			[GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR] -> [].
			[GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR] -> [].
			[GL_DEBUG_TYPE_PERFORMANCE] -> [].
			[GL_DEBUG_TYPE_PORTABILITY] -> [].
			[GL_DEBUG_TYPE_MARKER] -> [].
			[GL_DEBUG_TYPE_PUSH_GROUP] -> [].
			[GL_DEBUG_TYPE_POP_GROUP] -> [].
			[GL_DEBUG_TYPE_OTHER] -> []}.
		severity caseOf: {
			[GL_DEBUG_SEVERITY_HIGH] -> [].
			[GL_DEBUG_SEVERITY_MEDIUM] -> [].
			[GL_DEBUG_SEVERITY_LOW] -> [].
			[GL_DEBUG_SEVERITY_NOTIFICATION] -> []}]
]

{
	#category : #'context handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 09:51'
}
GLLibrary >> destroy [

	self deprecated.
	self context destroy
]

{
	#category : #'context handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 09:51'
}
GLLibrary >> endFrame [

	self deprecated.
	self context endFrame
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 17:06'
}
GLLibrary >> extensions [

	^ (context version >= GL30 or: [context version >= GLES30])
		ifTrue: [self getExtensionsNew]
		ifFalse: [self getExtensionsOld]
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:24'
}
GLLibrary >> extensionsString [

	^ self stringStateNamed: GL_EXTENSIONS
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:58'
}
GLLibrary >> getExtensionsNew [

	| extensions |
	extensions := Array new: self numExtensions.
	1 to: extensions size do: [:i |
		| extensionName |
		extensionName := self stringStateNamed: GL_EXTENSIONS at: i - 1.
		extensions at: i put: extensionName asSymbol].
	^ extensions
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:57'
}
GLLibrary >> getExtensionsOld [

	^ Array streamContents: [:stream |
		self extensionsString splitBy: ' ' do: [:extensionName |
			stream nextPut: extensionName asSymbol]]
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:54'
}
GLLibrary >> getIntegerParameter: enum [

	self deprecated: 'Use #integerStateNamed: instead.'.
	^ self integerStateNamed: enum
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:54'
}
GLLibrary >> getIntegerParameters: enum size: numElements [

	self deprecated: 'Use #integerStateNamed:ofSize: instead.'.
	^ self integerStateNamed: enum ofSize: numElements
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:55'
}
GLLibrary >> getStringParameter: enum [

	self deprecated: 'Use #stringStateNamed: instead.'.
	^ self stringStateNamed: enum
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:56'
}
GLLibrary >> getStringParameter: enum at: index [

	self deprecated: 'Use #stringStateNamed:at: instead.'.
	^ self stringStateNamed: enum at: index
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:53'
}
GLLibrary >> integerStateNamed: enum [

	| data |
	data := IntegerArray new: 1.
	self getIntegerv: enum with: data.
	^ data at: 1
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:52'
}
GLLibrary >> integerStateNamed: enum ofSize: numElements [

	| data |
	data := IntegerArray new: numElements.
	self getIntegerv: enum with: data.
	^ data
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:39'
}
GLLibrary >> majorMinor [

	^ context version api versionStringToMajorMinor: self versionString
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 4/22/2021 11:57'
}
GLLibrary >> makeCurrent [

	GL == self ifTrue: [^ self].
	GL context ~~ self context ifTrue: [self activateContext].
	GL := self
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 4/22/2021 11:41'
}
GLLibrary >> makeCurrentDuring: aBlock [

	| previousLib |
	previousLib := GL.
	[
		self makeCurrent.
		^ aBlock value.
	] ensure: [
		previousLib makeCurrent]
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:37'
}
GLLibrary >> maxArrayTextureLayers [
	"Maximum number of layers allowed in an array texture. At least 256."
	^ self integerStateNamed: GL_MAX_ARRAY_TEXTURE_LAYERS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:53'
}
GLLibrary >> maxColorAttachments [
	"Maximum number of color attachments available in framebuffers. At least 8."
	^ self integerStateNamed: GL_MAX_COLOR_ATTACHMENTS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:28'
}
GLLibrary >> maxCombinedImageUniforms [
	"Maximum number of image uniforms."
	^ self integerStateNamed: GL_MAX_COMBINED_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:43'
}
GLLibrary >> maxCombinedTextureImageUnits [
	"Maximum number of texture image units. At least 80 (16 per shader stage)."
	^ self integerStateNamed: GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:03'
}
GLLibrary >> maxCombinedUniformBlocks [
	"Maximum number of uniform blocks per program. At least 70."
	^ self integerStateNamed: GL_MAX_COMBINED_UNIFORM_BLOCKS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:27'
}
GLLibrary >> maxComputeImageUniforms [
	"Maximum number of image uniforms available to compute shaders."
	^ self integerStateNamed: GL_MAX_COMPUTE_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:42'
}
GLLibrary >> maxComputeTextureImageUnits [
	"Maximum number of texture image units available to compute shaders. At least 16."
	^ self integerStateNamed: GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:02'
}
GLLibrary >> maxComputeUniformBlocks [
	"Maximum number of uniform blocks per compute shader. At least 14."
	^ self integerStateNamed: GL_MAX_COMPUTE_UNIFORM_BLOCKS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:27'
}
GLLibrary >> maxFragmentImageUniforms [
	"Maximum number of image uniforms available to fragment shaders."
	^ self integerStateNamed: GL_MAX_FRAGMENT_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:42'
}
GLLibrary >> maxFragmentTextureImageUnits [
	"Maximum number of texture image units available to fragment shaders. At least 16."
	^ self integerStateNamed: GL_MAX_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:03'
}
GLLibrary >> maxFragmentUniformBlocks [
	"Maximum number of uniform blocks per fragment shader. At least 12."
	^ self integerStateNamed: GL_MAX_FRAGMENT_UNIFORM_BLOCKS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:27'
}
GLLibrary >> maxGeometryImageUniforms [
	"Maximum number of image uniforms available to geometry shaders."
	^ self integerStateNamed: GL_MAX_GEOMETRY_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:42'
}
GLLibrary >> maxGeometryTextureImageUnits [
	"Maximum number of texture image units available to geometry shaders. At least 16."
	^ self integerStateNamed: GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:04'
}
GLLibrary >> maxGeometryUniformBlocks [
	"Maximum number of uniform blocks per geometry shader. At least 12."
	^ self integerStateNamed: GL_MAX_GEOMETRY_UNIFORM_BLOCKS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:26'
}
GLLibrary >> maxTesselationControlImageUniforms [
	"Maximum number of image uniforms available to tesselation control shaders."
	^ self integerStateNamed: GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:42'
}
GLLibrary >> maxTesselationControlTextureImageUnits [
	"Maximum number of texture image units available to tesselation control shaders. At least 16."
	^ self integerStateNamed: GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:26'
}
GLLibrary >> maxTesselationEvaluationImageUniforms [
	"Maximum number of image uniforms available to tesselation evaluation shaders."
	^ self integerStateNamed: GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:42'
}
GLLibrary >> maxTesselationEvaluationTextureImageUnits [
	"Maximum number of texture image units available to tesselation evaluation shaders. At least 16."
	^ self integerStateNamed: GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/3/2021 20:05'
}
GLLibrary >> maxTextureBufferSize [
	"Maximum number of texels allowed in the texel array of a texture buffer object. At least 65536."
	^ self integerStateNamed: GL_MAX_TEXTURE_BUFFER_SIZE
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:37'
}
GLLibrary >> maxTextureSize [
	"Rough estimate of the largest texture that the GL can handle. At least 1024."
	^ self integerStateNamed: GL_MAX_TEXTURE_SIZE
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:44'
}
GLLibrary >> maxUniformBlockSize [
	"Maximum size in basic machine units (bytes) of a uniform block. At least 16384."
	^ self integerStateNamed: GL_MAX_UNIFORM_BLOCK_SIZE
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 14:58'
}
GLLibrary >> maxUniformBufferBindings [
	"Maximum number of uniform buffer binding points. At least 36."
	^ self integerStateNamed: GL_MAX_UNIFORM_BUFFER_BINDINGS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:39'
}
GLLibrary >> maxUniformLocations [
	"Maximum number of explicitly assignable uniform locations. At least 1024."
	^ self integerStateNamed: GL_MAX_UNIFORM_LOCATIONS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:39'
}
GLLibrary >> maxVaryingComponents [
	"Number of components for varying variables. At least 60."
	^ self integerStateNamed: GL_MAX_VARYING_COMPONENTS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:38'
}
GLLibrary >> maxVaryingVectors [
	"Number of 4-vectors for varying variables. Equivalent to #maxVaryingComponents / 4. At least 15."
	^ self getIntegerParameter: GL_MAX_VARYING_VECTORS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 18:39'
}
GLLibrary >> maxVertexAttributeBindings [
	"Maximum number of vertex buffers that may be bound."
	^ self integerStateNamed: GL_MAX_VERTEX_ATTRIB_BINDINGS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 4/15/2021 19:08'
}
GLLibrary >> maxVertexAttributes [
	"Maximum number of 4-component generic vertex attributes accessible to a vertex shader. At least 16."
	self flag: #todo. "Move these context-specific constants to GLContext"
	^ self integerStateNamed: GL_MAX_VERTEX_ATTRIBS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 5/11/2021 15:25'
}
GLLibrary >> maxVertexImageUniforms [
	"Maximum number of image uniforms available to vertex shaders."
	^ self integerStateNamed: GL_MAX_VERTEX_IMAGE_UNIFORMS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/1/2022 14:39'
}
GLLibrary >> maxVertexTextureImageUnits [
	"Maximum number of texture image units available to vertex shaders. At least 16."
	^ self integerStateNamed: GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
]

{
	#category : #limits,
	#'squeak_changestamp' : 'stlu 6/17/2022 15:01'
}
GLLibrary >> maxVertexUniformBlocks [
	"Maximum number of uniform blocks per vertex shader. At least 12."
	^ self integerStateNamed: GL_MAX_VERTEX_UNIFORM_BLOCKS
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/14/2021 18:26'
}
GLLibrary >> messageForErrorCode: anInteger [

	^ ErrorMessages
		at: anInteger
		ifAbsent: ['Unknown error ' , anInteger asString]
]

{
	#category : #'context handling',
	#'squeak_changestamp' : 'stlu 4/15/2021 11:34'
}
GLLibrary >> newFrameDo: aBlock [.

	self deprecated.
	self makeCurrentDuring: [
		self checkForError.
		aBlock value.
		self endFrame.
		self flag: #todo. "can we get rid of endFrame?"
		self checkForError.
		self swapBuffers]
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:23'
}
GLLibrary >> numExtensions [

	^ self integerStateNamed: GL_NUM_EXTENSIONS
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 14:22'
}
GLLibrary >> objectState [

	^ self context objectState
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:48'
}
GLLibrary >> profile [

	| version |
	version := context version.
	version >= GL32 ifTrue: [
		^ version api maskToProfile: self profileMask].
	^ nil
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:34'
}
GLLibrary >> profileMask [

	^ self integerStateNamed: GL_CONTEXT_PROFILE_MASK
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:32'
}
GLLibrary >> rendererString [

	^ self stringStateNamed: GL_RENDERER
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 8/10/2021 11:21'
}
GLLibrary >> setDebugMessageCallback: aBlock [
	"[:source :type :id :severity :length :message :userParam | ]"
	| callback |
	callback := FFICallback
		signature: '<callback: void (*)(GLenum GLenum GLuint GLenum GLsizei GLchar* void*)>'
		block: aBlock.
	self debugMessageCallback: callback with: nil.
	context debugMessageCallback: callback.
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 6/20/2022 18:17'
}
GLLibrary >> shadingLanguageMajorMinor [

	| version |
	version := context version.
	(version < GL20 or: [version >= GLES10]) ifTrue: [^ #(0 0)].
	^ context version api shadingLanguageVersionStringToMajorMinor: self shadingLanguageVersionString
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:33'
}
GLLibrary >> shadingLanguageVersionString [

	^ self stringStateNamed: GL_SHADING_LANGUAGE_VERSION
]

{
	#category : #'context handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 09:51'
}
GLLibrary >> shouldClose [

	self deprecated.
	^ self context shouldClose
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 5/15/2021 12:59'
}
GLLibrary >> stringStateNamed: enum [

	| data |
	data := self getString: enum.
	data isNull ifTrue: [^ self checkForError].
	^ (data asType: ExternalType char) fromCString
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 5/14/2021 22:04'
}
GLLibrary >> stringStateNamed: enum at: index [

	| data |
	data := self getStringi: enum with: index.
	data isNull ifTrue: [^ self checkForError].
	^ (data asType: ExternalType char) fromCString
]

{
	#category : #'context handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 09:51'
}
GLLibrary >> swapBuffers [

	self deprecated.
	self context swapBuffers
]

{
	#category : #'context state',
	#'squeak_changestamp' : 'stlu 4/16/2021 09:51'
}
GLLibrary >> userData [

	^ self context userData
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:34'
}
GLLibrary >> vendorString [

	^ self stringStateNamed: GL_VENDOR
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 18:34'
}
GLLibrary >> versionString [

	^ self stringStateNamed: GL_VERSION
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:08'
}
GLLibrary >> viewport [

	| viewport |
	viewport := self integerStateNamed: GL_VIEWPORT ofSize: 4.
	^ Rectangle
		origin: viewport first @ viewport second
		extent: viewport third @ viewport fourth
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:05'
}
GLLibrary >> viewport: aRectangle [

	self
		viewport: aRectangle left
		with: aRectangle top
		with: aRectangle width
		with: aRectangle height
]

{
	#category : #'convencience api',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:07'
}
GLLibrary >> viewport: aRectangle during: aBlock [

	| previousViewport |
	previousViewport := self viewport.
	self viewport: aRectangle.
	aBlock value.
	self viewport: previousViewport
]
