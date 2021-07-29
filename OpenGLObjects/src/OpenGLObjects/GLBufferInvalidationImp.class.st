Class {
	#name : #GLBufferInvalidationImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 12/28/2020 12:12'
}
GLBufferInvalidationImp >> invalidateData: aBuffer [

	self subclassResponsibility
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 12/28/2020 12:15'
}
GLBufferInvalidationImp >> invalidateSubData: aBuffer offset: byteOffset length: byteLength [

	self subclassResponsibility
]
