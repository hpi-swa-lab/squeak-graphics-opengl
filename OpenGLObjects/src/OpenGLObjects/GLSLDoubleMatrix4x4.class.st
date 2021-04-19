Class {
	#name : #GLSLDoubleMatrix4x4,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> declarators [

	^ #('dmat4' 'dmat4x4')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> enum [

	^ GL_DOUBLE_MAT4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> enumName [

	^ 'DOUBLE_MAT4'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> numColumns [

	^ 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> numRows [

	^ 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x4 class >> squeakName [

	^ 'DoubleMatrix4x4'
]
