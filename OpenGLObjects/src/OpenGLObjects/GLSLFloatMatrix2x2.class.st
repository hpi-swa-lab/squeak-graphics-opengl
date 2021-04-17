Class {
	#name : #GLSLFloatMatrix2x2,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> declarators [

	^ #('mat2' 'mat2x2')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> enum [

	^ GL_FLOAT_MAT2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> enumName [

	^ 'FLOAT_MAT2'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> numColumns [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> numRows [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix2x2 class >> squeakName [

	^ 'FloatMatrix2x2'
]
