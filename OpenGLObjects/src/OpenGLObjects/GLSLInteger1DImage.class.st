Class {
	#name : #GLSLInteger1DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> declarators [

	^ #('iimage1D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> enum [

	^ GL_INT_IMAGE_1D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> enumName [

	^ 'INT_IMAGE_1D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger1DImage class >> squeakName [

	^ 'Integer1DImage'
]
