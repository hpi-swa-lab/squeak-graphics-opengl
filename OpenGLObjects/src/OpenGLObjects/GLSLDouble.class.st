Class {
	#name : #GLSLDouble,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> commandInitials [

	^ 'd'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> declarators [

	^ #('double')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> enum [

	^ GL_DOUBLE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> enumName [

	^ 'DOUBLE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> glslInitials [

	^ 'd'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> squeakArrayClass [

	^ Float64Array
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> squeakName [

	^ 'Double'
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 18:28'
}
GLSLDouble >> isDouble [

	^ true
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 17:10'
}
GLSLDouble >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentDoubleArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/8/2021 18:47'
}
GLSLDouble >> setUniform: aUniform toObject: anObject [

	aUniform setToDouble: anObject asFloat
]
