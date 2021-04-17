Class {
	#name : #GLSLFloat3DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat3DImage class >> declarators [

	^ #('image3D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat3DImage class >> enum [

	^ GL_IMAGE_3D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat3DImage class >> enumName [

	^ 'IMAGE_3D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat3DImage class >> pixelType [

	^ GLSLFloat instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLFloat3DImage class >> squeakName [

	^ 'Float3DImage'
]
