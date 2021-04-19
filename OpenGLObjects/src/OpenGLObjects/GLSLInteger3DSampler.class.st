Class {
	#name : #GLSLInteger3DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger3DSampler class >> declarators [

	^ #('isampler3D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger3DSampler class >> enum [

	^ GL_INT_SAMPLER_3D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger3DSampler class >> enumName [

	^ 'INT_SAMPLER_3D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger3DSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger3DSampler class >> squeakName [

	^ 'Integer3DSampler'
]
