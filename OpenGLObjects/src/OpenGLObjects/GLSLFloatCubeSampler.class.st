Class {
	#name : #GLSLFloatCubeSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeSampler class >> declarators [

	^ #('samplerCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeSampler class >> enum [

	^ GL_SAMPLER_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeSampler class >> enumName [

	^ 'SAMPLER_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeSampler class >> squeakName [

	^ 'FloatCubeSampler'
]
