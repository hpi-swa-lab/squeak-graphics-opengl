Class {
	#name : #GLSLIntegerCubeMapArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeMapArrayImage class >> declarators [

	^ #('iimageCubeArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeMapArrayImage class >> enum [

	^ GL_INT_IMAGE_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeMapArrayImage class >> enumName [

	^ 'INT_IMAGE_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeMapArrayImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeMapArrayImage class >> squeakName [

	^ 'IntegerCubeMapArrayImage'
]
