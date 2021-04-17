Class {
	#name : #GLSLUnsignedIntegerCubeImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> declarators [

	^ #('uimageCube')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_CUBE
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_CUBE'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedIntegerCubeImage class >> squeakName [

	^ 'UnsignedIntegerCubeImage'
]
