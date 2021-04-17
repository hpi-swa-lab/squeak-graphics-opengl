Class {
	#name : #GLSLUnsignedIntegerCubeSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeSampler class >> declarators [

	^ #('usamplerCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeSampler class >> squeakName [

	^ 'UnsignedIntegerCubeSampler'
]
