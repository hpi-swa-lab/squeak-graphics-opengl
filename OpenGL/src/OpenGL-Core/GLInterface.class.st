"
I decorate a GLLibrary to automatically check API calls against a specified version.
If the API call is not available in the given version, an error is raised.
"
Class {
	#name : #GLInterface,
	#superclass : #Object,
	#instVars : [
		'version',
		'extensions'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:46'
}
GLInterface class >> extensions: collectionOfSymbols [

	^ self
		version: nil "allow all versions by default"
		extensions: collectionOfSymbols
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:45'
}
GLInterface class >> version: aVersion [

	^ self
		version: aVersion
		extensions: #() "allow no extensions by default"
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:46'
}
GLInterface class >> version: aVersionOrNil extensions: collectionOfSymbolsOrNil [

	^ self new
		version: aVersionOrNil;
		extensions: collectionOfSymbolsOrNil;
		yourself
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:14'
}
GLInterface >> = otherInterface [

	self == otherInterface ifTrue: [^ true].
	self species = otherInterface species ifFalse: [^ false].
	version = otherInterface version ifFalse: [^ false].
	extensions = otherInterface extensions ifFalse: [^ false].
	^ true
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 5/26/2021 12:53'
}
GLInterface >> availableAccordingToPragmas: collectionOfPragmas [

	| result |
	result := false.
	collectionOfPragmas do: [:pragma |
		(pragma keyword beginsWith: 'glAPI') ifTrue: [
			(pragma message sendTo: self) ifNotNil: [:newResult |
				result := newResult]]].
	^ result
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:43'
}
GLInterface >> extensions [

	^ extensions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:43'
}
GLInterface >> extensions: anObject [

	extensions := anObject.
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:27'
}
GLInterface >> glAPI: apiSymbol extension: extensionSymbol [

	^ self glAPI: apiSymbol profile: nil extension: extensionSymbol
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:42'
}
GLInterface >> glAPI: apiSymbol profile: profileSymbolOrNil extension: extensionSymbol [

	extensions ifNil: [^ true].
	version ifNotNil: [
		(version isAPI: apiSymbol) ifFalse: [^ nil].
		(version matchesProfile: profileSymbolOrNil) ifFalse: [^ nil]].
	(extensions includes: extensionSymbol) ifFalse: [^ nil].
	^ true
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:42'
}
GLInterface >> glAPI: apiSymbol profile: profileSymbol since: versionString [

	version ifNil: [^ true].
	(version isAPI: apiSymbol) ifFalse: [^ nil].
	(version matchesProfile: profileSymbol) ifFalse: [^ nil].
	(version isBelowVersionString: versionString) ifTrue: [^ nil].
	^ true
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 5/23/2022 14:43'
}
GLInterface >> glAPI: apiSymbol profile: profileSymbol until: versionString [

	version ifNil: [^ nil].
	(version isAPI: apiSymbol) ifFalse: [^ nil].
	(version matchesProfile: profileSymbol) ifFalse: [^ nil].
	(version isBelowVersionString: versionString) ifTrue: [^ nil].
	^ false
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:25'
}
GLInterface >> glAPI: apiSymbol since: versionString [

	^ self glAPI: apiSymbol profile: nil since: versionString
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:25'
}
GLInterface >> glAPI: apiSymbol until: versionString [

	^ self glAPI: apiSymbol profile: nil until: versionString
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/24/2022 16:13'
}
GLInterface >> hash [

	^ version hash bitXor: extensions hash
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:43'
}
GLInterface >> version [

	^ version
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2022 15:43'
}
GLInterface >> version: anObject [

	version := anObject.
]
