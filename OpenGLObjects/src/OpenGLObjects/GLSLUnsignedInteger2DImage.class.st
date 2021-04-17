Class {
	#name : #GLSLUnsignedInteger2DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DImage class >> declarators [

	^ #('uimage2D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_2D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DImage class >> squeakName [

	^ 'UnsignedInteger2DImage'
]
