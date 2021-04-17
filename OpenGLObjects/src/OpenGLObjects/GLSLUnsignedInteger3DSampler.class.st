Class {
	#name : #GLSLUnsignedInteger3DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger3DSampler class >> declarators [

	^ #('usampler3D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger3DSampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_3D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger3DSampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_3D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger3DSampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedInteger3DSampler class >> squeakName [

	^ 'UnsignedInteger3DSampler'
]
