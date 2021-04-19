Class {
	#name : #GLSLIntegerVector3,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> componentType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> declarators [

	^ #('ivec3')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> enum [

	^ GL_INT_VEC3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> enumName [

	^ 'INT_VEC3'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerVector3 class >> squeakName [

	^ 'IntegerVector3'
]
