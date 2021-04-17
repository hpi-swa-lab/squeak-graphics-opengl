Class {
	#name : #GLSLInteger3DImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger3DImage class >> declarators [

	^ #('iimage3D')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger3DImage class >> enum [

	^ GL_INT_IMAGE_3D
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger3DImage class >> enumName [

	^ 'INT_IMAGE_3D'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger3DImage class >> pixelType [

	^ GLSLInteger instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:03'
}
GLSLInteger3DImage class >> squeakName [

	^ 'Integer3DImage'
]
