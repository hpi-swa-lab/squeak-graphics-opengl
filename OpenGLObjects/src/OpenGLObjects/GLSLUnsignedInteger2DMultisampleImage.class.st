Class {
	#name : #GLSLUnsignedInteger2DMultisampleImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleImage class >> declarators [

	^ #('uimage2DMS')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_2D_MULTISAMPLE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleImage class >> squeakName [

	^ 'UnsignedInteger2DMultisampleImage'
]
