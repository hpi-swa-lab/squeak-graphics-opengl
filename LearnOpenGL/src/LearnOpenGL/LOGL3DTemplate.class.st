Class {
	#name : #LOGL3DTemplate,
	#superclass : #LOGLTemplate,
	#instVars : [
		'lastCursorPosition',
		'camera'
	],
	#category : #'LearnOpenGL-Core',
	#commentStamp : ''
}

{
	#category : #'input handling',
	#timestamp : 'stlu 3/13/2021 00:50'
}
LOGL3DTemplate >> cursorPositionChanged: newPosition [

	"avoid camera jerking when first moving the mouse over the window"
	lastCursorPosition ifNil: [
		lastCursorPosition := newPosition].
	
	camera processMouseMove: newPosition - lastCursorPosition.
	
	lastCursorPosition := newPosition
]

{
	#category : #running,
	#timestamp : 'stlu 3/13/2021 00:53'
}
LOGL3DTemplate >> initialCamera [

	^ LOGLCamera position: 0.0 @ 0.0 @ 3.0
]

{
	#category : #'input handling',
	#timestamp : 'stlu 3/13/2021 00:50'
}
LOGL3DTemplate >> processInput: deltaTime [

	(window getKey: GLFW_KEY_ESCAPE) = GLFW_PRESS ifTrue: [
		window shouldClose: true].
	
	(window getKey: GLFW_KEY_W) == GLFW_PRESS ifTrue: [
		camera moveForward: deltaTime].
	(window getKey: GLFW_KEY_S) == GLFW_PRESS ifTrue: [
		camera moveBackward: deltaTime].
	(window getKey: GLFW_KEY_A) == GLFW_PRESS ifTrue: [
		camera moveLeft: deltaTime].
	(window getKey: GLFW_KEY_D) == GLFW_PRESS ifTrue: [
		camera moveRight: deltaTime].
	
	(window getKey: GLFW_KEY_C) == GLFW_PRESS ifTrue: [
		window isCursorNormal
			ifTrue: [window disableCursor]
			ifFalse: [window restoreCursor]].
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/13/2021 01:57'
}
LOGL3DTemplate >> projectionMatrix [

	| extent |
	extent := window framebufferExtent.
	^ (Matrix4x4
		perspective: 45.0 degreesToRadians
		aspectRatio: extent x / extent y
		near: 0.1 far: 100.0)
]

{
	#category : #'input handling',
	#timestamp : 'stlu 3/13/2021 00:52'
}
LOGL3DTemplate >> scrolledBy: aPoint [

	camera processMouseScroll: aPoint y
]

{
	#category : #running,
	#timestamp : 'stlu 3/13/2021 00:53'
}
LOGL3DTemplate >> setUp [

	camera := self initialCamera
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/13/2021 00:50'
}
LOGL3DTemplate >> viewMatrix [

	^ camera viewMatrix
]
