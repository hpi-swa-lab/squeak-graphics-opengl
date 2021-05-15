Class {
	#name : #GLDisplayFrameBuffer,
	#superclass : #GLFrameBuffer,
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:29'
}
GLDisplayFrameBuffer class >> create [

	self shouldNotImplement
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 15:24'
}
GLDisplayFrameBuffer class >> instance [

	^ self manager defaultFrameBuffer
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:57'
}
GLDisplayFrameBuffer >> hasValidID [

	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:28'
}
GLDisplayFrameBuffer >> register [

	"do nothing"
]
