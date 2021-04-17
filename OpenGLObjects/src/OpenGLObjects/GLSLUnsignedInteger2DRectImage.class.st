Class {
	#name : #GLSLUnsignedInteger2DRectImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DRectImage class >> declarators [

	^ #('uimage2DRect')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DRectImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_2D_RECT
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DRectImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_2D_RECT'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DRectImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DRectImage class >> squeakName [

	^ 'UnsignedInteger2DRectImage'
]
