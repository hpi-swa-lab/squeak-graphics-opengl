Class {
	#name : #LOGLTemplate,
	#superclass : #Object,
	#instVars : [
		'library',
		'renderProcess',
		'window',
		'timeOfLastFrame',
		'gpuTimeQuery',
		'frameTimes',
		'renderTimes',
		'gpuTimes',
		'timeOfLastWindowTitle'
	],
	#pools : [
		'GLConstants',
		'GLFWConstants'
	],
	#category : #'LearnOpenGL-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 10/12/2020 14:02'
}
LOGLTemplate class >> run [

	^ self new
		run;
		yourself
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:12'
}
LOGLTemplate >> baseWindowTitle [

	^ self class name asString
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 2/1/2021 14:44'
}
LOGLTemplate >> cursorPositionChanged: aPoint [

	"do nothing by default"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:29'
}
LOGLTemplate >> gpuTimeQuery [

	^ gpuTimeQuery ifNil: [
		gpuTimeQuery := GLTimeElapsed create]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/7/2021 17:50'
}
LOGLTemplate >> initialWindowExtent [

	^ 800 @ 600
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/17/2021 13:11'
}
LOGLTemplate >> initialize [

	"remember last 120 frames"
	frameTimes := LOGLFrameHistory new: 120.
	renderTimes := LOGLFrameHistory new: 120.
	gpuTimes := LOGLFrameHistory new: 120.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 1/8/2021 11:48'
}
LOGLTemplate >> isModal [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/18/2021 22:09'
}
LOGLTemplate >> library [

	^ library
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:17'
}
LOGLTemplate >> logFrameTime: microseconds [

	frameTimes add: microseconds asFloat
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:41'
}
LOGLTemplate >> logGPUTime: nanoseconds [

	gpuTimes add: nanoseconds asFloat
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:17'
}
LOGLTemplate >> logRenderTime: microseconds [

	renderTimes add: microseconds asFloat
]

{
	#category : #input,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:46'
}
LOGLTemplate >> processInput [

	(window getKey: GLFW_KEY_ESCAPE) = GLFW_PRESS ifTrue: [
		window shouldClose: true]
]

{
	#category : #input,
	#'squeak_changestamp' : 'stlu 1/5/2021 08:24'
}
LOGLTemplate >> processInput: deltaSecs [

	self processInput
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 1/7/2021 12:24'
}
LOGLTemplate >> processPriority [

	^ Processor userBackgroundPriority
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 2/12/2021 23:56'
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
	#'squeak_changestamp' : 'stlu 10/26/2020 17:44'
}
LOGLTemplate >> render [

	
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 1/5/2021 08:23'
}
LOGLTemplate >> render: deltaSecs [

	self render
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 6/17/2021 13:14'
}
LOGLTemplate >> renderLoop [

	[self shouldClose] whileFalse: [
		| time currentFrameTime delta |
		time := Time utcMicrosecondClock.
		currentFrameTime := Time utcMicrosecondClock / 1e6.
		delta := currentFrameTime - timeOfLastFrame.
		library makeCurrentDuring: [
			| frameStartTime |
			self processInput: delta.
			self gpuTimeQuery during: [
				frameStartTime := Time utcMicrosecondClock.
				self render: delta.
				self logRenderTime: Time utcMicrosecondClock - frameStartTime].
			window swapBuffers.
			self logGPUTime: gpuTimeQuery result. "returns only when GPU is done"
			self logFrameTime: Time utcMicrosecondClock - frameStartTime.
			GLFW pollEvents].
		self shouldUpdateWindowTitle ifTrue: [self updateWindowTitle].
		timeOfLastFrame := currentFrameTime.
		self isModal ifFalse: [Processor yield]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/17/2021 13:13'
}
LOGLTemplate >> run [

	"GLFW init."
	GLFW targetVersion: (GL33 profile: #core).
	GLFW windowHint: GLFW_FLOATING with: true.
	GLFW windowHint: GLFW_OPENGL_DEBUG_CONTEXT with: true.

	window := GLFWWindow
				extent: self initialWindowExtent
				title: self windowTitle.
	
	window ifNil: [^ self error: 'Failed to create GLFW window'].
	timeOfLastFrame := Time utcMicrosecondClock / 1e6.
	timeOfLastWindowTitle := Time utcMicrosecondClock.
	
	library := window context library withErrorChecking withVersionChecking.
	library makeCurrentDuring: [
		GLFW swapInterval: (self vSync ifTrue: [1] ifFalse: [0]).
		self registerCallbacks.
		self setUp.].
	
	self spawnNewRenderProcess
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 2/1/2021 14:51'
}
LOGLTemplate >> scrolledBy: offset [

	"do nothing by default"
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 10/22/2020 16:43'
}
LOGLTemplate >> setUp [

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/12/2020 14:06'
}
LOGLTemplate >> shouldClose [

	^ window shouldClose
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:18'
}
LOGLTemplate >> shouldUpdateWindowTitle [

	^ (Time utcMicrosecondClock - timeOfLastWindowTitle) > self windowTitleUpdateInterval
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:33'
}
LOGLTemplate >> showFrameTimeInWindowTitle [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:33'
}
LOGLTemplate >> showGPUTimeInWindowTitle [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:33'
}
LOGLTemplate >> showRenderTimeInWindowTitle [

	^ true
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 4/16/2021 10:42'
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
	#'squeak_changestamp' : 'stlu 10/22/2020 16:45'
}
LOGLTemplate >> tearDown [

	
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:19'
}
LOGLTemplate >> updateWindowTitle [

	window title: self windowTitle.
	timeOfLastWindowTitle := Time utcMicrosecondClock.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 6/17/2021 12:46'
}
LOGLTemplate >> vSync [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/9/2020 13:27'
}
LOGLTemplate >> window [

	^ window
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 6/17/2021 14:46'
}
LOGLTemplate >> windowExtentChanged: newExtent [
	"glfw: whenever the window size changed (by OS or user resize) this callback function executes"
	GL viewport: (0@0 extent: newExtent)
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:12'
}
LOGLTemplate >> windowTitle [

	^ String streamContents: [:stream |
		stream nextPutAll: self baseWindowTitle.
		(self showFrameTimeInWindowTitle and: [frameTimes notEmpty]) ifTrue: [
			stream
				nextPutAll: ' | FT: ';
				nextPutAll: (frameTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
				nextPutAll: 'ms'].
		(self showRenderTimeInWindowTitle and: [renderTimes notEmpty]) ifTrue: [
			stream
				nextPutAll: ' | RT: ';
				nextPutAll: (frameTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
				nextPutAll: 'ms'].
		(self showGPUTimeInWindowTitle and: [gpuTimes notEmpty]) ifTrue: [
			stream
				nextPutAll: ' | GPU: ';
				nextPutAll: (gpuTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
				nextPutAll: 'us']]
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:19'
}
LOGLTemplate >> windowTitleUpdateInterval [
	"Time in microseconds that needs to pass minimum, until the window title is changed."
	^ 100000 "10 per second"
]
