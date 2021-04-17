Class {
	#name : #GLSLIntegerCubeMapArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeMapArraySampler class >> declarators [

	^ #('isamplerCubeArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeMapArraySampler class >> enum [

	^ GL_INT_SAMPLER_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeMapArraySampler class >> enumName [

	^ 'INT_SAMPLER_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeMapArraySampler class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLIntegerCubeMapArraySampler class >> squeakName [

	^ 'IntegerCubeMapArraySampler'
]
