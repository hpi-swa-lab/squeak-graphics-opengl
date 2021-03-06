Class {
	#name : #GLSLFloatVector4,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> declarators [

	^ #('vec4')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> enum [

	^ GL_FLOAT_VEC4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> enumName [

	^ 'FLOAT_VEC4'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> numComponents [

	^ 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector4 class >> squeakName [

	^ 'FloatVector4'
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 1/4/2021 03:59'
}
GLSLFloatVector4 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo4ComponentFloatArray: aRawBitsArray count: numElements
]
