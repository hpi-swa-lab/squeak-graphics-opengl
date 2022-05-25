Class {
	#name : #LOGLTemplate,
	#superclass : #Object,
	#instVars : [
		'library',
		'renderProcess',
		'window',
		'timeOfLastFrame',
		'frameTimes',
		'renderTimes',
		'gpuTimes',
		'gcHistory',
		'timeOfLastWindowTitle',
		'numFrames',
		'isModal',
		'minimumFrameDistance',
		'interFrameDelay',
		'windowTitleUpdates',
		'pendingGPUQueries',
		'availableGPUQueries',
		'gpuSamples',
		'gpuPrimitives'
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
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/30/2022 23:23'
}
LOGLTemplate >> assureInterFrameDelay [

	^ (interFrameDelay isNil or: [interFrameDelay beingWaitedOn])
		ifTrue: [interFrameDelay := Delay forMilliseconds: 0]
		ifFalse: [interFrameDelay]
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 5/2/2022 14:58'
}
LOGLTemplate >> baseWindowTitle [

	^ self class name
]

{
	#category : #'gpu queries',
	#'squeak_changestamp' : 'stlu 5/2/2022 18:22'
}
LOGLTemplate >> beginGPUQueries [

	| queries |
	queries := availableGPUQueries notEmpty
		ifTrue: [availableGPUQueries removeLast]
		ifFalse: [{
			"1" GLTimeElapsedQuery create.
			"2" GLSamplesPassedQuery create.
			"3" GLPrimitivesGeneratedQuery create.}].
	queries do: [:query | query begin].
	pendingGPUQueries addLast: queries.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/30/2022 23:01'
}
LOGLTemplate >> defaultMinimumFrameDistance [
	"microseconds"
	^ 16000
]

{
	#category : #'gpu queries',
	#'squeak_changestamp' : 'stlu 5/2/2022 17:52'
}
LOGLTemplate >> endGPUQueries [

	| queries |
	queries := pendingGPUQueries last.
	queries do: [:query | query end].
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
	#'squeak_changestamp' : 'stlu 5/2/2022 14:32'
}
LOGLTemplate >> gcPercentage [

	| gcMilliseconds totalMicroseconds |
	gcMilliseconds := gcHistory second - gcHistory last.
	totalMicroseconds := gcHistory first - (gcHistory atLast: 2).
	^ gcMilliseconds * 1000 * 100 / totalMicroseconds
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/21/2022 12:37'
}
LOGLTemplate >> gcTime [

	| gcMilliseconds count |
	gcMilliseconds := gcHistory second - gcHistory last.
	count := gcHistory size // 2 - 1.
	^ gcMilliseconds asFloat / count
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 1/7/2021 17:50'
}
LOGLTemplate >> initialWindowExtent [

	^ 800 @ 600
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:24'
}
LOGLTemplate >> initialize [

	| frames |
	frames := 120. "remember last 120 frames"
	frameTimes := RingBuffer new: frames.
	renderTimes := RingBuffer new: frames.
	gpuTimes := RingBuffer new: frames.
	gcHistory := RingBuffer new: frames + 1 * 2.
	gpuSamples := RingBuffer new: frames.
	gpuPrimitives := RingBuffer new: frames.
	
	isModal := self isModalByDefault.
	minimumFrameDistance := self defaultMinimumFrameDistance.
	windowTitleUpdates := self windowTitleUpdatesDefault.
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 5/2/2022 19:26'
}
LOGLTemplate >> interFramePause [

	| millisecondsToWait |
	self isModal ifTrue: [^ self].
	millisecondsToWait := (timeOfLastFrame + minimumFrameDistance - Time utcMicrosecondClock roundUpTo: 1000) // 1000.
	millisecondsToWait > 0 ifTrue: [| delay |
		delay := self assureInterFrameDelay.
		delay delayDuration: millisecondsToWait.
		self isModal ifTrue: [delay busyWait] ifFalse: [delay wait]].
	self isModal ifFalse: [Processor yield].
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
	#'squeak_changestamp' : 'stlu 9/27/2021 14:59'
}
LOGLTemplate >> isModal: aBoolean [

	isModal := aBoolean.
	renderProcess ifNotNil: [:process |
		process priority: (self processPriorityForModality: aBoolean)].
]

{
	#category : #modality,
	#'squeak_changestamp' : 'stlu 9/6/2021 14:07'
}
LOGLTemplate >> isModalByDefault [

	^ false
]

