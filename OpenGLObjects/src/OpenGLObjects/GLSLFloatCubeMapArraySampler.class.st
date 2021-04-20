Class {
	#name : #GLSLFloatCubeMapArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> declarators [

	^ #('samplerCubeArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> enum [

	^ GL_SAMPLER_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> enumName [

	^ 'SAMPLER_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLFloatCubeMapArraySampler class >> squeakName [

	^ 'FloatCubeMapArraySampler'
]
