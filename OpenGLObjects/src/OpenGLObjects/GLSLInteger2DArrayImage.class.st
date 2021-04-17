Class {
	#name : #GLSLInteger2DArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DArrayImage class >> declarators [

	^ #('iimage2DArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DArrayImage class >> enum [

	^ GL_INT_IMAGE_2D_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DArrayImage class >> enumName [

	^ 'INT_IMAGE_2D_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DArrayImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger2DArrayImage class >> squeakName [

	^ 'Integer2DArrayImage'
]
