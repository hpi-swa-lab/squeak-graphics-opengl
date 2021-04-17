Class {
	#name : #GLSLBooleanVector3,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> componentType [

	^ GLSLBoolean instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> declarators [

	^ #('bvec3')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> enum [

	^ GL_BOOL_VEC3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> enumName [

	^ 'BOOL_VEC3'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> numComponents [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector3 class >> squeakName [

	^ 'BooleanVector3'
]
