Class {
	#name : #GLShader,
	#superclass : #GLObject,
	#instVars : [
		'source',
		'associatedMethod'
	],
	#category : #'OpenGLObjects-Shaders',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/3/2020 15:40'
}
GLShader class >> allocate [

	^ GL createShader: self type
]

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:53'
}
GLShader class >> allocate: n in: anIntegerArray [

	1 to: n do: [:i |
		anIntegerArray at: i put: self allocate]
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/8/2021 12:35'
}
GLShader class >> associatedMethod: aMethodReference [

	^ self create
		associatedMethod: aMethodReference;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/21/2020 20:43'
}
GLShader class >> source: glslSourceString [

	^ self create
		source: glslSourceString;
		compile;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/28/2020 17:51'
}
GLShader class >> type [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/7/2021 16:34'
}
GLShader >> associatedMethod [

	^ associatedMethod
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/8/2021 12:35'
}
GLShader >> associatedMethod: aMethodReference [

	associatedMethod := aMethodReference.
	self updateChangeNotification.
	self associatedMethodChanged
]

{
	#category : #'change notification',
	#timestamp : 'stlu 2/8/2021 13:48'
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
	#timestamp : 'stlu 12/14/2020 12:25'
}
GLShader >> compilationFailed [

	^ (GLCompileError shader: self infoLog: self getInfoLog) signal
]

{
	#category : #compilation,
	#timestamp : 'stlu 2/7/2021 16:59'
}
GLShader >> compilationSucceeded [

	self changed: #shaderCompiled with: self
]

{
	#category : #compilation,
	#timestamp : 'stlu 12/14/2020 12:27'
}
GLShader >> compile [

	GL compileShader: id.
	self lastCompilationSucceeded
		ifTrue: [self compilationSucceeded]
		ifFalse: [self compilationFailed]
]

{
	#category : #compilation,
	#timestamp : 'stlu 2/8/2021 12:32'
}
GLShader >> compileSource: newSource [

	self source: newSource.
	self compile
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/3/2020 15:39'
}
GLShader >> delete [

	GL deleteShader: id
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/7/2021 16:47'
}
GLShader >> disassociateMethod [

	self associatedMethod: nil
]

{
	#category : #private,
	#timestamp : 'stlu 11/3/2020 15:39'
}
GLShader >> getAttribute: attributeName [

	IntegerArray new: 1 during: [:result |
		GL getShaderiv: id with: attributeName with: result.
		^ result first]
]

{
	#category : #compilation,
	#timestamp : 'zagto 12/15/2020 18:17'
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
	#timestamp : 'stlu 10/28/2020 14:40'
}
GLShader >> getInfoLogLength [

	^ self getAttribute: GL_INFO_LOG_LENGTH
]

{
	#category : #private,
	#timestamp : 'stlu 11/16/2020 13:50'
}
GLShader >> getSource [

	ByteArray new: self getSourceLength during: [:result |
		GL getShaderSource: id with: result size with: nil with: result.
		^ result allButLast "remove null-terminator" utf8Decoded withSqueakLineEndings]
]

{
	#category : #private,
	#timestamp : 'stlu 10/28/2020 14:42'
}
GLShader >> getSourceLength [

	^ self getAttribute: GL_SHADER_SOURCE_LENGTH
]

{
	#category : #private,
	#timestamp : 'stlu 10/26/2020 13:07'
}
GLShader >> getType [

	^ self getAttribute: GL_SHADER_TYPE
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 2/7/2021 15:53'
}
GLShader >> initialize [

	super initialize.
	source := ''
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:12'
}
GLShader >> isAllocated [

	^ GL isShader: id
]

{
	#category : #testing,
	#timestamp : 'stlu 10/26/2020 13:53'
}
GLShader >> isFlaggedForDeletion [

	^ (self getAttribute: GL_DELETE_STATUS) = GL_TRUE
]

{
	#category : #testing,
	#timestamp : 'stlu 10/29/2020 12:16'
}
GLShader >> isShader [

	^ true
]

{
	#category : #testing,
	#timestamp : 'stlu 10/26/2020 13:55'
}
GLShader >> lastCompilationSucceeded [

	^ (self getAttribute: GL_COMPILE_STATUS) = GL_TRUE
]

{
	#category : #'change notification',
	#timestamp : 'stlu 2/7/2021 16:52'
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
	#timestamp : 'stlu 2/7/2021 15:32'
}
GLShader >> setSource: aString [

	| utf8Bytes |
	utf8Bytes := aString withUnixLineEndings utf8Encoded.
	
	ExternalData allocate: utf8Bytes size + 1 type: ExternalType string do: [:data |
		| arrayOfStrings |
		1 to: utf8Bytes size do: [:index |
			data getHandle byteAt: index put: (utf8Bytes at: index)].
		data getHandle byteAt: utf8Bytes size + 1 put: 0.
	
		self flag: #todo. "Complicated FFI interaction"	
		arrayOfStrings := (ByteArray new: ExternalType void asPointerType byteSize)
						 	pointerAt: 1 put: data getHandle;
							yourself.
	
		GL shaderSource: id with: 1 with: arrayOfStrings with: nil]
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 13:00'
}
GLShader >> source [

	^ source
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/7/2021 16:41'
}
GLShader >> source: aString [

	self setSource: aString.
	source := aString
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/28/2020 17:51'
}
GLShader >> type [

	^ self class type
]

{
	#category : #'change notification',
	#timestamp : 'stlu 2/7/2021 16:36'
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
