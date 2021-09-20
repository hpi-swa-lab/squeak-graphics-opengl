Class {
	#name : #GLGenDefinition,
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
GLGenDefinition >> api [

	^ api
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> api: anObject [

	api := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:08'
}
GLGenDefinition >> extension [

	^ version
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> isExtension [

	^ isExtension
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> isExtension: anObject [

	isExtension := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> isRemoval [

	^ isRemoval
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> isRemoval: anObject [

	isRemoval := anObject.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:16'
}
GLGenDefinition >> printOn: aStream [

	self printPragmaOn: aStream.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:16'
}
GLGenDefinition >> printPragmaOn: aStream [

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
GLGenDefinition >> profile [

	^ profile
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> profile: anObject [

	profile := anObject.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:31'
}
GLGenDefinition >> removeIn: apiSymbol profile: profileSymbolOrNil version: versionString [

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
GLGenDefinition >> requireIn: apiSymbol profile: profileSymbolOrNil extension: extensionName [

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
GLGenDefinition >> requireIn: apiSymbol profile: profileSymbolOrNil version: versionString [

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
GLGenDefinition >> version [

	^ version
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenDefinition >> version: anObject [

	version := anObject.
]
