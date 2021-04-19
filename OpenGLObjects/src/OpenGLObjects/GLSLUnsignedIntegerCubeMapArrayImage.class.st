Class {
	#name : #GLSLUnsignedIntegerCubeMapArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeMapArrayImage class >> declarators [

	^ #('uimageCubeArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeMapArrayImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeMapArrayImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeMapArrayImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeMapArrayImage class >> squeakName [

	^ 'UnsignedIntegerCubeMapArrayImage'
]
