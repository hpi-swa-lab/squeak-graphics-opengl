Class {
	#name : #GLProgram,
	#superclass : #GLObject,
	#instVars : [
		'shaders',
		'interfaces'
	],
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:03'
}
GLProgram class >> bound [

	^ self manager currentProgram
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:32'
}
GLProgram class >> create [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		id: (manager creationImp createProgramID)
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:05'
}
GLProgram class >> current [

	^ self bound
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 23:01'
}
GLProgram class >> manager [

	^ GL objectState programManager
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 2/8/2021 12:55'
}
GLProgram class >> shaders: aCollection [

	^ self create
		attachShaders: aCollection;
		link;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/3/2020 19:05'
}
GLProgram class >> target [

	^ GL_ACTIVE_PROGRAM
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:01'
}
GLProgram class >> unbind [

	self manager useProgram: nil
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 2/8/2021 12:55'
}
GLProgram class >> vertexShader: vertexShader fragmentShader: fragmentShader [

	^ self create
		attachShader: vertexShader;
		attachShader: fragmentShader;
		link;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 2/8/2021 12:54'
}
GLProgram class >> vertexShaderMethod: vertexMethodReference fragmentShaderMethod: fragmentMethodReference [

	| vertexShader fragmentShader instance |
	vertexShader := GLVertexShader associatedMethod: vertexMethodReference.
	fragmentShader := GLFragmentShader associatedMethod: fragmentMethodReference.
	
	instance := self create.
	instance
		attachShader: vertexShader;
		attachShader: fragmentShader;
		link.
	
	^ instance
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/22/2020 14:04'
}
GLProgram class >> vertexSource: vertexGLSLString fragmentSource: fragmentGLSLString [

	| vertexShader fragmentShader instance |
	vertexShader := GLVertexShader source: vertexGLSLString.
	fragmentShader := GLFragmentShader source: fragmentGLSLString.
	
	instance := self create.
	instance
		attachShader: vertexShader;
		attachShader: fragmentShader;
		link.
	
	vertexShader delete.
	fragmentShader delete.
	
	^ instance
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:36'
}
GLProgram >> attachShader: glShader [

	GL attachShader: id with: glShader id.
	shaders add: glShader
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 2/8/2021 12:56'
}
GLProgram >> attachShaders: aCollection [

	aCollection do: [:shader |
		self attachShader: shader]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:04'
}
GLProgram >> bind [

	manager useProgram: self.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:04'
}
GLProgram >> boundDuring: aBlock [

	^ manager useProgram: self during: aBlock
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:39'
}
GLProgram >> delete [

	manager mainImp deleteProgram: self.
	super delete.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 12/8/2020 16:30'
}
GLProgram >> detachShader: aShader [

	shaders remove: aShader.
	GL detachShader: id with: aShader id.
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 12/13/2020 15:24'
}
GLProgram >> detachShaders [

	shaders asArray "don't change collection while iterating" do: [:shader |
		self detachShader: shader]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/3/2020 16:55'
}
GLProgram >> getAttribute: attributeName [

	IntegerArray new: 1 during: [:result |
		GL getProgramiv: id with: attributeName with: result.
		^ result first]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:36'
}
GLProgram >> getBinary [

	| binaryLength |
	binaryLength := self getAttribute: GL_PROGRAM_BINARY_LENGTH.
	binaryLength <= 0 ifTrue: [^ #[]].
	IntegerArray new: 1 during: [:pFormat |
		ByteArray new: binaryLength during: [:result |
			GL getProgramBinary: id with: binaryLength with: nil with: pFormat with: result.
			^  pFormat first -> result]]
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 12/8/2020 17:27'
}
GLProgram >> getInfoLog [

	| length |
	length := self getInfoLogLength.
	length < 0 ifTrue: [^ ''].
	ByteArray new: length during: [:result |
		GL getProgramInfoLog: id with: result size with: nil with: result.
		^ result allButLast "remove null-terminator" utf8Decoded withSqueakLineEndings]
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 10/28/2020 14:37'
}
GLProgram >> getInfoLogLength [

	^ self getAttribute: GL_INFO_LOG_LENGTH
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:27'
}
GLProgram >> getNumAttributes [

	^ self getAttribute: GL_ACTIVE_ATTRIBUTES
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:28'
}
GLProgram >> getNumUniforms [

	^ self getAttribute: GL_ACTIVE_UNIFORMS
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/13/2020 15:59'
}
GLProgram >> initialize [

	super initialize.
	shaders := Set new
]

{
	#category : #'accessing-resources',
	#'squeak_changestamp' : 'stlu 12/16/2020 19:59'
}
GLProgram >> inputs [

	^ interfaces inputs
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:17'
}
GLProgram >> isFlaggedForDeletion [

	^ (self getAttribute: GL_DELETE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:16'
}
GLProgram >> isProgram [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:37'
}
GLProgram >> isValid [

	GL validateProgram: id.
	^ (self getAttribute: GL_VALIDATE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:17'
}
GLProgram >> lastLinkingSucceeded [

	^ (self getAttribute: GL_LINK_STATUS) = GL_TRUE
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 12/14/2020 12:29'
}
GLProgram >> link [

	GL linkProgram: id.
	self lastLinkingSucceeded
		ifTrue: [self linkingSucceeded]
		ifFalse: [self linkingFailed]
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 12/14/2020 12:23'
}
GLProgram >> linkingFailed [

	^ (GLLinkError program: self infoLog: self getInfoLog) signal
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 12/16/2020 19:59'
}
GLProgram >> linkingSucceeded [

	interfaces := GLProgramInterfaces program: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLProgram >> shaders [

	^ shaders
]

{
	#category : #'accessing-resources',
	#'squeak_changestamp' : 'stlu 12/16/2020 19:59'
}
GLProgram >> uniforms [

	^ interfaces uniforms
]

{
	#category : #updating,
	#'squeak_changestamp' : 'stlu 2/7/2021 15:39'
}
GLProgram >> update: anAspect with: anObject [
	"Receive a change notice from an object of whom the receiver is a 
	dependent. The default behavior is to call update:,
	which by default does nothing; a subclass might want 
	to change itself in some way."

	^ self update: anAspect
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:04'
}
GLProgram >> use [

	self bind.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:04'
}
GLProgram >> useDuring: aBlock [

	^ self boundDuring: aBlock
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:56'
}
GLProgram >> validate [

	self hasValidID ifFalse: [
		self notify: 'ID does not correspond to a program object'.
		^ false].
	self isValid ifFalse: [
		self notify: self getInfoLog.
		^ false].
	^ true
]
