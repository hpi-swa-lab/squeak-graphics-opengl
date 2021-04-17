Class {
	#name : #GLSLUnsignedInteger2DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> declarators [

	^ #('usampler2DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DArraySampler class >> squeakName [

	^ 'UnsignedInteger2DArraySampler'
]
