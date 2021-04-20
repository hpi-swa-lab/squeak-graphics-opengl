Class {
	#name : #GLSLUnsignedInteger,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> commandInitials [

	^ 'ui'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> declarators [

	^ #('uint' 'unsigned int')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> enum [

	^ GL_UNSIGNED_INT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> enumName [

	^ 'UNSIGNED_INT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> glslInitials [

	^ 'u'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> squeakArrayClass [

	^ WordArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLUnsignedInteger class >> squeakName [

	^ 'UnsignedInteger'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:29'
}
GLSLUnsignedInteger >> isUnsignedInteger [

	^ true
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 17:11'
}
GLSLUnsignedInteger >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentUnsignedIntegerArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 1/8/2021 18:49'
}
GLSLUnsignedInteger >> setUniform: aUniform toObject: anObject [

	aUniform setToUnsignedInteger: anObject
]
