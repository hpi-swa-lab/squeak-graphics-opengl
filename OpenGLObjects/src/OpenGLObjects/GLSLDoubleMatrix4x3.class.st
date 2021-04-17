Class {
	#name : #GLSLDoubleMatrix4x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> declarators [

	^ #('dmat4x3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> enum [

	^ GL_DOUBLE_MAT4x3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> enumName [

	^ 'DOUBLE_MAT4x3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> numColumns [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix4x3 class >> squeakName [

	^ 'DoubleMatrix4x3'
]
