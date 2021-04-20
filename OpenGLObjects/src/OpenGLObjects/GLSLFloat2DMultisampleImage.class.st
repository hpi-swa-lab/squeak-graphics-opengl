Class {
	#name : #GLSLFloat2DMultisampleImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleImage class >> declarators [

	^ #('image2DMS')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleImage class >> enum [

	^ GL_IMAGE_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleImage class >> enumName [

	^ 'IMAGE_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleImage class >> squeakName [

	^ 'Float2DMultisampleImage'
]
