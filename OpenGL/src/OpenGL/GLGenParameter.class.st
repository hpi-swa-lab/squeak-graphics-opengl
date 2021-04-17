Class {
	#name : #GLGenParameter,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'group',
		'length',
		'command'
	],
	#category : #'OpenGL-Generation',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/11/2021 13:50'
}
GLGenParameter class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #helpers,
	#timestamp : 'stlu 10/31/2020 23:49'
}
GLGenParameter class >> getType: xmlTag [

	| result |
	result := String streamContents: [:stream |
		xmlTag elementsAndContentsDo: [:part |
			part isText
				ifTrue: [stream nextPutAll: part string]
				ifFalse: [
					part tag = #ptype ifTrue: [
						stream nextPutAll: part contentString]]]].
	^ (result copyReplaceAll: 'const' with: '') copyReplaceAll: ' ' with: ''
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenParameter >> command [

	^ command
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/11/2021 13:52'
}
GLGenParameter >> command: aCommand [

	command := aCommand
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenParameter >> group [

	^ group
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 17:25'
}
GLGenParameter >> group: anObject [

	group := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/12/2021 16:58'
}
GLGenParameter >> initializeWithXMLTag: paramTag [

	name := (paramTag firstTagNamed: #name) contentString.
	type := GLGenParameter getType: paramTag.
	
	length := paramTag attributes at: #len ifAbsent: [].
	group := paramTag attributes at: #group ifAbsent: [].
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenParameter >> length [

	^ length
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 17:25'
}
GLGenParameter >> length: anObject [

	length := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 17:26'
}
GLGenParameter >> name [

	^ name
]

{
	#category : #printing,
	#timestamp : 'stlu 11/1/2020 20:50'
}
GLGenParameter >> printOn: aStream [

	aStream
		nextPutAll: type;
		space;
		nextPutAll: name
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenParameter >> type [

	^ type
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 17:25'
}
GLGenParameter >> type: anObject [

	type := anObject
]
