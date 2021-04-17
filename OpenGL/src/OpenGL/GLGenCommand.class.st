Class {
	#name : #GLGenCommand,
	#superclass : #GLGenRegistryObject,
	#instVars : [
		'parameters',
		'returnType',
		'returnGroup'
	],
	#category : #'OpenGL-Generation',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/11/2021 13:54'
}
GLGenCommand class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/1/2020 00:23'
}
GLGenCommand >> addParameter: param [

	parameters add: param
]

{
	#category : #printing,
	#timestamp : 'stlu 12/28/2020 16:36'
}
GLGenCommand >> ffiPragma [

	^ String streamContents: [:stream |
		self printFFIPragmaOn: stream]
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/12/2021 19:47'
}
GLGenCommand >> initializeWithXMLTag: commandTag [

	| protoTag |
	protoTag := commandTag firstTagNamed: #proto.
	name := (protoTag firstTagNamed: #name) contentString.
	returnType := GLGenParameter getType: protoTag.
	returnGroup := commandTag attributes at: #group ifAbsent: [].
	
	aliases := Set new.
	commandTag tagsNamed: #alias do: [:aliasTag |
		self addAlias: (aliasTag attributes at: #name)].
	
	parameters := OrderedCollection new.
	commandTag tagsNamed: #param do: [:paramTag |
		| param |
		param := GLGenParameter fromXMLTag: paramTag.
		param command: self.
		self addParameter: param].
]

{
	#category : #testing,
	#timestamp : 'stlu 12/28/2020 13:52'
}
GLGenCommand >> isCommand [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 18:47'
}
GLGenCommand >> numParameters [

	^ parameters size
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:20'
}
GLGenCommand >> parameters [

	^ parameters
]

{
	#category : #printing,
	#timestamp : 'stlu 11/2/2020 19:53'
}
GLGenCommand >> printFFIPragmaOn: aStream [

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
	#timestamp : 'stlu 11/1/2020 20:56'
}
GLGenCommand >> printOn: aStream [

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
	#timestamp : 'stlu 3/3/2021 13:11'
}
GLGenCommand >> returnGroup [

	^ returnGroup
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:20'
}
GLGenCommand >> returnType [

	^ returnType
]
