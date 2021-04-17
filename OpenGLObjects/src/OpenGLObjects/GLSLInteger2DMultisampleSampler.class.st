Class {
	#name : #GLSLInteger2DMultisampleSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> declarators [

	^ #('isampler2DMS')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> enum [

	^ GL_INT_SAMPLER_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> enumName [

	^ 'INT_SAMPLER_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DMultisampleSampler class >> squeakName [

	^ 'Integer2DMultisampleSampler'
]
