Class {
	#name : #ExternalArrayType,
	#superclass : #Object,
	#instVars : [
		'numberOfItems',
		'type'
	],
	#category : #'OpenGL-FFI-Support',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> asNonPointerType [

	^ "ExternalArrayType new
		type: type asNonPointerType;
		numberOfItems: self numberOfItems;
		yourself"type asNonPointerType
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> byteAlignment [

	self flag: #fixme. " 8 on 64bit linux is definitely wrong. that's all we know so far "
	^ type asNonPointerType byteAlignment "type byteAlignment"
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> byteSize [

	^ type asNonPointerType byteSize * self numberOfItems
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> embeddedSpecWithSize: aNumber [

	^ type embeddedSpecWithSize: aNumber
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> handle: handle at: byteOffset [

	^ type handle: handle at: byteOffset
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> handle: handle at: byteOffset put: value [

	^ type handle: handle at: byteOffset put: value
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> isArrayType [

	^ true
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> isAtomic [

	^ type isAtomic
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> isVoid [

	^ type isVoid
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> numberOfItems [

	^ numberOfItems
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> numberOfItems: aNumber [

	numberOfItems := aNumber
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> printOn: aStream [

	type printOn: aStream.
	aStream
		nextPut: $[;
		print: self numberOfItems;
		nextPut: $]
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> readFieldAt: byteOffset [

	^ String streamContents: [:stream |
		stream nextPutAll: '^ (ExternalData fromHandle: ';
			nextPutAll: 'handle + ';
			print: byteOffset - 1;
			nextPutAll: ' type: ('.
		
		stream nextPutAll: (self isAtomic ifTrue: ['ExternalType ', type atomicTypeName] ifFalse: [type referentClass name, ' externalType']).
		
		stream
			nextPutAll: ' asArrayType: ';
			print: self numberOfItems;
			nextPutAll: ')) size: ';
			print: self numberOfItems;
			nextPutAll: '; yourself']
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> type: aType [

	type := aType
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> writeFieldArgName [

	^ type writeFieldArgName
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalArrayType >> writeFieldAt: byteOffset with: valueName [

	^ 'self shouldNotImplement'
]
