Class {
	#name : #GLFrameBufferCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:42'
}
GLFrameBufferCreationImp >> createFrameBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createFrameBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:41'
}
GLFrameBufferCreationImp >> createFrameBufferIDs: count into: anIntegerArray [

	GL createFramebuffers: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:38'
}
GLFrameBufferCreationImp >> generateFrameBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateFrameBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:38'
}
GLFrameBufferCreationImp >> generateFrameBufferIDs: count into: anIntegerArray [

	GL genFramebuffers: count with: anIntegerArray
]
