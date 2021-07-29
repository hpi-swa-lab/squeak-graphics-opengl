Class {
	#name : #GLBufferImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'state access',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:08'
}
GLBufferImp >> clearBuffer: aBuffer data: aRawBitsArray providedFormat: providedFormatEnum internalFormat: internalFormatEnum type: typeEnum [

	self notYetImplemented.
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:26'
}
GLBufferImp >> createBufferIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self createBufferIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:25'
}
GLBufferImp >> createBufferIDs: count into: anIntegerArray [

	GL createBuffers: count with: anIntegerArray
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
	#'squeak_changestamp' : 'stlu 4/25/2021 23:14'
}
GLBufferImp >> generateBufferIDs: count into: anIntegerArray [

	GL genBuffers: count with: anIntegerArray
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
