Class {
	#name : #GLSLInteger2DMultisampleImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DMultisampleImage class >> declarators [

	^ #('iimage2DMS')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DMultisampleImage class >> enum [

	^ GL_INT_IMAGE_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DMultisampleImage class >> enumName [

	^ 'INT_IMAGE_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DMultisampleImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DMultisampleImage class >> squeakName [

	^ 'Integer2DMultisampleImage'
]
