Class {
	#name : #GLSLUnsignedInteger3DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger3DImage class >> declarators [

	^ #('uimage3D')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger3DImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_3D
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger3DImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_3D'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger3DImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger3DImage class >> squeakName [

	^ 'UnsignedInteger3DImage'
]
