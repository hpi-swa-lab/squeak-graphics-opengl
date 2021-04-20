Class {
	#name : #GLSLFloatBufferImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> declarators [

	^ #('imageBuffer')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> enum [

	^ GL_IMAGE_BUFFER
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> enumName [

	^ 'IMAGE_BUFFER'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> squeakName [

	^ 'FloatBufferImage'
]
