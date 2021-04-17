Class {
	#name : #GLSLUnsignedInteger1DArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DArrayImage class >> declarators [

	^ #('uimage1DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DArrayImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_1D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DArrayImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_1D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DArrayImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger1DArrayImage class >> squeakName [

	^ 'UnsignedInteger1DArrayImage'
]
