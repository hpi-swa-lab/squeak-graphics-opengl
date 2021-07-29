Class {
	#name : #GLRenderbufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferImp >> createRenderbufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createRenderbufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:50'
}
GLRenderbufferImp >> createRenderbufferIDs: count into: anIntegerArray [

	GL createRenderbuffers: count with: anIntegerArray
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferImp >> generateRenderbufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateRenderbufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferImp >> generateRenderbufferIDs: count into: anIntegerArray [

	GL genRenderbuffers: count with: anIntegerArray
]
