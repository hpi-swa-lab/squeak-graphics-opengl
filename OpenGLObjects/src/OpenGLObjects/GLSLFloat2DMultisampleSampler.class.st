Class {
	#name : #GLSLFloat2DMultisampleSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleSampler class >> declarators [

	^ #('sampler2DMS')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleSampler class >> enum [

	^ GL_SAMPLER_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleSampler class >> enumName [

	^ 'SAMPLER_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DMultisampleSampler class >> squeakName [

	^ 'Float2DMultisampleSampler'
]
