"
I am the default value of `GL`.
"
Class {
	#name : #GLInvalidLibrary,
	#superclass : #GLLibrary,
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 4/14/2021 18:22'
}

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 4/22/2021 12:01'
}
GLInvalidLibrary >> activateContext [

	GL context ifNotNil: [:ctxt |
		ctxt deactivate]
]
