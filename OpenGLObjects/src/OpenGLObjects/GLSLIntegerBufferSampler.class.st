Class {
	#name : #GLSLIntegerBufferSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerBufferSampler class >> declarators [

	^ #('isamplerBuffer')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerBufferSampler class >> enum [

	^ GL_INT_SAMPLER_BUFFER
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerBufferSampler class >> enumName [

	^ 'INT_SAMPLER_BUFFER'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerBufferSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerBufferSampler class >> squeakName [

	^ 'IntegerBufferSampler'
]
