Class {
	#name : #GLSLDoubleMatrix2x2,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> componentType [

	^ GLSLDouble instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> declarators [

	^ #('dmat2' 'dmat2x2')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> enum [

	^ GL_DOUBLE_MAT2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> enumName [

	^ 'DOUBLE_MAT2'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> numColumns [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> numRows [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLDoubleMatrix2x2 class >> squeakName [

	^ 'DoubleMatrix2x2'
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 17:03'
}
GLSLDoubleMatrix2x2 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setToDoubleMatrices2x2: aRawBitsArray count: numElements transpose: true
]
