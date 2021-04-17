Extension { #name : #ExternalAddress }

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalAddress class >> allocateExecutablePage [
	"The IA32ABI plugin answers a byte array where the first half encodes the allocated byte size and the second half the external address to that executable memory. Unpack that byte array and return external data we can read and write conveniently."
	
	| alien |
	alien := self primAllocateExecutablePage.	
	^ ExternalData
		fromHandle: alien externalPointer
		byteSize: alien byteSize
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalAddress class >> fromInteger: anInteger [
	"Read the given interger as an address pointing to an external memory area."
	
	| buffer type |
	type := ExternalType uintptr_t.
	buffer := ByteArray new: type byteSize.
	type handle: buffer at: 1 put: anInteger.
	^ buffer asExternalPointer
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalAddress class >> primAllocateExecutablePage [ "^<Alien>"
	"Answer an Alien around a piece of (probably malloced) memory, of some multiple
	 of the pagesize, that has execute permissions set.  This memory can be parcelled
	 out to individual FFICallbackThunks to hold their thunk/trampoline machine code."
	<primitive: 'primAllocateExecutablePage' module: 'IA32ABI' error: errorCode>
	^self primitiveFailed
]
