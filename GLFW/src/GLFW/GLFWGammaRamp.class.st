Class {
	#name : #GLFWGammaRamp,
	#superclass : #ExternalStructure,
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#'squeak_changestamp' : ''
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 10/20/2020 22:06'
}
GLFWGammaRamp class >> fields [ "self defineFields"

	^ #(
		(red 'unsignedShort*')
		(green 'unsignedShort*')
		(blue 'unsignedShort*')
		(size 'unsignedInt')
	)
]
