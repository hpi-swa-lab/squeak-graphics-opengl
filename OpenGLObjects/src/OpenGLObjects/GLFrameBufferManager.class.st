Class {
	#name : #GLFrameBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'readFrameBuffer',
		'drawFrameBuffer',
		'defaultFrameBuffer',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:41'
}
GLFrameBufferManager >> bindDrawFrameBuffer: frameBufferOrNil [

	drawFrameBuffer == frameBufferOrNil ifTrue: [^ self].
	
	GL
		bindFramebuffer: GL_DRAW_FRAMEBUFFER
		with: (frameBufferOrNil ifNil: [0] ifNotNil: [frameBufferOrNil id]).
	drawFrameBuffer := frameBufferOrNil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:42'
}
GLFrameBufferManager >> bindDrawFrameBuffer: frameBufferOrNil during: aBlock [

	| previous |
	previous := drawFrameBuffer.
	self bindDrawFrameBuffer: frameBufferOrNil.
	^ aBlock ensure: [
		self bindDrawFrameBuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:43'
}
GLFrameBufferManager >> bindFrameBuffer: frameBufferOrNil [

	(readFrameBuffer == frameBufferOrNil
		and: [drawFrameBuffer == frameBufferOrNil]) ifTrue: [^ self].

	GL
		bindFramebuffer: GL_FRAMEBUFFER
		with: (frameBufferOrNil ifNil: [0] ifNotNil: [frameBufferOrNil id]).
	drawFrameBuffer := frameBufferOrNil.
	readFrameBuffer := frameBufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:46'
}
GLFrameBufferManager >> bindFrameBuffer: frameBufferOrNil during: aBlock [

	| previousRead previousDraw |
	previousRead := readFrameBuffer.
	previousDraw := drawFrameBuffer.
	self bindFrameBuffer: frameBufferOrNil.
	^ aBlock ensure: [
		previousRead == previousDraw
			ifTrue: [
				self bindFrameBuffer: previousRead]
			ifFalse: [
				self bindDrawFrameBuffer: previousDraw.
				self bindReadFrameBuffer: previousRead]]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:42'
}
GLFrameBufferManager >> bindReadFrameBuffer: frameBufferOrNil [

	readFrameBuffer == frameBufferOrNil ifTrue: [^ self].

	GL
		bindFramebuffer: GL_READ_FRAMEBUFFER
		with: (frameBufferOrNil ifNil: [0] ifNotNil: [frameBufferOrNil id]).
	readFrameBuffer := frameBufferOrNil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:43'
}
GLFrameBufferManager >> bindReadFrameBuffer: frameBufferOrNil during: aBlock [

	| previous |
	previous := readFrameBuffer.
	self bindReadFrameBuffer: frameBufferOrNil.
	^ aBlock ensure: [
		self bindReadFrameBuffer: previous]
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:23'
}
GLFrameBufferManager >> defaultFrameBuffer [

	^ defaultFrameBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:23'
}
GLFrameBufferManager >> defaultFrameBuffer: anObject [

	defaultFrameBuffer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:21'
}
GLFrameBufferManager >> drawFrameBuffer [

	^ drawFrameBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:21'
}
GLFrameBufferManager >> drawFrameBuffer: anObject [

	drawFrameBuffer := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:23'
}
GLFrameBufferManager >> initialize [

	super initialize.
	defaultFrameBuffer := GLDisplayFrameBuffer manager: self id: 0.
	readFrameBuffer := drawFrameBuffer := defaultFrameBuffer.
	
	creationImp := GLFrameBufferCreationImp new.
	stateAccessImp := GLFramebufferDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:51'
}
GLFrameBufferManager >> isValidID: anInteger [

	^ GL isFramebuffer: anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:21'
}
GLFrameBufferManager >> readFrameBuffer [

	^ readFrameBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:21'
}
GLFrameBufferManager >> readFrameBuffer: anObject [

	readFrameBuffer := anObject
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFrameBufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFrameBufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:05'
}
GLFrameBufferManager >> unbindDrawFrameBuffer [

	self bindDrawFrameBuffer: defaultFrameBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:07'
}
GLFrameBufferManager >> unbindFrameBuffer [

	self bindFrameBuffer: defaultFrameBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:05'
}
GLFrameBufferManager >> unbindReadFrameBuffer [

	self bindReadFrameBuffer: defaultFrameBuffer
]
