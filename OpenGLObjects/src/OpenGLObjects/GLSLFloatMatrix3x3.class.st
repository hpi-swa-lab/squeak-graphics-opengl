Class {
	#name : #GLSLFloatMatrix3x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> declarators [

	^ #('mat3' 'mat3x3')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> enum [

	^ GL_FLOAT_MAT3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> enumName [

	^ 'FLOAT_MAT3'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> numColumns [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x3 class >> squeakName [

	^ 'FloatMatrix3x3'
]
