Class {
	#name : #GLSLFloatMatrix4x4,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> declarators [

	^ #('mat4' 'mat4x4')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> enum [

	^ GL_FLOAT_MAT4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> enumName [

	^ 'FLOAT_MAT4'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> numColumns [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> numRows [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x4 class >> squeakName [

	^ 'FloatMatrix4x4'
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/4/2021 03:58'
}
GLSLFloatMatrix4x4 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setToFloatMatrices4x4: aRawBitsArray count: numElements transpose: true
]
