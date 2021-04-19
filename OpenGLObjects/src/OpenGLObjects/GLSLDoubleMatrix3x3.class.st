Class {
	#name : #GLSLDoubleMatrix3x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> declarators [

	^ #('dmat3' 'dmat3x3')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> enum [

	^ GL_DOUBLE_MAT3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> enumName [

	^ 'DOUBLE_MAT3'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> numColumns [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix3x3 class >> squeakName [

	^ 'DoubleMatrix3x3'
]
