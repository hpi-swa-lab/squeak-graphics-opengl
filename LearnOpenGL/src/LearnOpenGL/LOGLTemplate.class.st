Class {
	#name : #LOGLTemplate,
	#superclass : #Object,
	#instVars : [
		'library',
		'renderProcess',
		'window',
		'lastFrameTime'
	],
	#pools : [
		'GLConstants',
		'GLFWConstants'
	],
	#category : #'LearnOpenGL-Core',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 10/12/2020 14:02'
}
LOGLTemplate class >> run [

	^ self new
		run;
		yourself
]

{
	#category : #callbacks,
	#timestamp : 'stlu 2/1/2021 14:44'
}
LOGLTemplate >> cursorPositionChanged: aPoint [

	"do nothing by default"
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 17:50'
}
LOGLTemplate >> initialWindowExtent [

	^ 800 @ 600
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/5/2021 08:21'
}
LOGLTemplate >> initialize [

	lastFrameTime := 0.0
]

{
	#category : #testing,
	#timestamp : 'stlu 1/8/2021 11:48'
}
LOGLTemplate >> isModal [

	^ false
]

{
	#category : #rendering,
	#timestamp : 'stlu 2/12/2021 00:46'
}
LOGLTemplate >> processInput [

	(window getKey: GLFW_KEY_ESCAPE) = GLFW_PRESS ifTrue: [
		window shouldClose: true]
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/5/2021 08:24'
}
LOGLTemplate >> processInput: deltaSecs [

	self processInput
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/7/2021 12:24'
}
LOGLTemplate >> processPriority [

	^ Processor userBackgroundPriority
]

{
	#category : #callbacks,
	#timestamp : 'stlu 2/12/2021 23:56'
}
LOGLTemplate >> registerCallbacks [

	window framebufferExtentCallback: [:w :width :height |
		self windowExtentChanged: width @ height].
	
	window cursorPosCallback: [:w :x :y |
		self cursorPositionChanged: x @ y].
	
	window scrollCallback: [:w :xOffset :yOffset |
		self scrolledBy: xOffset @ yOffset]
]

{
	#category : #rendering,
	#timestamp : 'stlu 10/26/2020 17:44'
}
LOGLTemplate >> render [

	
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/5/2021 08:23'
}
LOGLTemplate >> render: deltaSecs [

	self render
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/8/2021 11:48'
}
LOGLTemplate >> renderLoop [

	[self shouldClose] whileFalse: [
		| currentFrameTime delta |
		currentFrameTime := Time utcMicrosecondClock / 1e6.
		delta := currentFrameTime - lastFrameTime.
		library makeCurrentDuring: [
			self processInput: delta.
			self render: delta.
			window swapBuffers.
			GLFW pollEvents].
		lastFrameTime := currentFrameTime.
		self isModal ifFalse: [Processor yield]]
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/17/2021 10:56'
}
LOGLTemplate >> run [

	"GLFW init."
	GLFW targetVersion: (GL33 profile: #core).
	GLFW windowHint: GLFW_FLOATING with: true.

	window := GLFWWindow
				extent: self initialWindowExtent
				title: self title.
	
	window ifNil: [^ self error: 'Failed to create GLFW window'].
	
	library := window context library withErrorChecking withVersionChecking.
	
	library makeCurrentDuring: [
		self registerCallbacks.
		self setUp.].
	
	self spawnNewRenderProcess
]

{
	#category : #callbacks,
	#timestamp : 'stlu 2/1/2021 14:51'
}
LOGLTemplate >> scrolledBy: offset [

	"do nothing by default"
]

{
	#category : #running,
	#timestamp : 'stlu 10/22/2020 16:43'
}
LOGLTemplate >> setUp [

	
]

{
	#category : #testing,
	#timestamp : 'stlu 10/12/2020 14:06'
}
LOGLTemplate >> shouldClose [

	^ window shouldClose
]

{
	#category : #rendering,
	#timestamp : 'stlu 4/16/2021 10:42'
}
LOGLTemplate >> spawnNewRenderProcess [

	renderProcess := [
		[self renderLoop]
			ensure: [
				self tearDown.
				library context destroy]
	] newProcess priority: self processPriority.
	renderProcess resume
]

{
	#category : #running,
	#timestamp : 'stlu 10/22/2020 16:45'
}
LOGLTemplate >> tearDown [

	
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/19/2020 17:18'
}
LOGLTemplate >> title [

	^ self class name asString
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/9/2020 13:27'
}
LOGLTemplate >> window [

	^ window
]

{
	#category : #callbacks,
	#timestamp : 'stlu 4/15/2021 12:11'
}
LOGLTemplate >> windowExtentChanged: newExtent [
	"glfw: whenever the window size changed (by OS or user resize) this callback function executes"
	window context library makeCurrentDuring: [
		GL viewport: (0@0 extent: newExtent)]
]
