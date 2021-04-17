Class {
	#name : #GLSLIntegerCubeImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> declarators [

	^ #('iimageCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> enum [

	^ GL_INT_IMAGE_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> enumName [

	^ 'INT_IMAGE_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLIntegerCubeImage class >> squeakName [

	^ 'IntegerCubeImage'
]
