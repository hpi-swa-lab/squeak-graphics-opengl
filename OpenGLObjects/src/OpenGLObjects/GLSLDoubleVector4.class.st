Class {
	#name : #GLSLDoubleVector4,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> declarators [

	^ #('dvec4')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> enum [

	^ GL_DOUBLE_VEC4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> enumName [

	^ 'DOUBLE_VEC4'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> numComponents [

	^ 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector4 class >> squeakName [

	^ 'DoubleVector4'
]
