Extension { #name : #FFICallbackMemory }

{
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 4/30/2021 14:27'
}
FFICallbackMemory >> externalPointer: anExternalAddress [

	| type integer |
	self flag: #debugging.
	type := ExternalType uintptr_t.
	integer := type
		handle: anExternalAddress asByteArrayPointer
		at: 1.
		
	self addressFieldPut: integer.
]

{
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 4/30/2021 14:28'
}
FFICallbackMemory class >> unload [

	Smalltalk removeFromStartUpList: self.
]
