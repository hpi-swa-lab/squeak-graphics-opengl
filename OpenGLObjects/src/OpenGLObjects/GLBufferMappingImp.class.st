Class {
	#name : #GLBufferMappingImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Buffers',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:43'
}
GLBufferMappingImp >> mapBuffer: aBuffer access: accessEnum [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:44'
}
GLBufferMappingImp >> mapBuffer: aBuffer offset: byteOffset length: byteLength access: accessFlags [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 12/28/2020 12:45'
}
GLBufferMappingImp >> unmapBuffer: aBuffer [

	self subclassResponsibility
]
