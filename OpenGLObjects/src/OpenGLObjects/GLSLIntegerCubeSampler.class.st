Class {
	#name : #GLSLIntegerCubeSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> declarators [

	^ #('isamplerCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> enum [

	^ GL_INT_SAMPLER_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> enumName [

	^ 'INT_SAMPLER_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeSampler class >> squeakName [

	^ 'IntegerCubeSampler'
]
