Class {
	#name : #GLSLFloat1DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DArraySampler class >> declarators [

	^ #('sampler1DArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DArraySampler class >> enum [

	^ GL_SAMPLER_1D_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DArraySampler class >> enumName [

	^ 'SAMPLER_1D_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DArraySampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DArraySampler class >> squeakName [

	^ 'Float1DArraySampler'
]
