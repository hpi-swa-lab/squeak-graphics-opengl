Class {
	#name : #GLSLArray,
	#superclass : #GLSLType,
	#instVars : [
		'type',
		'numElements'
	],
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/14/2020 16:16'
}
GLSLArray class >> instance [

	self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/14/2020 16:17'
}
GLSLArray class >> numElements: length enum: anInteger [

	^ self numElements: length type: (GLSLType forEnum: anInteger)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/23/2020 16:18'
}
GLSLArray class >> numElements: length type: aGLType [

	^ self basicNew
		type: aGLType;
		numElements: length;
		initialize;
		yourself
]

{
	#category : #comparing,
	#timestamp : 'stlu 1/10/2021 19:32'
}
GLSLArray >> = anotherType [

	self class ~= anotherType class ifTrue: [^ false].
	numElements ~= anotherType numElements ifTrue: [^ false].
	^ type = anotherType type
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 18:20'
}
GLSLArray >> declarator [

	^ String streamContents: [:stream |
		stream
			nextPutAll: type declarator;
			nextPut: $[;
			print: numElements;
			nextPut: $]]
]

{
	#category : #comparing,
	#timestamp : 'stlu 1/10/2021 19:30'
}
GLSLArray >> hash [

	^ numElements hash bitXor: type hash
]

{
	#category : #testing,
	#timestamp : 'stlu 1/8/2021 18:30'
}
GLSLArray >> isArray [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 16:16'
}
GLSLArray >> numElements [

	^ numElements
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 16:15'
}
GLSLArray >> numElements: anObject [

	numElements := anObject
]

{
	#category : #printing,
	#timestamp : 'stlu 1/10/2021 12:44'
}
GLSLArray >> printDeclarationNamed: aString on: aStream [

	type printDeclarationNamed: aString on: aStream.
	aStream
		nextPut: $[;
		print: numElements;
		nextPut: $]
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 16:10'
}
GLSLArray >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	type setUniform: aUniform toArray: aRawBitsArray count: numElements
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/19/2020 07:24'
}
GLSLArray >> type [

	^ type
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/19/2020 07:24'
}
GLSLArray >> type: anObject [

	type := anObject
]
