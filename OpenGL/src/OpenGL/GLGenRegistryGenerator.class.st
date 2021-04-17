Class {
	#name : #GLGenRegistryGenerator,
	#superclass : #GLGenGenerator,
	#instVars : [
		'targetClass'
	],
	#category : #'OpenGL-Generation',
	#commentStamp : ''
}

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:14'
}
GLGenRegistryGenerator >> commandCategory: aCommand [

	aCommand definitions ifEmpty: [^ #'commands - unused'].
	^ aCommand isOnlyDefinedInExtensions
		ifTrue: [#'commands - extensions']
		ifFalse: [#'commands']
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:28'
}
GLGenRegistryGenerator >> commandSource: aCommand [

	^ String streamContents: [:stream |
		self printCommandSignature: aCommand on: stream.
		stream cr; cr; tab.
		self printDefinitionPragmas: aCommand on: stream.
		self printCommandPragmas: aCommand on: stream.
		stream cr; tab.
		aCommand printFFIPragmaOn: stream.
		stream cr; tab.
		stream nextPutAll: '^ self externalCallFailed']
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:14'
}
GLGenRegistryGenerator >> enumCategory: anEnum [

	anEnum definitions ifEmpty: [^ #'enums - unused'].
	^ anEnum isOnlyDefinedInExtensions
		ifTrue: [#'enums - extensions']
		ifFalse: [#'enums']
]

{
	#category : #'method sources',
	#timestamp : 'stlu 12/28/2020 18:17'
}
GLGenRegistryGenerator >> enumSignature: anEnum [

	| name |
	name := anEnum name.
	^ name fourth canBeIdentifierInitial
		ifTrue: [name allButFirst: 3 "remove GL_* prefix"]
		ifFalse: [name]
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:31'
}
GLGenRegistryGenerator >> enumSource: anEnum [

	^ String streamContents: [:stream |
		self printEnumSignature: anEnum on: stream.
		stream cr; cr; tab.
		self printDefinitionPragmas: anEnum on: stream.
		self printEnumPragmas: anEnum on: stream.
		stream
			nextPutAll: '^ ';
			nextPutAll: anEnum name]
]

{
	#category : #generation,
	#timestamp : 'stlu 4/12/2021 17:20'
}
GLGenRegistryGenerator >> generate: aRegistry [

	self generateRegistry: aRegistry
]

{
	#category : #generation,
	#timestamp : 'stlu 4/12/2021 18:47'
}
GLGenRegistryGenerator >> generateCommand: aCommand [

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
	#timestamp : 'stlu 4/12/2021 20:19'
}
GLGenRegistryGenerator >> generateCommands: aCollection [

	'Compile commands'
		displayProgressFrom: 0 to: aCollection size
		during: [:bar |
			aCollection asArray withIndexDo: [:each :i |
				self generateCommand: each.
				bar value: i]].
]

{
	#category : #generation,
	#timestamp : 'stlu 4/12/2021 18:32'
}
GLGenRegistryGenerator >> generateEnum: anEnum [

	self
		compile: (self enumSource: anEnum)
		classified: (self enumCategory: anEnum)
		into: self targetClass
]

{
	#category : #generation,
	#timestamp : 'stlu 4/12/2021 20:19'
}
GLGenRegistryGenerator >> generateEnums: aCollection [

	'Compile enums'
		displayProgressFrom: 0 to: aCollection size
		during: [:bar |
			aCollection asArray withIndexDo: [:each :i |
				self generateEnum: each.
				bar value: i]].
]

{
	#category : #generation,
	#timestamp : 'stlu 4/12/2021 20:20'
}
GLGenRegistryGenerator >> generateRegistry: aRegistry [

	self generateCommands: aRegistry commands.
	self generateEnums: aRegistry enums.
	self removeNonGeneratedMethodsIn: self targetClass.
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/12/2021 18:17'
}
GLGenRegistryGenerator >> initialize [

	super initialize.
	targetClass := self environment at: #GLRegistry ifAbsent: []
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:26'
}
GLGenRegistryGenerator >> printCommandPragmas: aCommand on: aStream [

	aStream
		nextPutAll: '<glCommand: ';
		store: aCommand name asSymbol;
		nextPut: $>;
		cr; tab.
	
	aCommand aliases ifNotEmpty: [:aliases |
		aStream
			nextPutAll: '<glAliases: ';
			store: (aliases collect: [:alias | alias asSymbol] as: Array);
			nextPut: $>;
			cr; tab].
	
	aStream
		nextPutAll: '<glReturn: ';
		store: aCommand returnType asString.
	aCommand returnGroup ifNotNil: [:group |
		aStream
			nextPutAll: ' group: ';
			store: group asSymbol].
	aStream
		nextPut: $>;
		cr; tab.
	
	aCommand parameters do: [:param |
		aStream
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
		aStream
			nextPut: $>;
			cr; tab].
]

{
	#category : #'method sources',
	#timestamp : 'stlu 3/3/2021 15:07'
}
GLGenRegistryGenerator >> printCommandSignature: aCommand on: aStream [

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
	#timestamp : 'stlu 4/12/2021 13:56'
}
GLGenRegistryGenerator >> printDefinitionPragma: anArray on: aStream [

	| action api |
	api := anArray third.
	action := anArray second.
	aStream
		nextPutAll: '<glAPI: ';
		store: api asSymbol.
	anArray fourth ifNotNil: [:profile |
		aStream
			nextPutAll: ' profile: ';
			store: profile asSymbol].
	
	anArray first caseOf: {
		[#feature] -> [
			| version |
			version := anArray fifth.
			aStream
				nextPutAll: (action caseOf: {
								[#require] -> [' since: '].
								[#remove] -> [' until: ']});
				store: version asString].
		[#extension] -> [
			| extension |
			extension := anArray fifth.
			aStream
				nextPutAll: ' extension: ';
				store: extension asSymbol]}.
	
	aStream nextPut: $>.
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:24'
}
GLGenRegistryGenerator >> printDefinitionPragmas: aRegistryObject on: aStream [

	aRegistryObject definitions do: [:definition |
		self printDefinitionPragma: definition on: aStream.
		aStream cr; tab].
	aRegistryObject definitions ifNotEmpty: [
		aStream cr; tab].
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:20'
}
GLGenRegistryGenerator >> printEnumPragmas: anEnum on: aStream [

	aStream
		nextPutAll: '<glEnum: ';
		store: anEnum name asSymbol;
		nextPut: $>;
		cr; tab.
	
	anEnum aliases ifNotEmpty: [:aliases |
		aStream
			nextPutAll: '<glAliases: ';
			store: (aliases collect: [:alias | alias asSymbol] as: Array);
			nextPut: $>;
			cr; tab].
	
	aStream
		nextPutAll: '<glValue: ';
		nextPutAll: anEnum valueString;
		nextPut: $>;
		cr; tab.
	
	anEnum groups ifNotEmpty: [:groups |
		| groupArray |
		groupArray := groups collect: [:group | group asSymbol] as: Array.
		groupArray sort.
		aStream
			nextPutAll: '<glGroups: ';
			store: groupArray;
			nextPut: $>;
			cr; tab].
	
	self flag: #todo. "additional newline"
	
	anEnum vendor ifNotNil: [:vendor |
		aStream
			nextPutAll: '<glVendor: ';
			store: vendor asSymbol;
			nextPut: $>;
			cr; tab].
		
	anEnum suffix ifNotNil: [:suffix |
		aStream
			nextPutAll: '<glSuffix: ';
			store: suffix asSymbol;
			nextPut: $>;
			cr; tab].
	
	anEnum isBitmask ifTrue: [
		aStream
			nextPutAll: '<glBitmask>';
			cr; tab].
]

{
	#category : #'method sources',
	#timestamp : 'stlu 4/13/2021 12:22'
}
GLGenRegistryGenerator >> printEnumSignature: anEnum on: aStream [

	aStream nextPutAll: (self enumSignature: anEnum)
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 18:16'
}
GLGenRegistryGenerator >> targetClass [

	^ targetClass
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 18:16'
}
GLGenRegistryGenerator >> targetClass: anObject [

	targetClass := anObject
]
