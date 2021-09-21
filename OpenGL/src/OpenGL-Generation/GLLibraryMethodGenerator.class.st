Class {
	#name : #GLLibraryMethodGenerator,
	#superclass : #GLRegistryGenerator,
	#instVars : [
		'targetClass',
		'shouldCompileDescriptionPragmas',
		'shouldCompileDefinitionPragmas'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/15/2021 14:07'
}
GLLibraryMethodGenerator >> commandCategory: aCommand [

	aCommand hasDefinitions ifFalse: [^ #'commands - unused'].
	aCommand isEverRemoved ifTrue: [^ #'commands - removed'].
	^ aCommand isOnlyDefinedInExtensions
		ifTrue: [#'commands - extensions']
		ifFalse: [#'commands']
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/21/2021 11:13'
}
GLLibraryMethodGenerator >> commandSource: aCommand [

	^ String streamContents: [:stream |
		self printCommandSignature: aCommand on: stream.
		stream cr.
		shouldCompileDefinitionPragmas ifTrue: [
			self printDefinitionPragmas: aCommand on: stream.
			aCommand hasDefinitions ifTrue: [stream cr]].
		shouldCompileDescriptionPragmas ifTrue: [
			self printCommandPragmas: aCommand on: stream.
			stream cr].
		stream cr; tab.
		aCommand printFFIPragmaOn: stream.
		stream cr; tab.
		stream nextPutAll: '^ self externalCallFailed']
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/15/2021 14:08'
}
GLLibraryMethodGenerator >> enumCategory: anEnum [

	anEnum hasDefinitions ifFalse: [^ #'enums - unused'].
	anEnum isEverRemoved ifTrue: [^ #'enums - removed'].
	^ anEnum isOnlyDefinedInExtensions
		ifTrue: [#'enums - extensions']
		ifFalse: [#'enums']
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 12/28/2020 18:17'
}
GLLibraryMethodGenerator >> enumSignature: anEnum [

	| name |
	name := anEnum name.
	^ name fourth canBeIdentifierInitial
		ifTrue: [name allButFirst: 3 "remove GL_* prefix"]
		ifFalse: [name]
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/21/2021 11:13'
}
GLLibraryMethodGenerator >> enumSource: anEnum [

	^ String streamContents: [:stream |
		self printEnumSignature: anEnum on: stream.
		stream cr.
		shouldCompileDefinitionPragmas ifTrue: [
			self printDefinitionPragmas: anEnum on: stream.
			anEnum hasDefinitions ifTrue: [stream cr]].
		shouldCompileDescriptionPragmas ifTrue: [
			self printEnumPragmas: anEnum on: stream].
		stream
			cr; tab;
			nextPutAll: '^ ';
			nextPutAll: anEnum name]
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 17:20'
}
GLLibraryMethodGenerator >> generate: aRegistry [

	self generateRegistry: aRegistry
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:47'
}
GLLibraryMethodGenerator >> generateCommand: aCommand [

	aCommand numParameters >= 16 ifTrue: [
		"Cannot generate methods with more than 15 arguments"
		^ Transcript showln: 'Too many arguments (', aCommand numParameters , '): ' , aCommand name].
	
	self
		compile: (self commandSource: aCommand)
		classified: (self commandCategory: aCommand)
		into: self targetClass.
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 20:19'
}
GLLibraryMethodGenerator >> generateCommands: aCollection [

	'Compile commands'
		displayProgressFrom: 0 to: aCollection size
		during: [:bar |
			aCollection asArray withIndexDo: [:each :i |
				self generateCommand: each.
				bar value: i]].
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:32'
}
GLLibraryMethodGenerator >> generateEnum: anEnum [

	self
		compile: (self enumSource: anEnum)
		classified: (self enumCategory: anEnum)
		into: self targetClass
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 20:19'
}
GLLibraryMethodGenerator >> generateEnums: aCollection [

	'Compile enums'
		displayProgressFrom: 0 to: aCollection size
		during: [:bar |
			aCollection asArray withIndexDo: [:each :i |
				self generateEnum: each.
				bar value: i]].
]

{
	#category : #generation,
	#'squeak_changestamp' : 'stlu 4/12/2021 20:20'
}
GLLibraryMethodGenerator >> generateRegistry: aRegistry [

	self generateCommands: aRegistry commands.
	self generateEnums: aRegistry enums.
	self removeNonGeneratedMethodsIn: self targetClass.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/21/2021 10:58'
}
GLLibraryMethodGenerator >> initialize [

	super initialize.
	targetClass := self environment at: #GLLibraryMethods ifAbsent: [].
	
	shouldCompileDefinitionPragmas := true.
	shouldCompileDescriptionPragmas := true.
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/20/2021 17:47'
}
GLLibraryMethodGenerator >> printCommandPragmas: aCommand on: aStream [

	aStream
		cr; tab;
		nextPutAll: '<glCommand: ';
		store: aCommand name asSymbol;
		nextPut: $>.
	
	aCommand aliases ifNotEmpty: [:aliases |
		aStream
			cr; tab;
			nextPutAll: '<glAliases: ';
			store: (aliases collect: [:alias | alias asSymbol] as: Array);
			nextPut: $>].
	
	aStream
		cr; tab;
		nextPutAll: '<glReturn: ';
		store: aCommand returnType asString.
	aCommand returnGroup ifNotNil: [:group |
		aStream
			nextPutAll: ' group: ';
			store: group asSymbol].
	aStream nextPut: $>.
	
	aCommand parameters do: [:param |
		aStream
			cr; tab;
			nextPutAll: '<glArg: ';
			store: param name asString;
			nextPutAll: ' type: ';
			store: param type asString.
		param group ifNotNil: [:group |
			aStream
				nextPutAll: ' group: ';
				store: group asSymbol].
		param length ifNotNil: [:length |
			aStream
				nextPutAll: ' size: ';
				store: length].
		aStream nextPut: $>].
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 3/3/2021 15:07'
}
GLLibraryMethodGenerator >> printCommandSignature: aCommand on: aStream [

	| selector firstLowerIndex lowerUpTo |
	selector := aCommand name allButFirst: 2. "remove 'gl' prefix"
	firstLowerIndex := selector findFirst: [:each | each isLowercase].
	lowerUpTo := firstLowerIndex >= 3
					ifTrue: [firstLowerIndex - 2]
					ifFalse: [
						firstLowerIndex <= 0
							ifTrue: [selector size + 1]
							ifFalse: [firstLowerIndex - 1]].
	
	aStream
		nextPutAll: (selector copyFrom: 1 to: lowerUpTo) translateToLowercase;
		next: selector size - lowerUpTo putAll: selector startingAt: lowerUpTo + 1.
	
	aCommand parameters ifNotEmpty: [aStream nextPutAll: ': '.].
	aCommand parameters
		do: [:param | aStream nextPutAll: param name]
		separatedBy: [aStream nextPutAll: ' with: '].
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/20/2021 17:50'
}
GLLibraryMethodGenerator >> printDefinitionPragmas: aRegistryElement on: aStream [

	aRegistryElement definitions do: [:definition |
		aStream cr; tab.
		definition printPragmaOn: aStream].
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 9/21/2021 11:18'
}
GLLibraryMethodGenerator >> printEnumPragmas: anEnum on: aStream [

	aStream
		cr; tab;
		nextPutAll: '<glEnum: ';
		store: anEnum name asSymbol;
		nextPut: $>.
	
	anEnum aliases ifNotEmpty: [:aliases |
		aStream
			cr; tab;
			nextPutAll: '<glAliases: ';
			store: (aliases collect: [:alias | alias asSymbol] as: Array);
			nextPut: $>].
	
	aStream
		cr; tab;
		nextPutAll: '<glValue: ';
		nextPutAll: anEnum valueString;
		nextPut: $>.
	
	anEnum groups ifNotEmpty: [:groups |
		| groupArray |
		groupArray := groups collect: [:group | group asSymbol] as: Array.
		groupArray sort.
		aStream
			nextPutAll: '<glGroups: ';
			store: groupArray;
			nextPut: $>].
]

{
	#category : #'method sources',
	#'squeak_changestamp' : 'stlu 4/13/2021 12:22'
}
GLLibraryMethodGenerator >> printEnumSignature: anEnum on: aStream [

	aStream nextPutAll: (self enumSignature: anEnum)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 17:33'
}
GLLibraryMethodGenerator >> shouldCompileDefinitionPragmas [

	^ shouldCompileDefinitionPragmas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 17:33'
}
GLLibraryMethodGenerator >> shouldCompileDefinitionPragmas: anObject [

	shouldCompileDefinitionPragmas := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 17:33'
}
GLLibraryMethodGenerator >> shouldCompileDescriptionPragmas [

	^ shouldCompileDescriptionPragmas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 17:33'
}
GLLibraryMethodGenerator >> shouldCompileDescriptionPragmas: anObject [

	shouldCompileDescriptionPragmas := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:16'
}
GLLibraryMethodGenerator >> targetClass [

	^ targetClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:16'
}
GLLibraryMethodGenerator >> targetClass: anObject [

	targetClass := anObject
]
