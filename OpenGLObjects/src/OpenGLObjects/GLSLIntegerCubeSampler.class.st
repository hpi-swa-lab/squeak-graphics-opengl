Class {
	#name : #GLSLIntegerCubeSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> declarators [

	^ #('isamplerCube')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> enum [

	^ GL_INT_SAMPLER_CUBE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> enumName [

	^ 'INT_SAMPLER_CUBE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> squeakName [

	^ 'IntegerCubeSampler'
]
