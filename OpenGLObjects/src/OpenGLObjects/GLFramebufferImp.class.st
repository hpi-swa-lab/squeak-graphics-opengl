Class {
	#name : #GLFramebufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:08'
}
GLFramebufferImp >> bindFramebuffer: framebufferOrNil to: targetEnum [

	GL
		bindFramebuffer: targetEnum
		with: (framebufferOrNil ifNil: [0] ifNotNil: [framebufferOrNil id]).
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:22'
}
GLFramebufferImp >> createFramebufferIDs: count [

	self flag: #todo. "should be generate + bind"
	^ self generateFramebufferIDs: count
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:49'
}
GLFramebufferImp >> deleteFramebuffer: aFramebuffer [

	GL
		deleteFramebuffers: 1
		with: (WordArray with: aFramebuffer id).
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
