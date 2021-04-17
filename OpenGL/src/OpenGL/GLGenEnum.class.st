Class {
	#name : #GLGenEnum,
	#superclass : #GLGenRegistryObject,
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
	#category : #'OpenGL-Generation',
	#commentStamp : ''
}

{
	#category : #helpers,
	#timestamp : 'stlu 10/31/2020 23:06'
}
GLGenEnum class >> convertEnumValueString: aString [

	^ (aString beginsWith: '0x')
		ifTrue: [	Number
					readFrom: (ReadStream on: aString from: 3 to: aString size)
					base: 16]
		ifFalse: [aString asNumber]
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 3/4/2021 11:36'
}
GLGenEnum class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/5/2021 12:50'
}
GLGenEnum >> addGroup: aString [

	groups add: aString
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:05'
}
GLGenEnum >> api [

	^ api
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenEnum >> groups [

	^ groups
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/12/2021 18:49'
}
GLGenEnum >> initialize [

	super initialize.
	groups := Set new
]

{
	#category : #initialization,
	#timestamp : 'stlu 3/5/2021 13:03'
}
GLGenEnum >> initializeWithXMLTag: tag [

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
	(self class suffixes includes: suffix) ifFalse: [suffix := nil].
	
	tag attributes at: #alias ifPresent: [:alias | self addAlias: alias].
]

{
	#category : #testing,
	#timestamp : 'stlu 3/4/2021 12:13'
}
GLGenEnum >> isBitmask [

	^ type = 'bitmask'
]

{
	#category : #testing,
	#timestamp : 'stlu 12/28/2020 13:52'
}
GLGenEnum >> isEnum [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:24'
}
GLGenEnum >> namespace [

	^ namespace
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:24'
}
GLGenEnum >> namespace: anObject [

	namespace := anObject
]

{
	#category : #printing,
	#timestamp : 'stlu 3/5/2021 13:31'
}
GLGenEnum >> printOn: aStream [

	aStream
		nextPutAll: name;
		space;
		nextPutAll: self valueString
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:27'
}
GLGenEnum >> suffix [

	^ suffix
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:14'
}
GLGenEnum >> type [

	^ type
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:14'
}
GLGenEnum >> type: anObject [

	type := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 12:19'
}
GLGenEnum >> typeSuffix [

	^ typeSuffix
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 23:00'
}
GLGenEnum >> value [

	^ value
]

{
	#category : #printing,
	#timestamp : 'stlu 3/5/2021 13:30'
}
GLGenEnum >> valueString [

	^ value storeStringBase: (self isBitmask ifTrue: [2] ifFalse: [16])
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 11:40'
}
GLGenEnum >> vendor [

	^ vendor
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/4/2021 11:40'
}
GLGenEnum >> vendor: anObject [

	vendor := anObject
]
