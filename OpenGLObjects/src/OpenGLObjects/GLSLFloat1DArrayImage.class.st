Class {
	#name : #GLSLFloat1DArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat1DArrayImage class >> declarators [

	^ #('image1DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat1DArrayImage class >> enum [

	^ GL_IMAGE_1D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat1DArrayImage class >> enumName [

	^ 'IMAGE_1D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat1DArrayImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat1DArrayImage class >> squeakName [

	^ 'Float1DArrayImage'
]
