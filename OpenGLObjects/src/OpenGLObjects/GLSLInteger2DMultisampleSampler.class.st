Class {
	#name : #GLSLInteger2DMultisampleSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> declarators [

	^ #('isampler2DMS')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> enum [

	^ GL_INT_SAMPLER_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> enumName [

	^ 'INT_SAMPLER_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> squeakName [

	^ 'Integer2DMultisampleSampler'
]
