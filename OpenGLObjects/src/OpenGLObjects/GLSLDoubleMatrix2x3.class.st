Class {
	#name : #GLSLDoubleMatrix2x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> declarators [

	^ #('dmat2x3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> enum [

	^ GL_DOUBLE_MAT2x3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> enumName [

	^ 'DOUBLE_MAT2x3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> numColumns [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x3 class >> squeakName [

	^ 'DoubleMatrix2x3'
]
