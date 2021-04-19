Class {
	#name : #GLSLInteger1DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> declarators [

	^ #('iimage1D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> enum [

	^ GL_INT_IMAGE_1D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> enumName [

	^ 'INT_IMAGE_1D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> squeakName [

	^ 'Integer1DImage'
]
