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
	#category : #'OpenGLObjects-Framebuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:11'
}
GLFramebufferManager >> bindDrawFramebuffer: framebufferOrNil [

	drawFramebuffer == framebufferOrNil ifTrue: [^ self].
	
	mainImp bindFramebuffer: framebufferOrNil to: GL_DRAW_FRAMEBUFFER.
	
	drawFramebuffer := framebufferOrNil.
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
	#'squeak_changestamp' : 'stlu 7/29/2021 23:10'
}
GLFramebufferManager >> bindFramebuffer: framebufferOrNil [

	(readFramebuffer == framebufferOrNil
		and: [drawFramebuffer == framebufferOrNil]) ifTrue: [^ self].

	mainImp bindFramebuffer: framebufferOrNil to: GL_FRAMEBUFFER.
	
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
	#'squeak_changestamp' : 'stlu 7/29/2021 23:11'
}
GLFramebufferManager >> bindReadFramebuffer: framebufferOrNil [

	readFramebuffer == framebufferOrNil ifTrue: [^ self].

	mainImp bindFramebuffer: framebufferOrNil to: GL_READ_FRAMEBUFFER.
	
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
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFramebufferManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
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
	#'squeak_changestamp' : 'stlu 6/20/2022 11:49'
}
GLFramebufferManager >> initializeForContext: aContext [

	super initializeForContext: aContext.
	defaultFramebuffer := GLDefaultFramebuffer manager: self id: 0.
	readFramebuffer := drawFramebuffer := defaultFramebuffer.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 11:49'
}
GLFramebufferManager >> initializeImplementorsForVersion: aVersion [

	mainImp := GLFramebufferImp new.
	creationImp := GLDirectStateAccessImp new.
	stateAccessImp := GLDirectStateAccessImp new.
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
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:17'
}
GLFramebufferManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
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
