Class {
	#name : #GLEnum,
	#superclass : #GLRegistryElement,
	#instVars : [
		'value',
		'namespace',
		'api',
		'groups',
		'vendor',
		'suffix',
		'type',
		'typeSuffix'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 10/31/2020 23:06'
}
GLEnum class >> convertEnumValueString: aString [

	^ (aString beginsWith: '0x')
		ifTrue: [	Number
					readFrom: (ReadStream on: aString from: 3 to: aString size)
					base: 16]
		ifFalse: [aString asNumber]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/5/2021 12:50'
}
GLEnum >> addGroup: aString [

	groups add: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:05'
}
GLEnum >> api [

	^ api
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLEnum >> groups [

	^ groups
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:49'
}
GLEnum >> initialize [

	super initialize.
	groups := Set new
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/13/2021 16:10'
}
GLEnum >> initializeWithXMLTag: tag [

	name := tag attributeAt: #name.
	value := self class convertEnumValueString: (tag attributeAt: #value).
	
	tag attributes
		at: #group
		ifPresent: [:groupNames |
			groupNames findTokens: ',' do: [:groupName |
				self addGroup: groupName]].
	
	api := tag attributes at: #api ifAbsent: [].
	typeSuffix := tag attributes at: #type ifAbsent: [].
	suffix := (name findTokens: '_') last.
	(self class extensionVendors includes: suffix) ifFalse: [suffix := nil].
	
	tag attributes at: #alias ifPresent: [:alias | self addAlias: alias].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:13'
}
GLEnum >> isBitmask [

	^ type = 'bitmask'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/28/2020 13:52'
}
GLEnum >> isEnum [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:24'
}
GLEnum >> namespace [

	^ namespace
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:24'
}
GLEnum >> namespace: anObject [

	namespace := anObject
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 3/5/2021 13:31'
}
GLEnum >> printOn: aStream [

	aStream
		nextPutAll: name;
		space;
		nextPutAll: self valueString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:27'
}
GLEnum >> suffix [

	^ suffix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:14'
}
GLEnum >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:14'
}
GLEnum >> type: anObject [

	type := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 12:19'
}
GLEnum >> typeSuffix [

	^ typeSuffix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 23:00'
}
GLEnum >> value [

	^ value
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 3/5/2021 13:30'
}
GLEnum >> valueString [

	^ value storeStringBase: (self isBitmask ifTrue: [2] ifFalse: [16])
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 11:40'
}
GLEnum >> vendor [

	^ vendor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/4/2021 11:40'
}
GLEnum >> vendor: anObject [

	vendor := anObject
]
