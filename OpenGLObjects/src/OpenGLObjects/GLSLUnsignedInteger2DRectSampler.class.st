Class {
	#name : #GLSLUnsignedInteger2DRectSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DRectSampler class >> declarators [

	^ #('usampler2DRect')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DRectSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D_RECT
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DRectSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D_RECT'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DRectSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DRectSampler class >> squeakName [

	^ 'UnsignedInteger2DRectSampler'
]
