"
This is the main interface to the OpenGL library. 

displayList
displayListAlpha

David A. Smith
"
Class {
	#name : #GLVersion,
	#superclass : #Object,
	#instVars : [
		'api',
		'major',
		'minor',
		'profile'
	],
	#classVars : [
		'Instances'
	],
	#pools : [
		'GLConstants'
	],
	#classInstVars : [
		'searchInstance'
	],
	#category : #'OpenGL-Constants'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/20/2022 16:14'
}
GLVersion class >> api: anAPI major: majorVersion minor: minorVersion profile: profileSymbol [

	Instances ifNil: [Instances := Set new].
	searchInstance ifNil: [searchInstance := self basicNew].
	
	searchInstance initializeAPI: anAPI major: majorVersion minor: minorVersion profile: profileSymbol.
	^ Instances like: searchInstance ifAbsent: [| result |
		result := searchInstance.
		searchInstance := self basicNew.
		result beReadOnlyObject.
		Instances add: result]
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:34'
}
GLVersion >> < aVersion [

	^ aVersion > self
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:34'
}
GLVersion >> <= aVersion [

	^ aVersion >= self
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:11'
}
GLVersion >> = otherVersion [

	otherVersion == self ifTrue: [^ true].
	otherVersion api = api ifFalse: [^ false].
	otherVersion major = major ifFalse: [^ false].
	otherVersion minor = minor ifFalse: [^ false].
	otherVersion profile = profile ifFalse: [^ false].
	^ true
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:30'
}
GLVersion >> > aVersion [
	"Answer whether the receiver is a follow-up to aVersion." 
	aVersion api = api ifFalse: [^ false].
	(aVersion profile isNil or: [profile isNil]) ifFalse: [
		aVersion profile = profile ifFalse: [^ false]].
	major > aVersion major ifTrue: [^ true].
	^ major = aVersion major and: [
		minor > aVersion minor]
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:33'
}
GLVersion >> >= aVersion [
	"Answer whether the receiver is a follow-up to aVersion." 
	aVersion api = api ifFalse: [^ false].
	(aVersion profile isNil or: [profile isNil]) ifFalse: [
		aVersion profile = profile ifFalse: [^ false]].
	major > aVersion major ifTrue: [^ true].
	^ major = aVersion major and: [
		minor >= aVersion minor]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:03'
}
GLVersion >> api [

	^ api
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 4/17/2021 09:57'
}
GLVersion >> apiString [

	^ self api asString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:36'
}
GLVersion >> apiSymbol [

	^ api symbol
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 4/15/2021 19:11'
}
GLVersion >> getExtensions: aLibrary [

	^ Array streamContents: [:stream |
		aLibrary extensionsString splitBy: ' ' do: [:extensionName |
			stream nextPut: extensionName asSymbol]]
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 4/15/2021 19:14'
}
GLVersion >> getShadingLanguageVersion: aLibrary [

	^ #(0 0) "by default unsupported"
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:14'
}
GLVersion >> hash [

	^ ((api hash bitXor: major hash) bitXor: minor hash) bitXor: profile hash
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 14:56'
}
GLVersion >> initializeAPI: anAPI major: majorVersion minor: minorVersion profile: profileSymbol [

	api := anAPI.
	major := majorVersion.
	minor := minorVersion.
	profile := profileSymbol.
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 6/20/2022 15:16'
}
GLVersion >> isBelowMajor: majorVersion minor: minorVersion [

	major < majorVersion ifTrue: [^ true].
	^ (major = majorVersion)
		and: [minor < minorVersion]
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/16/2021 20:41'
}
GLVersion >> isBelowVersionString: versionString [

	| majorMinor |
	majorMinor := versionString splitBy: '.'.
	^ self
		isBelowMajor: majorMinor first asNumber
		minor: majorMinor second asNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:03'
}
GLVersion >> major [

	^ major
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 6/20/2022 15:17'
}
GLVersion >> matchesProfile: profileSymbolOrNil [

	profileSymbolOrNil ifNil: [^ true].
	profile ifNil: [^ true].
	profileSymbolOrNil = profile ifTrue: [^ true].
	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:03'
}
GLVersion >> minor [

	^ minor
]

{
	#category : #'external functions',
	#'squeak_changestamp' : 'stlu 6/20/2022 15:15'
}
GLVersion >> moduleName [

	^ api moduleName
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:57'
}
GLVersion >> printOn: aStream [

	aStream
		nextPutAll: (api ifNil: [''] ifNotNil: [api label]);
		space;
		store: major;
		nextPut: $.;
		store: minor.
	
	profile ifNotNil: [
		aStream
			nextPutAll: ' (';
			nextPutAll: profile asString capitalized;
			nextPutAll: ' Profile)']
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/3/2020 12:53'
}
GLVersion >> profile [

	^ profile
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 4/17/2021 10:08'
}
GLVersion >> profileString [

	^ self profile asString capitalized
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 4/17/2021 09:57'
}
GLVersion >> versionString [

	^ self major asString , '.' , self minor asString
]
