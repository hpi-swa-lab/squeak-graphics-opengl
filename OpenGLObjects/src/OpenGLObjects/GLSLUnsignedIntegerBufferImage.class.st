Class {
	#name : #GLSLUnsignedIntegerBufferImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerBufferImage class >> declarators [

	^ #('uimageBuffer')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerBufferImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_BUFFER
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerBufferImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_BUFFER'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerBufferImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerBufferImage class >> squeakName [

	^ 'UnsignedIntegerBufferImage'
]
