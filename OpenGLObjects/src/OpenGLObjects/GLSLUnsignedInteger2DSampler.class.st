Class {
	#name : #GLSLUnsignedInteger2DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> declarators [

	^ #('usampler2D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> squeakName [

	^ 'UnsignedInteger2DSampler'
]
