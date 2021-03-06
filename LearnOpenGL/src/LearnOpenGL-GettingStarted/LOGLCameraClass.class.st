"
1.7.4
"
Class {
	#name : #LOGLCameraClass,
	#superclass : #LOGLCameraCircle,
	#instVars : [
		'lastCursorPosition',
		'camera'
	],
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #'input handling',
	#'squeak_changestamp' : 'stlu 6/30/2021 09:22'
}
LOGLCameraClass >> mousePositionChangedTo: newPosition [

	"avoid camera jerking when first moving the mouse over the window"
	lastCursorPosition ifNil: [
		lastCursorPosition := newPosition].
	
	camera processMouseMove: newPosition - lastCursorPosition.
	
	lastCursorPosition := newPosition
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'stlu 2/12/2021 00:47'
}
LOGLCameraClass >> processInput: deltaTime [

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
	#category : #'input handling',
	#'squeak_changestamp' : 'stlu 2/1/2021 14:53'
}
LOGLCameraClass >> scrolledBy: aPoint [

	camera processMouseScroll: aPoint y
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 2/1/2021 15:05'
}
LOGLCameraClass >> setUp [

	camera := LOGLCamera position: 0.0 @ 0.0 @ 3.0.
	super setUp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/1/2021 15:02'
}
LOGLCameraClass >> viewMatrix [

	^ camera viewMatrix
]
