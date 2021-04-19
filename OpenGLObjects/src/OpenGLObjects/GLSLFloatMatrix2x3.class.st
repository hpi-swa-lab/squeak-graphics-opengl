Class {
	#name : #GLSLFloatMatrix2x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> declarators [

	^ #('mat2x3')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> enum [

	^ GL_FLOAT_MAT2x3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> enumName [

	^ 'FLOAT_MAT2x3'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> numColumns [

	^ 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x3 class >> squeakName [

	^ 'FloatMatrix2x3'
]
