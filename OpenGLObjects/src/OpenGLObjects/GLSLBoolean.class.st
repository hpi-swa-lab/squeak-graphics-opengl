Class {
	#name : #GLSLBoolean,
	#superclass : #GLSLScalar,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> commandInitials [

	^ 'b'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> declarators [

	^ #('bool')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> enum [

	^ GL_BOOL
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> enumName [

	^ 'BOOL'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> glslInitials [

	^ 'b'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> squeakArrayClass [

	^ WordArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:49'
}
GLSLBoolean class >> squeakName [

	^ 'Boolean'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:57'
}
GLSLBoolean >> actualComponentType [

	^ GLSLInteger instance "Technically other types are possible too, but this is easiest."
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:28'
}
GLSLBoolean >> isBoolean [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:55'
}
GLSLBoolean >> isScalar [

	^ false "for all intents and purposes it isn't"
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 17:09'
}
GLSLBoolean >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentIntegerArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 1/8/2021 18:42'
}
GLSLBoolean >> setUniform: aUniform toObject: anObject [

	aUniform setToInteger: anObject
]
