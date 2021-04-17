Class {
	#name : #GLSLUnsignedInteger2DMultisampleSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleSampler class >> declarators [

	^ #('usampler2DMS')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleSampler class >> squeakName [

	^ 'UnsignedInteger2DMultisampleSampler'
]
