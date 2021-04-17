Class {
	#name : #GLSLUnsignedInteger1DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DArraySampler class >> declarators [

	^ #('usampler1DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DArraySampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_1D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DArraySampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_1D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DArraySampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DArraySampler class >> squeakName [

	^ 'UnsignedInteger1DArraySampler'
]
