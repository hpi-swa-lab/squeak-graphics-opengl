Class {
	#name : #GLSLFloat1DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DSampler class >> declarators [

	^ #('sampler1D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DSampler class >> enum [

	^ GL_SAMPLER_1D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DSampler class >> enumName [

	^ 'SAMPLER_1D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat1DSampler class >> squeakName [

	^ 'Float1DSampler'
]
