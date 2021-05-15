Class {
	#name : #GLBufferCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-ObjectManagers'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:26'
}
GLBufferCreationImp >> createBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:25'
}
GLBufferCreationImp >> createBufferIDs: count into: anIntegerArray [

	GL createBuffers: count with: anIntegerArray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:04'
}
GLBufferCreationImp >> generateBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateBufferIDs: count into: ids.
	^ ids
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/25/2021 23:14'
}
GLBufferCreationImp >> generateBufferIDs: count into: anIntegerArray [

	GL genBuffers: count with: anIntegerArray
]
