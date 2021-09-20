Class {
	#name : #GLCommandParameter,
	#superclass : #Object,
	#instVars : [
		'name',
		'type',
		'group',
		'length',
		'command'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/11/2021 13:50'
}
GLCommandParameter class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 10/31/2020 23:49'
}
GLCommandParameter class >> getType: xmlTag [

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
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLCommandParameter >> command [

	^ command
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:52'
}
GLCommandParameter >> command: aCommand [

	command := aCommand
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLCommandParameter >> group [

	^ group
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 17:25'
}
GLCommandParameter >> group: anObject [

	group := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:16'
}
GLCommandParameter >> initializeWithXMLTag: paramTag [

	name := (paramTag firstTagNamed: #name) contentString.
	type := GLCommandParameter getType: paramTag.
	
	length := paramTag attributes at: #len ifAbsent: [].
	group := paramTag attributes at: #group ifAbsent: [].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLCommandParameter >> length [

	^ length
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 17:25'
}
GLCommandParameter >> length: anObject [

	length := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 17:26'
}
GLCommandParameter >> name [

	^ name
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 11/1/2020 20:50'
}
GLCommandParameter >> printOn: aStream [

	aStream
		nextPutAll: type;
		space;
		nextPutAll: name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLCommandParameter >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 17:25'
}
GLCommandParameter >> type: anObject [

	type := anObject
]
