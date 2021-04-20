Class {
	#name : #GLSLUnsignedIntegerCubeMapArraySampler,
	#superclass : #GLSLSampler,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeMapArraySampler class >> declarators [

	^ #('usamplerCubeArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeMapArraySampler class >> enum [

	^ GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeMapArraySampler class >> enumName [

	^ 'UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeMapArraySampler class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:04'
}
GLSLUnsignedIntegerCubeMapArraySampler class >> squeakName [

	^ 'UnsignedIntegerCubeMapArraySampler'
]
