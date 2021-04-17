Class {
	#name : #GLSLUnsignedIntegerVector3,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> componentType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> declarators [

	^ #('uvec3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> enum [

	^ GL_UNSIGNED_INT_VEC3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> enumName [

	^ 'UNSIGNED_INT_VEC3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector3 class >> squeakName [

	^ 'UnsignedIntegerVector3'
]
