Class {
	#name : #GLDisplayFrameBuffer,
	#superclass : #GLFrameBuffer,
	#category : #'OpenGLObjects-FrameBuffers',
	#commentStamp : ''
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:50'
}
GLDisplayFrameBuffer class >> allocate [

	^ 0
]

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:51'
}
GLDisplayFrameBuffer class >> allocate: n in: anIntegerArray [

	anIntegerArray atAllPut: 0
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/3/2020 19:28'
}
GLDisplayFrameBuffer class >> create [

	^ GL userData at: self ifAbsentPut: [super create]
]

{
	#category : #binding,
	#timestamp : 'stlu 4/15/2021 11:37'
}
GLDisplayFrameBuffer class >> initializeBindings [

	| display |
	display := self create.
	GLObjectBindings current drawFrameBuffer: display.
	GLObjectBindings current readFrameBuffer: display.
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:15'
}
GLDisplayFrameBuffer >> isAllocated [

	^ false
]
