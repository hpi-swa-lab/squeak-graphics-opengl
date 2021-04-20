Class {
	#name : #GLSLFloat2DRectImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DRectImage class >> declarators [

	^ #('image2DRect')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DRectImage class >> enum [

	^ GL_IMAGE_2D_RECT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DRectImage class >> enumName [

	^ 'IMAGE_2D_RECT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DRectImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DRectImage class >> squeakName [

	^ 'Float2DRectImage'
]
