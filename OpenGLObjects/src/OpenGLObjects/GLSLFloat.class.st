Class {
	#name : #GLSLFloat,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> commandInitials [

	^ 'f'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> declarators [

	^ #('float')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> enum [

	^ GL_FLOAT
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> enumName [

	^ 'FLOAT'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> glslInitials [

	^ ''
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> squeakArrayClass [

	^ Float32Array
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLFloat class >> squeakName [

	^ 'Float'
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 18:28'
}
GLSLFloat >> isFloat [

	^ true
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 17:10'
}
GLSLFloat >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentFloatArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/8/2021 18:47'
}
GLSLFloat >> setUniform: aUniform toObject: anObject [

	aUniform setToFloat: anObject asFloat
]
