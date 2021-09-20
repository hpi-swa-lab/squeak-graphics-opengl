Class {
	#name : #GLCommand,
	#superclass : #GLRegistryElement,
	#instVars : [
		'parameters',
		'returnType',
		'returnGroup'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/11/2021 13:54'
}
GLCommand class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/1/2020 00:23'
}
GLCommand >> addParameter: param [

	parameters add: param
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 12/28/2020 16:36'
}
GLCommand >> ffiPragma [

	^ String streamContents: [:stream |
		self printFFIPragmaOn: stream]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:16'
}
GLCommand >> initializeWithXMLTag: commandTag [

	| protoTag |
	protoTag := commandTag firstTagNamed: #proto.
	name := (protoTag firstTagNamed: #name) contentString.
	returnType := GLCommandParameter getType: protoTag.
	returnGroup := commandTag attributes at: #group ifAbsent: [].
	
	aliases := Set new.
	commandTag tagsNamed: #alias do: [:aliasTag |
		self addAlias: (aliasTag attributes at: #name)].
	
	parameters := OrderedCollection new.
	commandTag tagsNamed: #param do: [:paramTag |
		| param |
		param := GLCommandParameter fromXMLTag: paramTag.
		param command: self.
		self addParameter: param].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/28/2020 13:52'
}
GLCommand >> isCommand [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:47'
}
GLCommand >> numParameters [

	^ parameters size
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:20'
}
GLCommand >> parameters [

	^ parameters
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 11/2/2020 19:53'
}
GLCommand >> printFFIPragmaOn: aStream [

	aStream
		nextPutAll: '<apicall: ';
		nextPutAll: returnType;
		nextPutAll: ' ''';
		nextPutAll: name;
		nextPutAll: ''' ('.
	
	parameters
		do: [:param | aStream nextPutAll: param type]
		separatedBy: [aStream space].
	
	aStream nextPutAll: ')>'
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 11/1/2020 20:56'
}
GLCommand >> printOn: aStream [

	aStream
		nextPutAll: returnType;
		space;
		nextPutAll: name;
		nextPut: $(.
	parameters
		do: [:param | param printOn: aStream]
		separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut:$)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/3/2021 13:11'
}
GLCommand >> returnGroup [

	^ returnGroup
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:20'
}
GLCommand >> returnType [

	^ returnType
]
