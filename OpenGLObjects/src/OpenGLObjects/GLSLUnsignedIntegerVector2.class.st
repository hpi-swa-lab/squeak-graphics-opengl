Class {
	#name : #GLSLUnsignedIntegerVector2,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> componentType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> declarators [

	^ #('uvec2')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> enum [

	^ GL_UNSIGNED_INT_VEC2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> enumName [

	^ 'UNSIGNED_INT_VEC2'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> numComponents [

	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector2 class >> squeakName [

	^ 'UnsignedIntegerVector2'
]
