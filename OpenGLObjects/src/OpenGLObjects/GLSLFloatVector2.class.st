Class {
	#name : #GLSLFloatVector2,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> declarators [

	^ #('vec2')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> enum [

	^ GL_FLOAT_VEC2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> enumName [

	^ 'FLOAT_VEC2'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> numComponents [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector2 class >> squeakName [

	^ 'FloatVector2'
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/6/2021 14:10'
}
GLSLFloatVector2 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo2ComponentFloatArray: aRawBitsArray count: numElements
]
