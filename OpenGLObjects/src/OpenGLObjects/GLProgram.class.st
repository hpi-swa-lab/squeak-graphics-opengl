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
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/30/2021 03:32'
}
GLProgram >> assertCanExecute [

	self canExecute ifFalse: [
		AssertionFailure signal: self getInfoLog].
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 7/30/2021 02:32'
}
GLProgram >> attachShader: aShader [

	manager mainImp program: self attachShader: aShader.
	shaders add: aShader.
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
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/30/2021 03:20'
}
GLProgram >> canExecute [

	^ manager mainImp programCanExecute: self
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
	#'squeak_changestamp' : 'stlu 7/30/2021 02:35'
}
GLProgram >> detachShader: aShader [

	shaders remove: aShader.
	manager mainImp program: self detachShader: aShader.
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
	#'squeak_changestamp' : 'stlu 7/30/2021 02:45'
}
GLProgram >> getAttribute: parameterEnum [

	^ manager mainImp
		program: self
		getParameter: parameterEnum
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/30/2021 03:06'
}
GLProgram >> getBinary [

	 ^ manager mainImp getProgramBinary: self
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 7/30/2021 03:10'
}
GLProgram >> getInfoLog [

	^ manager mainImp getProgramInfoLog: self
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
	#'squeak_changestamp' : 'stlu 10/27/2020 12:17'
}
GLProgram >> lastLinkingSucceeded [

	^ (self getAttribute: GL_LINK_STATUS) = GL_TRUE
]

{
	#category : #actions,
	#'squeak_changestamp' : 'stlu 7/30/2021 03:42'
}
GLProgram >> link [

	manager mainImp linkProgram: self.
	self lastLinkingSucceeded
		ifTrue: [self linkingSucceeded]
		ifFalse: [self linkingFailed].
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
