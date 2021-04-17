Class {
	#name : #GLSLFloatVector3,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> componentType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> declarators [

	^ #('vec3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> enum [

	^ GL_FLOAT_VEC3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> enumName [

	^ 'FLOAT_VEC3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatVector3 class >> squeakName [

	^ 'FloatVector3'
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/6/2021 14:09'
}
GLSLFloatVector3 >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo3ComponentFloatArray: aRawBitsArray count: numElements
]
