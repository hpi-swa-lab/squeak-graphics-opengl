Class {
	#name : #GLSLUnsignedIntegerVector4,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> componentType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> declarators [

	^ #('uvec4')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> enum [

	^ GL_UNSIGNED_INT_VEC4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> enumName [

	^ 'UNSIGNED_INT_VEC4'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> numComponents [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerVector4 class >> squeakName [

	^ 'UnsignedIntegerVector4'
]
