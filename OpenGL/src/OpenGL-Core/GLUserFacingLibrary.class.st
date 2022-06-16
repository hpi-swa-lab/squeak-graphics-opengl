"
I decorate a GLLibrary to automatically check API calls against a specified version.
If the API call is not available in the given version, an error is raised.
"
Class {
	#name : #GLUserFacingLibrary,
	#superclass : #GLLazyDecoratorLibrary,
	#instVars : [
		'checksForErrors',
		'requiredInterfaces',
		'tracesCommands',
		'commandTrace'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/16/2021 17:29'
}
GLUserFacingLibrary class >> new [

	^ self newSubclass basicNew initialize; yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:52'
}
GLUserFacingLibrary >> checksForErrors [

	^ checksForErrors
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:47'
}
GLUserFacingLibrary >> checksForErrors: aBoolean [

	checksForErrors = aBoolean ifFalse: [
		checksForErrors := aBoolean.
		self reset].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:46'
}
GLUserFacingLibrary >> commandTrace [

	^ commandTrace
]

{
	#category : #api,
	#'squeak_changestamp' : 'stlu 5/23/2022 15:03'
}
GLUserFacingLibrary >> getError [
	"Manual passtrhough. Do not check the error checking for errors."
	^ library getError
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:49'
}
GLUserFacingLibrary >> initialize [

	super initialize.
	requiredInterfaces := #().
	checksForErrors := false.
	tracesCommands := false.
	
	commandTrace := OrderedCollection new.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:45'
}
GLUserFacingLibrary >> install: aSelector [

	| registryMethod |
	registryMethod := GLLibraryMethods compiledMethodAt: aSelector ifAbsent: [^ nil].
	
	self class
		compileSilently: (self sourceFor: registryMethod)
		classified: '*autogenerated'.
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:48'
}
GLUserFacingLibrary >> interfaceError: aSymbol [

	^ self error: aSymbol , ' is not available in required interfaces'
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 14:57'
}
GLUserFacingLibrary >> printLibrarySend: pragmas tokens: sigParts on: aStream [

	| argPragmas numArgs |
	argPragmas := pragmas select: [:pragma |
		pragma keyword beginsWith: 'glArg'].
	numArgs := argPragmas size.
	
	numArgs = 0 ifTrue: [
		aStream space; nextPutAll: sigParts first.
		^ self].
	
	1 to: numArgs do: [:argIndex |
		| selPart argName argPragma argType |
		selPart := sigParts at: argIndex * 2 - 1.
		argName := sigParts at: argIndex * 2.
		argPragma := argPragmas at: argIndex.
		argType := argPragma argumentAt: 2.
		aStream
			cr; tab; tab;
			nextPutAll: selPart;
			space;
			nextPutAll: argName.
		(self typesToUnpack includes: argType) ifTrue: [
			aStream nextPutAll: ' value']].
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 17:14'
}
GLUserFacingLibrary >> printSourceFor: registryMethod on: aStream [

	| pragmas signature tokens isEnum isCommand apiPragma glName returnsImmediately |
	"assumption: method signature is on a single line ended by a carriage return."
	signature := registryMethod getSource asString copyUpTo: Character cr.
	pragmas := registryMethod pragmas.
	
	aStream nextPutAll: signature; cr; cr; tab.
	
	isEnum := false.
	isCommand := false.
	pragmas do: [:pragma |
		pragma keyword = #glEnum: ifTrue: [
			isEnum := true.
			apiPragma := pragma].
		pragma keyword = #glCommand: ifTrue: [
			isCommand := true.
			apiPragma := pragma]].
	(isEnum or: [isCommand]) ifFalse: [^ nil].
	glName := apiPragma arguments first.
	
	(requiredInterfaces anySatisfy: [:interface |
		"throw error when calling a method not covered by interfaces"
		(interface availableAccordingToPragmas: pragmas) not]) ifTrue: [
			aStream
				nextPutAll: '^ self interfaceError: ';
				store: glName.
			^ self].
	
	isEnum ifTrue: [
		"quick-return enum values"
		aStream
			nextPutAll: '^ ';
			nextPutAll: apiPragma arguments first.
		^ self].
	
	returnsImmediately := (checksForErrors or: [tracesCommands]) not.
	tokens := signature findTokens.
	
	returnsImmediately ifFalse: [
		aStream nextPutAll: '| result |'; cr; tab].
	
	tracesCommands ifTrue: [
		aStream
			nextPutAll: 'commandTrace addLast: ';
			store: glName;
			nextPutAll: '; addLast: Time utcMicrosecondClock.';
			cr; tab].
	
	returnsImmediately ifTrue: [
		aStream nextPutAll: '^ library'.
		self printLibrarySend: pragmas tokens: tokens on: aStream.
		^ self].
	
	aStream nextPutAll: 'result := library'.
	self printLibrarySend: pragmas tokens: tokens on: aStream.
	aStream nextPut: $..
	
	tracesCommands ifTrue: [
		aStream cr; tab.
		aStream nextPutAll: 'commandTrace addLast: Time utcMicrosecondClock.'].
	
	checksForErrors ifTrue: [
		aStream cr; tab.
		aStream nextPutAll: 'library checkForError.'].
	
	aStream cr; tab.
	aStream nextPutAll: '^ result'.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:01'
}
GLUserFacingLibrary >> requireContextInterface [

	self requireInterface: context interface.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:07'
}
GLUserFacingLibrary >> requireExtensions: collectionOfSymbols [

	self requireInterface: (GLInterface extensions: collectionOfSymbols).
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 13:57'
}
GLUserFacingLibrary >> requireInterface: aGLInterface [

	requiredInterfaces := requiredInterfaces copyWith: aGLInterface.
	self reset.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:07'
}
GLUserFacingLibrary >> requireVersion: targetVersion [

	self requireInterface: (GLInterface version: targetVersion).
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:06'
}
GLUserFacingLibrary >> requireVersion: targetVersionOrNil extensions: collectionOfSymbolsOrNil [

	self requireInterface: (GLInterface version: targetVersionOrNil extensions: collectionOfSymbolsOrNil).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:45'
}
GLUserFacingLibrary >> requiredInterfaces [

	^ requiredInterfaces
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:47'
}
GLUserFacingLibrary >> requiredInterfaces: collectionOfInterfaces [

	requiredInterfaces = collectionOfInterfaces ifFalse: [
		requiredInterfaces := collectionOfInterfaces.
		self reset].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/24/2022 17:27'
}
GLUserFacingLibrary >> resetCommandTrace [

	commandTrace ifNotNil: [
		commandTrace reset].
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:33'
}
GLUserFacingLibrary >> sourceFor: registryMethod [

	^ String streamContents: [:stream |
		self printSourceFor: registryMethod on: stream]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:46'
}
GLUserFacingLibrary >> tracesCommands [

	^ tracesCommands
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:47'
}
GLUserFacingLibrary >> tracesCommands: aBoolean [

	tracesCommands = aBoolean ifFalse: [
		tracesCommands := aBoolean.
		self reset].
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 5/24/2022 14:57'
}
GLUserFacingLibrary >> typesToUnpack [

	"we are very liberal with the types we unpack using #value.
	reason being that enums can also be valid inputs for arguments with these more generic types.
	this should not pose a problem, since all other valid objects are idempotent to #value.
	may even need to be expanded in the future."
	^ #( 'GLenum' 'GLbitfield' 'GLint' 'GLuint' 'GLboolean' )
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 13:55'
}
GLUserFacingLibrary >> withErrorChecking [

	self deprecated: 'Use #checksForErrors: instead.'.
	self checksForErrors: true.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:02'
}
GLUserFacingLibrary >> withVersionChecking [

	self deprecated: 'Use #requireContextInterface instead.'.
	self requireContextInterface.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:05'
}
GLUserFacingLibrary >> withVersionChecking: targetVersionOrNil [

	self deprecated: 'Use #requireVersion: instead.'.
	self requireVersion: targetVersionOrNil.
]

{
	#category : #interfaces,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:05'
}
GLUserFacingLibrary >> withVersionChecking: targetVersionOrNil extensions: collectionOfSymbolsOrNil [

	self deprecated: 'Use #requireVersion:extensions: instead.'.
	self requireVersion: targetVersionOrNil extensions: collectionOfSymbolsOrNil.
]