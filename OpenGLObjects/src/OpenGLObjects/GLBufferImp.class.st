Class {
	#name : #GLBufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:02'
}
GLBufferImp >> bindBuffer: bufferOrNil to: targetEnum [

	GL
		bindBuffer: targetEnum
		with: (bufferOrNil ifNil: [0] ifNotNil: [bufferOrNil id]).
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:08'
}
GLBufferImp >> clearBuffer: aBuffer data: aRawBitsArray providedFormat: providedFormatEnum internalFormat: internalFormatEnum type: typeEnum [

	self notYetImplemented.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:23'
}
GLBufferImp >> createBufferIDs: count [

	self flag: #todo. "should be generate + bind"
	^ self generateBufferIDs: count
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:49'
}
GLBufferImp >> deleteBuffer: aBuffer [

	GL
		deleteBuffers: 1
		with: (WordArray with: aBuffer id).
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:04'
}
GLBufferImp >> generateBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateBufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 7/29/2021 22:41'
}
GLBufferImp >> generateBufferIDs: count into: anIntegerArray [

	GL genBuffers: count with: anIntegerArray.
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:08'
}
GLBufferImp >> initBuffer: aBuffer data: aRawBitsArray size: byteSize usage: usageEnum [

	self notYetImplemented.
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:07'
}
GLBufferImp >> initBuffer: aBuffer immutableData: aRawBitsArray size: byteSize usage: usageFlags [

	self notYetImplemented.
]

{
	#category : #invalidation,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:08'
}
GLBufferImp >> invalidateData: aBuffer [

	self notYetImplemented.
]

{
	#category : #invalidation,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:08'
}
GLBufferImp >> invalidateSubData: aBuffer offset: byteOffset length: byteLength [

	self notYetImplemented.
]

{
	#category : #mapping,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:07'
}
GLBufferImp >> mapBuffer: aBuffer access: accessEnum [

	self notYetImplemented.
]

{
	#category : #mapping,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:07'
}
GLBufferImp >> mapBuffer: aBuffer offset: byteOffset length: byteLength access: accessFlags [

	self notYetImplemented.
]

{
	#category : #mapping,
	#'squeak_changestamp' : 'stlu 7/29/2021 20:07'
}
GLBufferImp >> unmapBuffer: aBuffer [

	self notYetImplemented.
]

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:07'
}
GLBufferImp >> updateBuffer: aBuffer data: aRawBitsArray size: byteSize offset: byteOffset [

	self notYetImplemented.
]
