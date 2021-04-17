Class {
	#name : #GLSLFloat2DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DSampler class >> declarators [

	^ #('sampler2D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DSampler class >> enum [

	^ GL_SAMPLER_2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DSampler class >> enumName [

	^ 'SAMPLER_2D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat2DSampler class >> squeakName [

	^ 'Float2DSampler'
]