{
	#category : #input,
	#'squeak_changestamp' : 'stlu 5/2/2022 19:35'
}
LOGLTemplate >> key: key scanCode: scanCode changedTo: state with: mods [

	(key = GLFW_KEY_ESCAPE and: [state = GLFW_RELEASE]) ifTrue: [
		window shouldClose: true].
	
	(GLFW numberOfFunctionKey: key) ifNotNil: [:fNumber |
		state = GLFW_RELEASE ifTrue: [
			fNumber = 1 ifTrue: [self toggleModal].
			fNumber = 2 ifTrue: [self toggleWindowTitleUpdates].
			fNumber = 3 ifTrue: [self saveLogs]]].
]

{
	#category : #input,
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
	#'squeak_changestamp' : 'stlu 5/2/2022 14:36'
}
LOGLTemplate >> logGC [

	gcHistory
		add: (Smalltalk vmParameterAt: 8) + (Smalltalk vmParameterAt: 10);
		add: Time utcMicrosecondClock.
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:25'
}
LOGLTemplate >> logGPUPrimitives: count [

	gpuPrimitives add: count.
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:25'
}
LOGLTemplate >> logGPUSamples: count [

	gpuSamples add: count.
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:25'
}
LOGLTemplate >> logGPUTime: nanoseconds [

	gpuTimes add: nanoseconds asFloat.
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
	#category : #input,
	#'squeak_changestamp' : 'stlu 6/30/2021 09:26'
}
LOGLTemplate >> mouseButton: button changedTo: state with: modifierKeys [

	"do nothing by default"
]

{
	#category : #input,
	#'squeak_changestamp' : 'stlu 6/30/2021 09:22'
}
LOGLTemplate >> mousePositionChangedTo: aPoint [

	"do nothing by default"
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
	#'squeak_changestamp' : 'stlu 5/21/2022 12:38'
}
LOGLTemplate >> printWindowTitleOn: aStream [

	aStream nextPutAll: self baseWindowTitle.
	self isModal ifTrue: [
		aStream nextPutAll: ' (modal)'].
	(self showFrameTimeInWindowTitle and: [frameTimes notEmpty]) ifTrue: [
		aStream nextPutAll: ' | FT: '.
		frameTimes average / 1e3 printOn: aStream showingDecimalPlaces: 2.
		aStream nextPutAll: ' - '.
		frameTimes max / 1e3 printOn: aStream showingDecimalPlaces: 2.
		aStream nextPutAll: 'ms'].
	(self showRenderTimeInWindowTitle and: [renderTimes notEmpty]) ifTrue: [
		aStream nextPutAll: ' | RT: '.
		renderTimes average / 1e3 printOn: aStream showingDecimalPlaces: 2.
		aStream nextPutAll: 'ms'].
	(self showGPUTimeInWindowTitle and: [gpuTimes notEmpty]) ifTrue: [
		aStream nextPutAll: ' | GPU: '.
		gpuTimes average / 1e3 printOn: aStream showingDecimalPlaces: 0.
		aStream nextPutAll: 'us'].
	(self showGCPressureInWindowTitle and: [gcHistory size >= 4]) ifTrue: [
		aStream nextPutAll: ' | GC: '.
		self gcTime printOn: aStream showingDecimalPlaces: 2.
		aStream nextPutAll: 'ms ('.
		self gcPercentage printOn: aStream showingDecimalPlaces: 2.
		aStream nextPutAll: '%)'].
	(self showGPUSamplesInWindowTitle and: [gpuSamples notEmpty]) ifTrue: [
		aStream nextPutAll: ' | S: '.
		gpuSamples average truncated printOn: aStream].
	(self showGPUPrimitivesInWindowTitle and: [gpuPrimitives notEmpty]) ifTrue: [
		aStream nextPutAll: ' | P: '.
		gpuPrimitives average truncated printOn: aStream].
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
	#'squeak_changestamp' : 'stlu 9/27/2021 14:58'
}
LOGLTemplate >> processPriorityForModality: aBoolean [

	^ aBoolean
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
	#'squeak_changestamp' : 'stlu 5/2/2022 17:58'
}
LOGLTemplate >> renderLoop [

	[self shouldClose] whileFalse: [
		| currentFrameTime delta |
		currentFrameTime := Time utcMicrosecondClock.
		self logFrameTime: currentFrameTime - timeOfLastFrame.
		self logGC.
		delta := currentFrameTime - timeOfLastFrame / 1e6.
		library makeCurrentDuring: [
			| frameStartTime |
			GLFW pollEvents.
			self processInput: delta.
			self beginGPUQueries.
			frameStartTime := Time utcMicrosecondClock.
			self render: delta.
			self logRenderTime: Time utcMicrosecondClock - frameStartTime.
			self endGPUQueries.
			window swapBuffers.
			self retrieveGPUQueries].
		self shouldUpdateWindowTitle ifTrue: [self updateWindowTitle].
		timeOfLastFrame := currentFrameTime.
		numFrames := numFrames + 1.
		self interFramePause].
]

