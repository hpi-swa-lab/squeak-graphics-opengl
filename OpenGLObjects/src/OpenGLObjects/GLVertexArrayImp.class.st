Class {
	#name : #GLVertexArrayImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:51'
}
GLVertexArrayImp >> bindVertexArray: vertexArrayOrNil [

	GL bindVertexArray: (vertexArrayOrNil ifNil: [0] ifNotNil: [vertexArrayOrNil id]).
]

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
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:48'
}
GLVertexArrayImp >> deleteVertexArray: aVertexArray [

	GL
		deleteVertexArrays: 1
		with: (WordArray with: aVertexArray id).
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
