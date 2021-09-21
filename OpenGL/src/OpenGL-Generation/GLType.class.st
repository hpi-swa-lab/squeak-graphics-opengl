Class {
	#name : #GLType,
	#superclass : #GLRegistryElement,
	#category : #'OpenGL-Generation'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:31'
}
GLType >> initializeWithXMLTag: tag [

	tag elementsDo: [:nameTag |
		nameTag tag = #name ifTrue: [
			name := nameTag contentString]].
	name ifNil: [name := tag attributes at: #name].
]
