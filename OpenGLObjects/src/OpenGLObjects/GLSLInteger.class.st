Class {
	#name : #GLSLInteger,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> commandInitials [

	^ 'i'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> declarators [

	^ #('int')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> enum [

	^ GL_INT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> enumName [

	^ 'INT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> glslInitials [

	^ 'i'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> squeakArrayClass [

	^ IntegerArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLInteger class >> squeakName [

	^ 'Integer'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:29'
}
GLSLInteger >> isInteger [

	^ true
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 17:11'
}
GLSLInteger >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentIntegerArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 1/8/2021 18:49'
}
GLSLInteger >> setUniform: aUniform toObject: anObject [

	aUniform setToFloat: anObject asInteger
]
