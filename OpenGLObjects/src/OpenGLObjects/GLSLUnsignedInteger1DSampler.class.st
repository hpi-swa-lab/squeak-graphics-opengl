Class {
	#name : #GLSLUnsignedInteger1DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DSampler class >> declarators [

	^ #('usampler1D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_1D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_1D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger1DSampler class >> squeakName [

	^ 'UnsignedInteger1DSampler'
]
