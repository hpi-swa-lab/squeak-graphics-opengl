Class {
	#name : #GLSLIntegerBufferImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerBufferImage class >> declarators [

	^ #('iimageBuffer')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerBufferImage class >> enum [

	^ GL_INT_IMAGE_BUFFER
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerBufferImage class >> enumName [

	^ 'INT_IMAGE_BUFFER'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerBufferImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerBufferImage class >> squeakName [

	^ 'IntegerBufferImage'
]