{
	#category : #'gpu queries',
	#'squeak_changestamp' : 'stlu 5/2/2022 18:26'
}
LOGLTemplate >> retrieveGPUQueries [

	[pendingGPUQueries notEmpty] whileTrue: [| queries |
		queries := pendingGPUQueries first.
		queries do: [:query | query isResultAvailable ifFalse: [^ self]].
		self logGPUTime: queries first result.
		self logGPUSamples: queries second result.
		self logGPUPrimitives: queries third result.
		availableGPUQueries addLast: queries.
		pendingGPUQueries removeFirst].
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 5/25/2022 14:09'
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
	timeOfLastFrame := Time utcMicrosecondClock.
	timeOfLastWindowTitle := Time utcMicrosecondClock.
	numFrames := 0.
	
	pendingGPUQueries := OrderedCollection new.
	availableGPUQueries := OrderedCollection new.
	
	library := window context library.
	library checksForErrors: true.
	library requireContextInterface.
	
	library makeCurrentDuring: [
		GLFW swapInterval: (self vSync ifTrue: [1] ifFalse: [0]).
		self registerCallbacks.
		self setUp].
	
	self spawnNewRenderProcess.
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 5/2/2022 19:35'
}
LOGLTemplate >> saveLogs [

	
]

{
	#category : #logging,
	#'squeak_changestamp' : 'stlu 5/2/2022 19:55'
}
LOGLTemplate >> saveLogsOn: aStream [

	aStream nextPutAll: '"cycle","frame time","render time","GPU time","GC time","samples","primitives"'.
	frameTimes size to: 1 by: -1 do: [:cycle |
		aStream print: cycle.
		aStream nextPut: $,.
		(frameTimes at: cycle) / 1e3 printOn: aStream showingDecimalPlaces: 3.
		(renderTimes at: cycle) / 1e3 printOn: aStream showingDecimalPlaces: 3.
		(gpuTimes at: cycle) / 1e6 printOn: aStream showingDecimalPlaces: 3.
		(gcHistory at: cycle * 2) - (gcHistory at: cycle * 2 + 2) printOn: aStream.
		(gpuSamples at: cycle) printOn: aStream.
		(gpuPrimitives at: cycle) printOn: aStream].
]

{
	#category : #input,
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
	#'squeak_changestamp' : 'stlu 5/2/2022 15:00'
}
LOGLTemplate >> shouldUpdateWindowTitle [

	^ windowTitleUpdates and: [
		(Time utcMicrosecondClock - timeOfLastWindowTitle) > self windowTitleUpdateInterval]
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
	#'squeak_changestamp' : 'stlu 9/28/2021 17:51'
}
LOGLTemplate >> showGCPressureInWindowTitle [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:27'
}
LOGLTemplate >> showGPUPrimitivesInWindowTitle [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/2/2022 18:27'
}
LOGLTemplate >> showGPUSamplesInWindowTitle [

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
	#'squeak_changestamp' : 'stlu 9/27/2021 14:58'
}
LOGLTemplate >> spawnNewRenderProcess [

	renderProcess := [
		[self renderLoop]
			ensure: [
				self tearDown.
				library context destroy]
	] newProcess priority: (self processPriorityForModality: self isModal).
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
	#'squeak_changestamp' : 'stlu 9/27/2021 14:56'
}
LOGLTemplate >> toggleModal [

	self isModal: self isModal not.
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 5/2/2022 14:56'
}
LOGLTemplate >> toggleWindowTitleUpdates [

	self windowTitleUpdates: self windowTitleUpdates not.
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 14:59'
}
LOGLTemplate >> windowTitleUpdates [

	^ windowTitleUpdates
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 14:59'
}
LOGLTemplate >> windowTitleUpdates: anObject [

	windowTitleUpdates := anObject.
]

{
	#category : #'window title',
	#'squeak_changestamp' : 'stlu 5/2/2022 14:57'
}
LOGLTemplate >> windowTitleUpdatesDefault [

	^ true
]
