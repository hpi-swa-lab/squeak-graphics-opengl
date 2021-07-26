Class {
	#name : #GLFramebufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'readFramebuffer',
		'drawFramebuffer',
		'defaultFramebuffer',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:22'
}
GLFramebufferManager >> bindDrawFramebuffer: framebufferOrNil [

	drawFramebuffer == framebufferOrNil ifTrue: [^ self].
	
	GL
		bindFramebuffer: GL_DRAW_FRAMEBUFFER
		with: (framebufferOrNil ifNil: [0] ifNotNil: [framebufferOrNil id]).
	drawFramebuffer := framebufferOrNil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:22'
}
GLFramebufferManager >> bindDrawFramebuffer: framebufferOrNil during: aBlock [

	| previous |
	previous := drawFramebuffer.
	self bindDrawFramebuffer: framebufferOrNil.
	^ aBlock ensure: [
		self bindDrawFramebuffer: previous]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:24'
}
GLFramebufferManager >> bindFramebuffer: framebufferOrNil [

	(readFramebuffer == framebufferOrNil
		and: [drawFramebuffer == framebufferOrNil]) ifTrue: [^ self].

	GL
		bindFramebuffer: GL_FRAMEBUFFER
		with: (framebufferOrNil ifNil: [0] ifNotNil: [framebufferOrNil id]).
	drawFramebuffer := framebufferOrNil.
	readFramebuffer := framebufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:28'
}
GLFramebufferManager >> bindFramebuffer: framebufferOrNil during: aBlock [

	| previousRead previousDraw |
	previousRead := readFramebuffer.
	previousDraw := drawFramebuffer.
	self bindFramebuffer: framebufferOrNil.
	^ aBlock ensure: [
		previousRead == previousDraw
			ifTrue: [
				self bindFramebuffer: previousRead]
			ifFalse: [
				self bindDrawFramebuffer: previousDraw.
				self bindReadFramebuffer: previousRead]]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:23'
}
GLFramebufferManager >> bindReadFramebuffer: framebufferOrNil [

	readFramebuffer == framebufferOrNil ifTrue: [^ self].

	GL
		bindFramebuffer: GL_READ_FRAMEBUFFER
		with: (framebufferOrNil ifNil: [0] ifNotNil: [framebufferOrNil id]).
	readFramebuffer := framebufferOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:24'
}
GLFramebufferManager >> bindReadFramebuffer: framebufferOrNil during: aBlock [

	| previous |
	previous := readFramebuffer.
	self bindReadFramebuffer: framebufferOrNil.
	^ aBlock ensure: [
		self bindReadFramebuffer: previous]
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFramebufferManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFramebufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> defaultFramebuffer [

	^ defaultFramebuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> defaultFramebuffer: anObject [

	defaultFramebuffer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> drawFramebuffer [

	^ drawFramebuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> drawFramebuffer: anObject [

	drawFramebuffer := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> initialize [

	super initialize.
	defaultFramebuffer := GLDefaultFramebuffer manager: self id: 0.
	readFramebuffer := drawFramebuffer := defaultFramebuffer.
	
	creationImp := GLFramebufferCreationImp new.
	stateAccessImp := GLFramebufferDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:51'
}
GLFramebufferManager >> isValidID: anInteger [

	^ GL isFramebuffer: anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> readFramebuffer [

	^ readFramebuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:21'
}
GLFramebufferManager >> readFramebuffer: anObject [

	readFramebuffer := anObject
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFramebufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFramebufferManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:25'
}
GLFramebufferManager >> unbindDrawFramebuffer [

	self bindDrawFramebuffer: defaultFramebuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:25'
}
GLFramebufferManager >> unbindFramebuffer [

	self bindFramebuffer: defaultFramebuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:25'
}
GLFramebufferManager >> unbindReadFramebuffer [

	self bindReadFramebuffer: defaultFramebuffer
]
