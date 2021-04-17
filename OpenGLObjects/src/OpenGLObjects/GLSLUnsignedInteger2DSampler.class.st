Class {
	#name : #GLSLUnsignedInteger2DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> declarators [

	^ #('usampler2D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DSampler class >> squeakName [

	^ 'UnsignedInteger2DSampler'
]
