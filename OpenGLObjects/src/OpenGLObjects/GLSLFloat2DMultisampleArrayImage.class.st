Class {
	#name : #GLSLFloat2DMultisampleArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleArrayImage class >> declarators [

	^ #('image2DMSArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleArrayImage class >> enum [

	^ GL_IMAGE_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleArrayImage class >> enumName [

	^ 'IMAGE_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleArrayImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat2DMultisampleArrayImage class >> squeakName [

	^ 'Float2DMultisampleArrayImage'
]
