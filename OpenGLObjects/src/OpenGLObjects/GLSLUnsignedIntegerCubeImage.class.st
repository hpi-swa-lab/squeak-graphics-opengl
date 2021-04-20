Class {
	#name : #GLSLUnsignedIntegerCubeImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> declarators [

	^ #('uimageCube')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_CUBE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_CUBE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> squeakName [

	^ 'UnsignedIntegerCubeImage'
]
