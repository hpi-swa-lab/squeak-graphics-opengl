Class {
	#name : #GLSLInteger1DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DArraySampler class >> declarators [

	^ #('isampler1DArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DArraySampler class >> enum [

	^ GL_INT_SAMPLER_1D_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DArraySampler class >> enumName [

	^ 'INT_SAMPLER_1D_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DArraySampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DArraySampler class >> squeakName [

	^ 'Integer1DArraySampler'
]
