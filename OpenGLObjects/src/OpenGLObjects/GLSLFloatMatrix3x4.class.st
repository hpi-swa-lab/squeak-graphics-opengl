Class {
	#name : #GLSLFloatMatrix3x4,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> declarators [

	^ #('mat3x4')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> enum [

	^ GL_FLOAT_MAT3x4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> enumName [

	^ 'FLOAT_MAT3x4'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> numColumns [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> numRows [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix3x4 class >> squeakName [

	^ 'FloatMatrix3x4'
]
