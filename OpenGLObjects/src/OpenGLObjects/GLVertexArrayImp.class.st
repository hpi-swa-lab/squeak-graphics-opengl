Class {
	#name : #GLVertexArrayImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:51'
}
GLVertexArrayImp >> createVertexArrayIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createVertexArrayIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:51'
}
GLVertexArrayImp >> createVertexArrayIDs: count into: anIntegerArray [

	GL createVertexArrays: count with: anIntegerArray
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:52'
}
GLVertexArrayImp >> generateVertexArrayIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateVertexArrayIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:52'
}
GLVertexArrayImp >> generateVertexArrayIDs: count into: anIntegerArray [

	GL genVertexArrays: count with: anIntegerArray
]
