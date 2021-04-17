Class {
	#name : #GLSLFloatCubeMapArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeMapArrayImage class >> declarators [

	^ #('imageCubeArray')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeMapArrayImage class >> enum [

	^ GL_IMAGE_CUBE_MAP_ARRAY
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeMapArrayImage class >> enumName [

	^ 'IMAGE_CUBE_MAP_ARRAY'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeMapArrayImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloatCubeMapArrayImage class >> squeakName [

	^ 'FloatCubeMapArrayImage'
]
