Class {
	#name : #GLBufferStateAccessImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Buffers',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:29'
}
GLBufferStateAccessImp >> clearBuffer: aBuffer data: aRawBitsArray providedFormat: providedFormatEnum internalFormat: internalFormatEnum type: typeEnum [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:28'
}
GLBufferStateAccessImp >> initBuffer: aBuffer data: aRawBitsArray size: byteSize usage: usageEnum [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:28'
}
GLBufferStateAccessImp >> initBuffer: aBuffer immutableData: aRawBitsArray size: byteSize usage: usageFlags [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:28'
}
GLBufferStateAccessImp >> updateBuffer: aBuffer data: aRawBitsArray size: byteSize offset: byteOffset [

	self subclassResponsibility
]
