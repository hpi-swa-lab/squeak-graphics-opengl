Class {
	#name : #GLFWVidMode,
	#superclass : #ExternalStructure,
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#commentStamp : ''
}

{
	#category : #'field definition',
	#timestamp : 'stlu 10/20/2020 22:03'
}
GLFWVidMode class >> fields [ "self defineFields"

	^ #(
		(width 'int')
		(height 'int')
		(redBits 'int')
		(greenBits 'int')
		(blueBits 'int')
		(refreshRate 'int')
	)
]
