Class {
	#name : #GLGenRegistryObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'definitions',
		'aliases'
	],
	#classVars : [
		'Suffixes'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/5/2021 12:58'
}
GLGenRegistryObject class >> suffixes [

	^ Suffixes ifNil: [
		Suffixes := #('3DFX' '3DL' 'AMD' 'APPLE' 'ARB' 'ARM' 'ATI' 'DMP' 'EXT' 'FJ' 'GREMEDY' 'HP' 'I3D' 'IBM' 'IMG' 'INGR' 'INTEL' 'KHR' 'MESA' 'MESAX' 'NV' 'NVX' 'OES' 'OML' 'OVR' 'PGI' 'QCOM' 'REND' 'S3TC' 'SGI' 'SGIS' 'SGIX' 'SUN' 'SUNX' 'WIN') asSet]
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
	#'squeak_changestamp' : 'stlu 4/11/2021 12:56'
}
GLGenRegistryObject >> definitions [

	^ definitions ifNil: [definitions := OrderedCollection new]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:49'
}
GLGenRegistryObject >> definitions: anObject [

	definitions := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:50'
}
GLGenRegistryObject >> initialize [

	aliases := Set new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 4/19/2021 19:44'
}
GLGenRegistryObject >> isEverRemoved [

	^ definitions anySatisfy: [:each |
		each second = #remove]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:30'
}
GLGenRegistryObject >> isOnlyDefinedInExtensions [

	^ definitions allSatisfy: [:each |
		each first = #extension]
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
	#'squeak_changestamp' : 'stlu 4/12/2021 12:50'
}
GLGenRegistryObject >> removeIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	self definitions add: { #feature . #remove . apiSymbol . profileSymbolOrNil . versionString }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 12:51'
}
GLGenRegistryObject >> requireIn: apiSymbol profile: profileSymbolOrNil extension: extensionName [

	self definitions add: { #extension . #require . apiSymbol . profileSymbolOrNil . extensionName }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 12:50'
}
GLGenRegistryObject >> requireIn: apiSymbol profile: profileSymbolOrNil version: versionString [

	self definitions add: { #feature . #require . apiSymbol . profileSymbolOrNil . versionString }
]