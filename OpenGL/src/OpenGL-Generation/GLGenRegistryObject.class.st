Class {
	#name : #GLGenRegistryObject,
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
GLGenRegistryObject class >> extensionVendors [

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
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:37'
}
GLGenRegistryObject >> addAlias: aString [

	aString ~= name ifTrue: [
		aliases add: aString]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:49'
}
GLGenRegistryObject >> aliases [

	^ aliases
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:13'
}
GLGenRegistryObject >> definitions [

	^ definitions
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:07'
}
GLGenRegistryObject >> hasDefinitions [

	^ definitions notEmpty
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 13:14'
}
GLGenRegistryObject >> initialize [

	aliases := Set new.
	definitions := OrderedCollection new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:36'
}
GLGenRegistryObject >> isEverRemoved [

	^ definitions anySatisfy: [:each | each isRemoval]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:36'
}
GLGenRegistryObject >> isOnlyDefinedInExtensions [

	^ definitions allSatisfy: [:each | each isExtension]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/1/2020 19:34'
}
GLGenRegistryObject >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/1/2020 21:29'
}
GLGenRegistryObject >> name: stringOrSymbol [

	name := stringOrSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:33'
}
GLGenRegistryObject >> removeIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	definitions add: (GLGenDefinition new
		removeIn: apiSymbol
		profile: profileSymbolOrNil
		version: versionString).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:34'
}
GLGenRegistryObject >> requireIn: apiSymbol profile: profileSymbolOrNil extension: extensionName [

	definitions add: (GLGenDefinition new
		requireIn: apiSymbol
		profile: profileSymbolOrNil
		extension: extensionName).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/15/2021 14:35'
}
GLGenRegistryObject >> requireIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	definitions add: (GLGenDefinition new
		requireIn: apiSymbol
		profile: profileSymbolOrNil
		version: versionString).
]
