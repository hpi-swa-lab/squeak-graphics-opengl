Class {
	#name : #GLSLUnsignedInteger2DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> declarators [

	^ #('usampler2DArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> squeakName [

	^ 'UnsignedInteger2DArraySampler'
]
