Class {
	#name : #GLFWImage,
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
GLFWImage class >> fields [ "self defineFields"

	^ #(
		(width 'int')
		(height 'int')
		(pixels 'unsignedChar*')
	)
]
