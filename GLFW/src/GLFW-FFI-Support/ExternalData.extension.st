Extension { #name : #ExternalData }

{
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#category : #'*GLFW-FFI-Support',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalData >> pointerAt: byteOffset [

	^ self pointerAt: byteOffset length: ExternalAddress wordSize
]

{
	#category : #'*GLFW-FFI-Support',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalData >> pointerAt: byteOffset length: numBytes [

	| addr |
	addr := ExternalAddress basicNew: numBytes.
	1 to: numBytes do: [:i |
		addr basicAt: i put: (self unsignedByteAt: (byteOffset + i) - 1)].
	^ addr
]
