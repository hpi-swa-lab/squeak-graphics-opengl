Class {
	#name : #GLSLFloatCubeImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeImage class >> declarators [

	^ #('imageCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeImage class >> enum [

	^ GL_IMAGE_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeImage class >> enumName [

	^ 'IMAGE_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeImage class >> squeakName [

	^ 'FloatCubeImage'
]
