Class {
	#name : #GLSLFloatMatrix4x3,
	#superclass : #GLSLMatrix,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> declarators [

	^ #('mat4x3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> enum [

	^ GL_FLOAT_MAT4x3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> enumName [

	^ 'FLOAT_MAT4x3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> numColumns [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> numRows [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 12:49'
}
GLSLFloatMatrix4x3 class >> squeakName [

	^ 'FloatMatrix4x3'
]
