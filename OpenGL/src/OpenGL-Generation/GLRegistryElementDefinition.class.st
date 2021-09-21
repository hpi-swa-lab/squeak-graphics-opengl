Class {
	#name : #GLRegistryElementDefinition,
	#superclass : #Object,
	#instVars : [
		'isExtension',
		'isRemoval',
		'api',
		'profile',
		'version'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> api [

	^ api
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:08'
}
GLRegistryElementDefinition >> extension [

	^ version
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> isExtension [

	^ isExtension
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> isRemoval [

	^ isRemoval
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:16'
}
GLRegistryElementDefinition >> printOn: aStream [

	self printPragmaOn: aStream.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:16'
}
GLRegistryElementDefinition >> printPragmaOn: aStream [

	aStream
		nextPutAll: '<glAPI: ';
		store: api asSymbol.
	profile ifNotNil: [:profile |
		aStream
			nextPutAll: ' profile: ';
			store: profile asSymbol].
	
	isExtension
		ifFalse: [
			aStream
				nextPutAll: (isRemoval
								ifFalse: [' since: ']
								ifTrue: [' until: ']);
				store: version asString]
		ifTrue: [
			aStream
				nextPutAll: ' extension: ';
				store: version asSymbol].
	
	aStream nextPut: $>.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> profile [

	^ profile
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:31'
}
GLRegistryElementDefinition >> removeIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	isExtension := false.
	isRemoval := true.
	api := apiSymbol.
	profile := profileSymbolOrNil.
	version := versionString.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:34'
}
GLRegistryElementDefinition >> requireIn: apiSymbol profile: profileSymbolOrNil extension: extensionName [

	isExtension := true.
	isRemoval := false.
	api := apiSymbol.
	profile := profileSymbolOrNil.
	version := extensionName.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> requireIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	isExtension := false.
	isRemoval := false.
	api := apiSymbol.
	profile := profileSymbolOrNil.
	version := versionString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLRegistryElementDefinition >> version [

	^ version
]
