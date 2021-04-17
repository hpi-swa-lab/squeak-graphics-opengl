Class {
	#name : #GLSLBooleanVector4,
	#superclass : #GLSLVector,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> componentType [

	^ GLSLBoolean instance
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> declarators [

	^ #('bvec4')
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> enum [

	^ GL_BOOL_VEC4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> enumName [

	^ 'BOOL_VEC4'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> numComponents [

	^ 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLBooleanVector4 class >> squeakName [

	^ 'BooleanVector4'
]
