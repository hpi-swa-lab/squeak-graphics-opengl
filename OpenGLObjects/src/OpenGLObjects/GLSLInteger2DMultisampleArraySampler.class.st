Class {
	#name : #GLSLInteger2DMultisampleArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleArraySampler class >> declarators [

	^ #('isampler2DMSArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleArraySampler class >> enum [

	^ GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleArraySampler class >> enumName [

	^ 'INT_SAMPLER_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleArraySampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleArraySampler class >> squeakName [

	^ 'Integer2DMultisampleArraySampler'
]
