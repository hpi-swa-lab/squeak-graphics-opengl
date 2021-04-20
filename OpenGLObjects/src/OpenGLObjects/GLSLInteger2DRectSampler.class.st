Class {
	#name : #GLSLInteger2DRectSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DRectSampler class >> declarators [

	^ #('isampler2DRect')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DRectSampler class >> enum [

	^ GL_INT_SAMPLER_2D_RECT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DRectSampler class >> enumName [

	^ 'INT_SAMPLER_2D_RECT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DRectSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DRectSampler class >> squeakName [

	^ 'Integer2DRectSampler'
]
