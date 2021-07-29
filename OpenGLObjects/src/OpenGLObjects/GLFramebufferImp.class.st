Class {
	#name : #GLFramebufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferImp >> createFramebufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createFramebufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferImp >> createFramebufferIDs: count into: anIntegerArray [

	GL createFramebuffers: count with: anIntegerArray
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferImp >> generateFramebufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateFramebufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferImp >> generateFramebufferIDs: count into: anIntegerArray [

	GL genFramebuffers: count with: anIntegerArray
]
