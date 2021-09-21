Class {
	#name : #GLRegistryElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'definitions',
		'aliases'
	],
	#classVars : [
		'ExtensionVendors'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 16:09'
}
GLRegistryElement class >> extensionVendors [

	^ ExtensionVendors ifNil: [
		ExtensionVendors := #(
			'3DFX'
			'3DL'
			'AMD'
			'APPLE'
			'ARB'
			'ARM'
			'ATI'
			'DMP'
			'EXT'
			'FJ'
			'GREMEDY'
			'HP'
			'I3D'
			'IBM'
			'IMG'
			'INGR'
			'INTEL'
			'KHR'
			'MESA'
			'MESAX'
			'NV'
			'NVX'
			'OES'
			'OML'
			'OVR'
			'PGI'
			'QCOM'
			'REND'
			'S3TC'
			'SGI'
			'SGIS'
			'SGIX'
			'SUN'
			'SUNX'
			'WIN'
			) asSet]
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 9/20/2021 15:02'
}
GLRegistryElement class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:37'
}
GLRegistryElement >> addAlias: aString [

	aString ~= name ifTrue: [
		aliases add: aString]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:49'
}
GLRegistryElement >> aliases [

	^ aliases
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:13'
}
GLRegistryElement >> definitions [

	^ definitions
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:07'
}
GLRegistryElement >> hasDefinitions [

	^ definitions notEmpty
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:14'
}
GLRegistryElement >> initialize [

	aliases := Set new.
	definitions := OrderedCollection new.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 15:03'
}
GLRegistryElement >> initializeWithXMLTag: tag [

	self subclassResponsibility.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:04'
}
GLRegistryElement >> isDefinedInAPI: apiSymbol [

	^ definitions anySatisfy: [:definition |
		definition isExtension not
			and: [definition isRemoval not]
			and: [definition api = apiSymbol]]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:51'
}
GLRegistryElement >> isDefinedInExtensions: extensionsOrNil [

	extensionsOrNil ifNil: [^ true].
	^ definitions anySatisfy: [:definition |
		definition isExtension and: [
			(extensionsOrNil includes: definition version)]]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/20/2021 17:07'
}
GLRegistryElement >> isDefinedInVersion: glVersion [

	^ self isDefinedInVersion: glVersion extensions: #()
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:32'
}
GLRegistryElement >> isDefinedInVersion: glVersionOrNil extensions: extensionsOrNil [

	| result |
	result := false.
	definitions do: [:definition |
		(definition checkVersion: glVersionOrNil extensions: extensionsOrNil) ifNotNil: [:newResult |
			result := newResult]].
	^ result
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:36'
}
GLRegistryElement >> isEverRemoved [

	^ definitions anySatisfy: [:each | each isRemoval]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:36'
}
GLRegistryElement >> isOnlyDefinedInExtensions [

	^ definitions allSatisfy: [:each | each isExtension]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/1/2020 19:34'
}
GLRegistryElement >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/1/2020 21:29'
}
GLRegistryElement >> name: stringOrSymbol [

	name := stringOrSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:16'
}
GLRegistryElement >> removeIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	definitions add: (GLRegistryElementDefinition new
		removeIn: apiSymbol
		profile: profileSymbolOrNil
		version: versionString).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:17'
}
GLRegistryElement >> requireIn: apiSymbol profile: profileSymbolOrNil extension: extensionName [

	definitions add: (GLRegistryElementDefinition new
		requireIn: apiSymbol
		profile: profileSymbolOrNil
		extension: extensionName).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:17'
}
GLRegistryElement >> requireIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	definitions add: (GLRegistryElementDefinition new
		requireIn: apiSymbol
		profile: profileSymbolOrNil
		version: versionString).
]
