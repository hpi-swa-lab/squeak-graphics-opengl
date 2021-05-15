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
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:29'
}
GLDisplayFrameBuffer class >> initializeBindings [

	| display |
	display := self instance.
	GLObjectBindings current drawFrameBuffer: display.
	GLObjectBindings current readFrameBuffer: display.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:27'
}
GLDisplayFrameBuffer class >> instance [

	^ GL userData
		at: self
		ifAbsentPut: [self newInstance]
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:27'
}
GLDisplayFrameBuffer class >> newInstance [

	^ self
		manager: self manager
		id: 0
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
