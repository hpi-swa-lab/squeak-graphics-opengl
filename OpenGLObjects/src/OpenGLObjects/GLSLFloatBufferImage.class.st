Class {
	#name : #GLSLFloatBufferImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> declarators [

	^ #('imageBuffer')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> enum [

	^ GL_IMAGE_BUFFER
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> enumName [

	^ 'IMAGE_BUFFER'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatBufferImage class >> squeakName [

	^ 'FloatBufferImage'
]
