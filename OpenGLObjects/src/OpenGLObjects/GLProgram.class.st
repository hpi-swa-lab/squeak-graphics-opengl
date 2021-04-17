Class {
	#name : #GLProgram,
	#superclass : #GLObject,
	#instVars : [
		'shaders',
		'interfaces'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/3/2020 15:38'
}
GLProgram class >> allocate [

	^ GL createProgram
]

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:52'
}
GLProgram class >> allocate: n in: anIntegerArray [

	1 to: n do: [:i |
		anIntegerArray at: i put: self allocate]
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 19:50'
}
GLProgram class >> bound [

	^ GLObjectBindings current program
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/8/2021 12:55'
}
GLProgram class >> shaders: aCollection [

	^ self create
		attachShaders: aCollection;
		link;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/3/2020 19:05'
}
GLProgram class >> target [

	^ GL_ACTIVE_PROGRAM
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:02'
}
GLProgram class >> unbind [

	GL useProgram: GL_NONE.
	GLObjectBindings current program: nil
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/8/2021 12:55'
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
	#timestamp : 'stlu 2/8/2021 12:54'
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
	#timestamp : 'stlu 12/22/2020 14:04'
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
	#timestamp : 'stlu 11/3/2020 15:36'
}
GLProgram >> attachShader: glShader [

	GL attachShader: id with: glShader id.
	shaders add: glShader
]

{
	#category : #actions,
	#timestamp : 'stlu 2/8/2021 12:56'
}
GLProgram >> attachShaders: aCollection [

	aCollection do: [:shader |
		self attachShader: shader]
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 19:59'
}
GLProgram >> bind [

	GL useProgram: id.
	GLObjectBindings current program: self
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 22:07'
}
GLProgram >> boundDuring: aBlock [

	| previous |
	(previous := self class bound) = self ifTrue: [^ aBlock value].
	self bind.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbind]
			ifNotNil: [previous bind]]
]

{
	#category : #actions,
	#timestamp : 'stlu 12/8/2020 16:30'
}
GLProgram >> detachShader: aShader [

	shaders remove: aShader.
	GL detachShader: id with: aShader id.
]

{
	#category : #actions,
	#timestamp : 'stlu 12/13/2020 15:24'
}
GLProgram >> detachShaders [

	shaders asArray "don't change collection while iterating" do: [:shader |
		self detachShader: shader]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/3/2020 16:55'
}
GLProgram >> getAttribute: attributeName [

	IntegerArray new: 1 during: [:result |
		GL getProgramiv: id with: attributeName with: result.
		^ result first]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/3/2020 15:36'
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
	#timestamp : 'stlu 12/8/2020 17:27'
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
	#timestamp : 'stlu 10/28/2020 14:37'
}
GLProgram >> getInfoLogLength [

	^ self getAttribute: GL_INFO_LOG_LENGTH
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:27'
}
GLProgram >> getNumAttributes [

	^ self getAttribute: GL_ACTIVE_ATTRIBUTES
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:28'
}
GLProgram >> getNumUniforms [

	^ self getAttribute: GL_ACTIVE_UNIFORMS
]

{
	#category : #initialization,
	#timestamp : 'stlu 12/13/2020 15:59'
}
GLProgram >> initialize [

	super initialize.
	shaders := Set new
]

{
	#category : #'accessing-resources',
	#timestamp : 'stlu 12/16/2020 19:59'
}
GLProgram >> inputs [

	^ interfaces inputs
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:12'
}
GLProgram >> isAllocated [

	^ GL isProgram: id
]

{
	#category : #testing,
	#timestamp : 'stlu 10/27/2020 12:17'
}
GLProgram >> isFlaggedForDeletion [

	^ (self getAttribute: GL_DELETE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#timestamp : 'stlu 10/29/2020 12:16'
}
GLProgram >> isProgram [

	^ true
]

{
	#category : #testing,
	#timestamp : 'stlu 11/3/2020 15:37'
}
GLProgram >> isValid [

	GL validateProgram: id.
	^ (self getAttribute: GL_VALIDATE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#timestamp : 'stlu 10/27/2020 12:17'
}
GLProgram >> lastLinkingSucceeded [

	^ (self getAttribute: GL_LINK_STATUS) = GL_TRUE
]

{
	#category : #actions,
	#timestamp : 'stlu 12/14/2020 12:29'
}
GLProgram >> link [

	GL linkProgram: id.
	self lastLinkingSucceeded
		ifTrue: [self linkingSucceeded]
		ifFalse: [self linkingFailed]
]

{
	#category : #'error handling',
	#timestamp : 'stlu 12/14/2020 12:23'
}
GLProgram >> linkingFailed [

	^ (GLLinkError program: self infoLog: self getInfoLog) signal
]

{
	#category : #actions,
	#timestamp : 'stlu 12/16/2020 19:59'
}
GLProgram >> linkingSucceeded [

	interfaces := GLProgramInterfaces program: self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLProgram >> shaders [

	^ shaders
]

{
	#category : #'accessing-resources',
	#timestamp : 'stlu 12/16/2020 19:59'
}
GLProgram >> uniforms [

	^ interfaces uniforms
]

{
	#category : #updating,
	#timestamp : 'stlu 2/7/2021 15:39'
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
	#timestamp : 'stlu 3/14/2021 19:33'
}
GLProgram >> useDuring: aBlock [

	self flag: #todo. "deprecate"
	self boundDuring: aBlock
]

{
	#category : #actions,
	#timestamp : 'stlu 12/14/2020 12:17'
}
GLProgram >> validate [

	self isAllocated ifFalse: [^ false].
	self isValid ifFalse: [
		self notify: self getInfoLog.
		^ false].
	^ true
]
