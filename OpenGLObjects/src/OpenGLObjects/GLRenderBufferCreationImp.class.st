Class {
	#name : #GLRenderBufferCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:45'
}
GLRenderBufferCreationImp >> createRenderBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createRenderBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:45'
}
GLRenderBufferCreationImp >> createRenderBufferIDs: count into: anIntegerArray [

	GL createRenderbuffers: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:45'
}
GLRenderBufferCreationImp >> generateRenderBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateRenderBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:44'
}
GLRenderBufferCreationImp >> generateRenderBufferIDs: count into: anIntegerArray [

	GL genRenderbuffers: count with: anIntegerArray
]
