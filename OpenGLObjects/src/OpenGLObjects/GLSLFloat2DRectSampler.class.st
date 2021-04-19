Class {
	#name : #GLSLFloat2DRectSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DRectSampler class >> declarators [

	^ #('sampler2DRect')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DRectSampler class >> enum [

	^ GL_SAMPLER_2D_RECT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DRectSampler class >> enumName [

	^ 'SAMPLER_2D_RECT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DRectSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DRectSampler class >> squeakName [

	^ 'Float2DRectSampler'
]
