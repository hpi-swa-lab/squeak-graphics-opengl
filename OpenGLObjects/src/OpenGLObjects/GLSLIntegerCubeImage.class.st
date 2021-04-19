Class {
	#name : #GLSLIntegerCubeImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> declarators [

	^ #('iimageCube')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> enum [

	^ GL_INT_IMAGE_CUBE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> enumName [

	^ 'INT_IMAGE_CUBE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> squeakName [

	^ 'IntegerCubeImage'
]
