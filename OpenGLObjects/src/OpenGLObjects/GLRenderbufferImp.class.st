Class {
	#name : #GLRenderbufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:36'
}
GLRenderbufferImp >> bindRenderbuffer: renderbufferOrNil [

	GL
		bindRenderbuffer: GL_RENDERBUFFER
		with: (renderbufferOrNil ifNil: [0] ifNotNil: [renderbufferOrNil id]).
]

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
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:48'
}
GLRenderbufferImp >> deleteRenderbuffer: aRenderbuffer [

	GL
		deleteRenderbuffers: 1
		with: (WordArray with: aRenderbuffer id).
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
