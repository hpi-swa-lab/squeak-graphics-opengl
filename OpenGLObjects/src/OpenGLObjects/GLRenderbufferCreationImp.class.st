Class {
	#name : #GLRenderbufferCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferCreationImp >> createRenderbufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createRenderbufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:50'
}
GLRenderbufferCreationImp >> createRenderbufferIDs: count into: anIntegerArray [

	GL createRenderbuffers: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferCreationImp >> generateRenderbufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateRenderbufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbufferCreationImp >> generateRenderbufferIDs: count into: anIntegerArray [

	GL genRenderbuffers: count with: anIntegerArray
]
