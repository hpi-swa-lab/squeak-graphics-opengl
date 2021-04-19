Class {
	#name : #GLSLDoubleVector2,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> declarators [

	^ #('dvec2')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> enum [

	^ GL_DOUBLE_VEC2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> enumName [

	^ 'DOUBLE_VEC2'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> numComponents [

	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector2 class >> squeakName [

	^ 'DoubleVector2'
]
