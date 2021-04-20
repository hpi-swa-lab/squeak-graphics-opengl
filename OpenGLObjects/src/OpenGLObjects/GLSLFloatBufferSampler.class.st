Class {
	#name : #GLSLFloatBufferSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatBufferSampler class >> declarators [

	^ #('samplerBuffer')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatBufferSampler class >> enum [

	^ GL_SAMPLER_BUFFER
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatBufferSampler class >> enumName [

	^ 'SAMPLER_BUFFER'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatBufferSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatBufferSampler class >> squeakName [

	^ 'FloatBufferSampler'
]
