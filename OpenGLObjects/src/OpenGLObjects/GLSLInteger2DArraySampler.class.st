Class {
	#name : #GLSLInteger2DArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DArraySampler class >> declarators [

	^ #('isampler2DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DArraySampler class >> enum [

	^ GL_INT_SAMPLER_2D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DArraySampler class >> enumName [

	^ 'INT_SAMPLER_2D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DArraySampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLInteger2DArraySampler class >> squeakName [

	^ 'Integer2DArraySampler'
]
