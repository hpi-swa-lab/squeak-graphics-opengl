Class {
	#name : #GLSLUnsignedInteger1DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DImage class >> declarators [

	^ #('uimage1D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_1D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_1D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DImage class >> squeakName [

	^ 'UnsignedInteger1DImage'
]
