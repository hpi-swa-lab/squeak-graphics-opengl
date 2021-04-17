Extension { #name : #Float32Array }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 12:47'
}
Float32Array >> floatAt: index [
	"Answer the Float at index in the receiver.  This method converts from either a 32-bit IEEE representation,
	 or a 64-bit IEEE representation to a Squeak Float object.  Primitive. Optional."
	<primitive: 238 error: ec>
	^ Float fromIEEE32Bit: (self basicAt: index)
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 12:50'
}
Float32Array >> floatAt: index put: value [
	"Store the Float value at index in the receiver.  This method converts from a Squeak Float object,
	 or an Integer, into either a 32-bit IEEE representation, or a 64-bit IEEE representation. Primitive. Optional."
	<primitive: 239 error: ec>
	value isFloat 
		ifTrue: [self basicAt: index put: value asIEEE32BitWord]
		ifFalse: [self floatAt: index put: value asFloat].
	^ value
]
