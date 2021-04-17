Class {
	#name : #GLSLFloatCubeMapArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> declarators [

	^ #('samplerCubeArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> enum [

	^ GL_SAMPLER_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> enumName [

	^ 'SAMPLER_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> squeakName [

	^ 'FloatCubeMapArraySampler'
]
