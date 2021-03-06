Class {
	#name : #GLShader,
	#superclass : #GLObject,
	#instVars : [
		'source',
		'associatedMethod'
	],
	#category : #'OpenGLObjects-Shaders'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 2/8/2021 12:35'
}
GLShader class >> associatedMethod: aMethodReference [

	^ self create
		associatedMethod: aMethodReference;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:58'
}
GLShader class >> create [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		id: (manager creationImp createShaderID: self type)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:57'
}
GLShader class >> manager [

	^ GL objectState shaderManager
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/21/2020 20:43'
}
GLShader class >> source: glslSourceString [

	^ self create
		source: glslSourceString;
		compile;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/28/2020 17:51'
}
GLShader class >> type [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/7/2021 16:34'
}
GLShader >> associatedMethod [

	^ associatedMethod
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/8/2021 12:35'
}
GLShader >> associatedMethod: aMethodReference [

	associatedMethod := aMethodReference.
	self updateChangeNotification.
	self associatedMethodChanged
]

{
	#category : #'change notification',
	#'squeak_changestamp' : 'stlu 2/8/2021 13:48'
}
GLShader >> associatedMethodChanged [

	| compiledMethod |
	associatedMethod ifNil: [^ self].
	compiledMethod := associatedMethod compiledMethod ifNil: [^ self].
	
	self flag: #todo. "discerning of content type should be handled elsewhere"
	compiledMethod pragmas ifEmpty: [
		| glsl |
		self assert: compiledMethod numArgs = 0.
		glsl := compiledMethod valueWithReceiver: nil arguments: #().
		self compileSource: glsl]
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'stlu 12/14/2020 12:25'
}
GLShader >> compilationFailed [

	^ (GLCompileError shader: self infoLog: self getInfoLog) signal
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'stlu 2/7/2021 16:59'
}
GLShader >> compilationSucceeded [

	self changed: #shaderCompiled with: self
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'stlu 12/14/2020 12:27'
}
GLShader >> compile [

	GL compileShader: id.
	self lastCompilationSucceeded
		ifTrue: [self compilationSucceeded]
		ifFalse: [self compilationFailed]
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'stlu 2/8/2021 12:32'
}
GLShader >> compileSource: newSource [

	self source: newSource.
	self compile
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:50'
}
GLShader >> delete [

	manager mainImp deleteShader: self.
	super delete.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/7/2021 16:47'
}
GLShader >> disassociateMethod [

	self associatedMethod: nil
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:39'
}
GLShader >> getAttribute: attributeName [

	IntegerArray new: 1 during: [:result |
		GL getShaderiv: id with: attributeName with: result.
		^ result first]
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'zagto 12/15/2020 18:17'
}
GLShader >> getInfoLog [

	| length |
	length := self getInfoLogLength.
	length <= 1 ifTrue: [^ ''].
	ByteArray new: length during: [:result |
		GL getShaderInfoLog: id with: result size with: nil with: result.
		^ result allButLast "remove null-terminator" utf8Decoded withSqueakLineEndings]
]

{
	#category : #compilation,
	#'squeak_changestamp' : 'stlu 10/28/2020 14:40'
}
GLShader >> getInfoLogLength [

	^ self getAttribute: GL_INFO_LOG_LENGTH
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/16/2020 13:50'
}
GLShader >> getSource [

	ByteArray new: self getSourceLength during: [:result |
		GL getShaderSource: id with: result size with: nil with: result.
		^ result allButLast "remove null-terminator" utf8Decoded withSqueakLineEndings]
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 10/28/2020 14:42'
}
GLShader >> getSourceLength [

	^ self getAttribute: GL_SHADER_SOURCE_LENGTH
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 10/26/2020 13:07'
}
GLShader >> getType [

	^ self getAttribute: GL_SHADER_TYPE
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 2/7/2021 15:53'
}
GLShader >> initialize [

	super initialize.
	source := ''
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/26/2020 13:53'
}
GLShader >> isFlaggedForDeletion [

	^ (self getAttribute: GL_DELETE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:16'
}
GLShader >> isShader [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/26/2020 13:55'
}
GLShader >> lastCompilationSucceeded [

	^ (self getAttribute: GL_COMPILE_STATUS) = GL_TRUE
]

{
	#category : #'change notification',
	#'squeak_changestamp' : 'stlu 2/7/2021 16:52'
}
GLShader >> methodChanged: anEvent [

	| method |
	associatedMethod ifNil: [^ self updateChangeNotification].
	(anEvent isAdded or: [anEvent isModified]) ifFalse: [^ self].
	method := anEvent item methodReference ifNil: [^ self].
	associatedMethod = method ifFalse: [^ self].
	
	self associatedMethodChanged
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 9/9/2021 15:31'
}
GLShader >> setSource: aString [

	| utf8Bytes data arrayOfStrings |
	utf8Bytes := aString withUnixLineEndings utf8Encoded.
	
	"copy utf8 to heap memory since we need a pointable address"
	data := ExternalType uint8_t allocateExternal: utf8Bytes size + 1.
	1 to: utf8Bytes size do: [:index |
		data unsignedByteAt: index put: (utf8Bytes at: index)].
	data unsignedByteAt: utf8Bytes size + 1 put: 0.

	"store data address to first slot of array"
	arrayOfStrings := ExternalType string allocate: 1.
	arrayOfStrings at: 1 put: data.

	GL shaderSource: id with: 1 with: arrayOfStrings with: nil.
	
	"don't free data to avoid double free"
	arrayOfStrings free.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 13:00'
}
GLShader >> source [

	^ source
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/7/2021 16:41'
}
GLShader >> source: aString [

	self setSource: aString.
	source := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/28/2020 17:51'
}
GLShader >> type [

	^ self class type
]

{
	#category : #'change notification',
	#'squeak_changestamp' : 'stlu 2/7/2021 16:36'
}
GLShader >> updateChangeNotification [

	associatedMethod
		ifNil: [
			SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self]
		ifNotNil: [
			SystemChangeNotifier uniqueInstance
				notify: self
				ofSystemChangesOfItem: #method
				using: #methodChanged:]
]
