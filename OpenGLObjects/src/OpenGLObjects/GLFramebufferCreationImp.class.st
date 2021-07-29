Class {
	#name : #GLFramebufferCreationImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferCreationImp >> createFramebufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createFramebufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferCreationImp >> createFramebufferIDs: count into: anIntegerArray [

	GL createFramebuffers: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferCreationImp >> generateFramebufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateFramebufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:17'
}
GLFramebufferCreationImp >> generateFramebufferIDs: count into: anIntegerArray [

	GL genFramebuffers: count with: anIntegerArray
]
