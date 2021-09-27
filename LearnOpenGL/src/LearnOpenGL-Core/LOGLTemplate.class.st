Class {
	#name : #LOGLTemplate,
	#superclass : #Object,
	#instVars : [
		'library',
		'renderProcess',
		'window',
		'timeOfLastFrame',
		'gpuTimeQueries',
		'frameTimes',
		'renderTimes',
		'gpuTimes',
		'timeOfLastWindowTitle',
		'numFrames',
		'isModal'
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
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:10'
}
LOGLTemplate >> beModal [

	isModal := true.
	renderProcess ifNotNil: [:process |
		process priority: self modalProcessPriority].
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:10'
}
LOGLTemplate >> beNonModal [

	isModal := false.
	renderProcess ifNotNil: [:process |
		process priority: self nonModalProcessPriority].
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 8/6/2021 15:12'
}
LOGLTemplate >> framebufferExtentChanged: newExtent [
	"whenever the window's framebuffer extent changes (by OS or user resize) this callback function executes"
	GL viewport: (0@0 extent: newExtent).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/1/2021 17:17'
}
LOGLTemplate >> gpuTimeQuery [

	^ gpuTimeQueries last
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
	#'squeak_changestamp' : 'stlu 9/6/2021 13:49'
}
LOGLTemplate >> initialize [

	"remember last 120 frames"
	frameTimes := LOGLFrameHistory new: 120.
	renderTimes := LOGLFrameHistory new: 120.
	gpuTimes := LOGLFrameHistory new: 120.
	
	gpuTimeQueries := OrderedCollection new.
	
	isModal := self isModalByDefault.
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 13:48'
}
LOGLTemplate >> isModal [

	^ isModal
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:07'
}
LOGLTemplate >> isModalByDefault [

	^ false
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 9/27/2021 14:46'
}
LOGLTemplate >> key: key scanCode: scanCode changedTo: state with: mods [

	(key = GLFW_KEY_ESCAPE and: [state = GLFW_RELEASE]) ifTrue: [
		window shouldClose: true].
	
	(GLFW numberOfFunctionKey: key) ifNotNil: [:fNumber |
		state = GLFW_RELEASE ifTrue: [
			fNumber = 1 ifTrue: [self toggleModal]]].
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 7/2/2021 23:52'
}
LOGLTemplate >> keyStroke: codePoint [

	"do nothing by default"
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
	#'squeak_changestamp' : 'stlu 9/1/2021 17:31'
}
LOGLTemplate >> logGPUTimes [

	gpuTimeQueries copy do: [:query |
		query isResultAvailable ifFalse: [^ self].
		self logGPUTime: query result.
		query delete.
		gpuTimeQueries removeFirst].
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:17'
}
LOGLTemplate >> logRenderTime: microseconds [

	renderTimes add: microseconds asFloat
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:11'
}
LOGLTemplate >> modalProcessPriority [

	^ Processor userInterruptPriority
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 6/30/2021 09:26'
}
LOGLTemplate >> mouseButton: button changedTo: state with: modifierKeys [

	"do nothing by default"
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 6/30/2021 09:22'
}
LOGLTemplate >> mousePositionChangedTo: aPoint [

	"do nothing by default"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/1/2021 17:17'
}
LOGLTemplate >> newGPUTimeQuery [

	^ gpuTimeQueries addLast: GLTimeElapsedQuery create
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:11'
}
LOGLTemplate >> nonModalProcessPriority [

	^ Processor userBackgroundPriority
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 13:22'
}
LOGLTemplate >> numFrames [

	^ numFrames
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 8/27/2021 14:28'
}
LOGLTemplate >> printWindowTitleOn: aStream [

	aStream nextPutAll: self baseWindowTitle.
	(self showFrameTimeInWindowTitle and: [frameTimes notEmpty]) ifTrue: [
		aStream
			nextPutAll: ' | FT: ';
			nextPutAll: (frameTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
			nextPutAll: 'ms'].
	(self showFrameTimeInWindowTitle and: [frameTimes notEmpty]) ifTrue: [
		aStream
			nextPutAll: ' | Jank: ';
			nextPutAll: (frameTimes max / 1e3 printShowingMaxDecimalPlaces: 3);
			nextPutAll: 'ms'].
	(self showRenderTimeInWindowTitle and: [renderTimes notEmpty]) ifTrue: [
		aStream
			nextPutAll: ' | RT: ';
			nextPutAll: (renderTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
			nextPutAll: 'ms'].
	(self showGPUTimeInWindowTitle and: [gpuTimes notEmpty]) ifTrue: [
		aStream
			nextPutAll: ' | GPU: ';
			nextPutAll: (gpuTimes average / 1e3 printShowingMaxDecimalPlaces: 3);
			nextPutAll: 'us']
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
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:12'
}
LOGLTemplate >> processPriority [

	^ self isModal
		ifTrue: [self modalProcessPriority]
		ifFalse: [self nonModalProcessPriority]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 8/6/2021 15:12'
}
LOGLTemplate >> registerCallbacks [

	window framebufferExtentCallback: [:w :width :height |
		self framebufferExtentChanged: width @ height].
	
	window scrollCallback: [:w :xOffset :yOffset |
		self scrolledBy: xOffset @ yOffset].
	
	window mouseButtonCallback: [:win :button :state :mods |
		self mouseButton: button changedTo: state with: mods].
	
	window cursorPosCallback: [:w :x :y |
		self mousePositionChangedTo: x @ y].
	
	window keyCallback: [:w :key :scancode :state :mods |
		self key: key scanCode: scancode changedTo: state with: mods].
	
	window charCallback: [:w :codepoint |
		self keyStroke: codepoint].
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
	#'squeak_changestamp' : 'stlu 9/1/2021 17:18'
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
			self newGPUTimeQuery during: [
				frameStartTime := Time utcMicrosecondClock.
				self render: delta.
				self logRenderTime: Time utcMicrosecondClock - frameStartTime].
			window swapBuffers.
			self logFrameTime: Time utcMicrosecondClock - frameStartTime.
			self logGPUTimes.
			GLFW pollEvents].
		self shouldUpdateWindowTitle ifTrue: [self updateWindowTitle].
		timeOfLastFrame := currentFrameTime.
		numFrames := numFrames + 1.
		self isModal ifFalse: [Processor yield]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/6/2021 13:52'
}
LOGLTemplate >> run [

	"GLFW init."
	GLFW targetVersion: (GL33 profile: #core).
	GLFW windowHint: GLFW_FLOATING with: true.
	GLFW windowHint: GLFW_OPENGL_DEBUG_CONTEXT with: false.

	window := GLFWWindow
				extent: self initialWindowExtent
				title: self windowTitle.
	
	window ifNil: [^ self error: 'Failed to create GLFW window'].
	timeOfLastFrame := Time utcMicrosecondClock / 1e6.
	timeOfLastWindowTitle := Time utcMicrosecondClock.
	numFrames := 0.
	
	library := window context library withErrorChecking withVersionChecking.
	library makeCurrentDuring: [
		GLFW swapInterval: (self vSync ifTrue: [1] ifFalse: [0]).
		self registerCallbacks.
		self setUp].
	
	self spawnNewRenderProcess.
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
	#'squeak_changestamp' : 'stlu 8/27/2021 10:46'
}
LOGLTemplate >> showJankInWindowTitle [

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
	#'squeak_changestamp' : 'stlu 9/6/2021 13:54'
}
LOGLTemplate >> spawnNewRenderProcess [

	renderProcess := [
		[self renderLoop]
			ensure: [
				self tearDown.
				library context destroy]
	] newProcess priority: self processPriority.
	renderProcess resume.
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 10/22/2020 16:45'
}
LOGLTemplate >> tearDown [

	
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:11'
}
LOGLTemplate >> toggleModal [

	self isModal
		ifTrue: [self beNonModal]
		ifFalse: [self beModal].
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
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 8/11/2021 17:12'
}
LOGLTemplate >> windowTitle [

	^ String streamContents: [:stream |
		self printWindowTitleOn: stream]
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:19'
}
LOGLTemplate >> windowTitleUpdateInterval [
	"Time in microseconds that needs to pass minimum, until the window title is changed."
	^ 100000 "10 per second"
]
