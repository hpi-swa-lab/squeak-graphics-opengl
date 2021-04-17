Extension { #name : #ExternalData }

{
	#category : #'*OpenGL-FFI-Support-override',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalData >> at: index [

	"self
		assert: [index = 1 or: [type isAtomic]]
		description: 'Should not read non-atomic pointer as array'."

	((1 > index) or: [size notNil and: [index > size]])
		ifTrue: [^ self errorSubscriptBounds: index].

	^ type asNonPointerType
		handle: handle
		at: ((index-1) * type asNonPointerType byteSize) + 1
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalData >> blockAt: byteIndex byteSize: numBytes [
	"Given that the receiver manages a page of memory, answer a block of that memory to use."
	^ ExternalData
		fromHandle: handle + (byteIndex - 1)
		byteSize: numBytes
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalData class >> fromHandle: aHandle byteSize: byteSize [
	^ (self fromHandle: aHandle type: ExternalType unsignedByte asPointerType)
		size: byteSize;
		yourself
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalData >> pointerAt: byteOffset [

	^ self pointerAt: byteOffset length: ExternalAddress wordSize
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalData >> pointerAt: byteOffset length: numBytes [

	| addr |
	addr := ExternalAddress basicNew: numBytes.
	1 to: numBytes do: [:i |
		addr basicAt: i put: (self unsignedByteAt: (byteOffset + i) - 1)].
	^ addr
]
