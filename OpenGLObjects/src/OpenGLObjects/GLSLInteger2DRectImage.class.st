Class {
	#name : #GLSLInteger2DRectImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DRectImage class >> declarators [

	^ #('iimage2DRect')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DRectImage class >> enum [

	^ GL_INT_IMAGE_2D_RECT
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DRectImage class >> enumName [

	^ 'INT_IMAGE_2D_RECT'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DRectImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DRectImage class >> squeakName [

	^ 'Integer2DRectImage'
]
