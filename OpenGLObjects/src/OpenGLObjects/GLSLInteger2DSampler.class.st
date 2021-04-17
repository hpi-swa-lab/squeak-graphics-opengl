Class {
	#name : #GLSLInteger2DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DSampler class >> declarators [

	^ #('isampler2D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DSampler class >> enum [

	^ GL_INT_SAMPLER_2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DSampler class >> enumName [

	^ 'INT_SAMPLER_2D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DSampler class >> squeakName [

	^ 'Integer2DSampler'
]
