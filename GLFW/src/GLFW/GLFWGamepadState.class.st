Class {
	#name : #GLFWGamepadState,
	#superclass : #ExternalStructure,
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#commentStamp : ''
}

{
	#category : #'field definition',
	#timestamp : 'stlu 10/20/2020 22:04'
}
GLFWGamepadState class >> fields [ "self defineFields"

	^ #(
		(buttons 'unsignedChar[15]')
		(axes 'float[6]')
	)
]
