Class {
	#name : #FFICallbackResult,
	#superclass : #ExternalUnion,
	#category : #'GLFW-FFI-Support'
}

{
	#category : #'field definition',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
FFICallbackResult class >> fields [
	"
	self defineFields.
	"
	^ #(
		(booleanResult			'bool')
		(floatResult				'double')
		(positiveIntegerResult	'uintptr_t')
		(integerResult			'intptr_t')
	)
]
