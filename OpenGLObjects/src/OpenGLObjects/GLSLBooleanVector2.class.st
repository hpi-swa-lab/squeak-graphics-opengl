Class {
	#name : #GLSLBooleanVector2,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> componentType [

	^ GLSLBoolean instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> declarators [

	^ #('bvec2')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> enum [

	^ GL_BOOL_VEC2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> enumName [

	^ 'BOOL_VEC2'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> numComponents [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector2 class >> squeakName [

	^ 'BooleanVector2'
]
