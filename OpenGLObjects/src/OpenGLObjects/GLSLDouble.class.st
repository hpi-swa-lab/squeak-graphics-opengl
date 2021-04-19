Class {
	#name : #GLSLDouble,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> commandInitials [

	^ 'd'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> declarators [

	^ #('double')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> enum [

	^ GL_DOUBLE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> enumName [

	^ 'DOUBLE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> glslInitials [

	^ 'd'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> squeakArrayClass [

	^ Float64Array
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLDouble class >> squeakName [

	^ 'Double'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:28'
}
GLSLDouble >> isDouble [

	^ true
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 17:10'
}
GLSLDouble >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentDoubleArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 1/8/2021 18:47'
}
GLSLDouble >> setUniform: aUniform toObject: anObject [

	aUniform setToDouble: anObject asFloat
]
