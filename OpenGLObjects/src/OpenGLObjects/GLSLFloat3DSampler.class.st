Class {
	#name : #GLSLFloat3DSampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat3DSampler class >> declarators [

	^ #('sampler3D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat3DSampler class >> enum [

	^ GL_SAMPLER_3D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat3DSampler class >> enumName [

	^ 'SAMPLER_3D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat3DSampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloat3DSampler class >> squeakName [

	^ 'Float3DSampler'
]
