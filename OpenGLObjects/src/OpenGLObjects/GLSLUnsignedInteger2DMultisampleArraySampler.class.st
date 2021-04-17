Class {
	#name : #GLSLUnsignedInteger2DMultisampleArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleArraySampler class >> declarators [

	^ #('usampler2DMSArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleArraySampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleArraySampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleArraySampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger2DMultisampleArraySampler class >> squeakName [

	^ 'UnsignedInteger2DMultisampleArraySampler'
]
