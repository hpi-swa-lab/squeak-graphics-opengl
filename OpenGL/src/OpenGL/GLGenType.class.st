Class {
	#name : #GLGenType,
	#superclass : #GLGenRegistryObject,
	#category : #'OpenGL-Generation',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/11/2021 13:29'
}
GLGenType class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/11/2021 13:31'
}
GLGenType >> initializeWithXMLTag: tag [

	tag elementsDo: [:nameTag |
		nameTag tag = #name ifTrue: [
			name := nameTag contentString]].
	name ifNil: [name := tag attributes at: #name].
]
