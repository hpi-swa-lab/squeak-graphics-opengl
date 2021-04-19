Class {
	#name : #GLSLIntegerVector2,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> componentType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> declarators [

	^ #('ivec2')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> enum [

	^ GL_INT_VEC2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> enumName [

	^ 'INT_VEC2'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> numComponents [

	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector2 class >> squeakName [

	^ 'IntegerVector2'
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 17:34'
}
GLSLIntegerVector2 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo2ComponentIntegerArray: aRawBitsArray count: numElements
]
