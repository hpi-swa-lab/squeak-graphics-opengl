Class {
	#name : #GLBufferInvalidationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Buffers',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:12'
}
GLBufferInvalidationImp >> invalidateData: aBuffer [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:15'
}
GLBufferInvalidationImp >> invalidateSubData: aBuffer offset: byteOffset length: byteLength [

	self subclassResponsibility
]
