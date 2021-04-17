Class {
	#name : #GLSLFloatMatrix3x2,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> declarators [

	^ #('mat3x2')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> enum [

	^ GL_FLOAT_MAT3x2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> enumName [

	^ 'FLOAT_MAT3x2'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> numColumns [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> numRows [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x2 class >> squeakName [

	^ 'FloatMatrix3x2'
]
