Class {
	#name : #GLSLFloat2DMultisampleArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleArraySampler class >> declarators [

	^ #('sampler2DMSArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleArraySampler class >> enum [

	^ GL_SAMPLER_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleArraySampler class >> enumName [

	^ 'SAMPLER_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleArraySampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleArraySampler class >> squeakName [

	^ 'Float2DMultisampleArraySampler'
]
