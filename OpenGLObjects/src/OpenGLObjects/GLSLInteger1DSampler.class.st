Class {
	#name : #GLSLInteger1DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DSampler class >> declarators [

	^ #('isampler1D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DSampler class >> enum [

	^ GL_INT_SAMPLER_1D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DSampler class >> enumName [

	^ 'INT_SAMPLER_1D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger1DSampler class >> squeakName [

	^ 'Integer1DSampler'
]
