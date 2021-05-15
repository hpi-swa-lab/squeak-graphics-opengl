Class {
	#name : #GLVertexArrayCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:51'
}
GLVertexArrayCreationImp >> createVertexArrayIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createVertexArrayIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:51'
}
GLVertexArrayCreationImp >> createVertexArrayIDs: count into: anIntegerArray [

	GL createVertexArrays: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:52'
}
GLVertexArrayCreationImp >> generateVertexArrayIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateVertexArrayIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:52'
}
GLVertexArrayCreationImp >> generateVertexArrayIDs: count into: anIntegerArray [

	GL genVertexArrays: count with: anIntegerArray
]
