Class {
	#name : #GLSLFloat2DArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DArrayImage class >> declarators [

	^ #('image2DArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DArrayImage class >> enum [

	^ GL_IMAGE_2D_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DArrayImage class >> enumName [

	^ 'IMAGE_2D_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DArrayImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DArrayImage class >> squeakName [

	^ 'Float2DArrayImage'
]
