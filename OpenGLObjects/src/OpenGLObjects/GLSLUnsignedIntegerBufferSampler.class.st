Class {
	#name : #GLSLUnsignedIntegerBufferSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerBufferSampler class >> declarators [

	^ #('usamplerBuffer')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerBufferSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_BUFFER
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerBufferSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_BUFFER'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerBufferSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerBufferSampler class >> squeakName [

	^ 'UnsignedIntegerBufferSampler'
]
