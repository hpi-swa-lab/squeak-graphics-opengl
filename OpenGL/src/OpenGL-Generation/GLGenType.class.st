Class {
	#name : #GLGenType,
	#superclass : #GLGenRegistryObject,
	#category : #'OpenGL-Generation'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/11/2021 13:29'
}
GLGenType class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:31'
}
GLGenType >> initializeWithXMLTag: tag [

	tag elementsDo: [:nameTag |
		nameTag tag = #name ifTrue: [
			name := nameTag contentString]].
	name ifNil: [name := tag attributes at: #name].
]