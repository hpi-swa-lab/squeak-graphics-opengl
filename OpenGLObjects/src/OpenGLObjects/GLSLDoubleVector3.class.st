Class {
	#name : #GLSLDoubleVector3,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> declarators [

	^ #('dvec3')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> enum [

	^ GL_DOUBLE_VEC3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> enumName [

	^ 'DOUBLE_VEC3'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLDoubleVector3 class >> squeakName [

	^ 'DoubleVector3'
]
