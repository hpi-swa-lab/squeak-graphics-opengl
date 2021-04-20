Class {
	#name : #GLSLInteger2DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DImage class >> declarators [

	^ #('iimage2D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DImage class >> enum [

	^ GL_INT_IMAGE_2D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DImage class >> enumName [

	^ 'INT_IMAGE_2D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DImage class >> squeakName [

	^ 'Integer2DImage'
]
