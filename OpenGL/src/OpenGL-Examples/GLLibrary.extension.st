Extension { #name : #GLLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/24/2021 23:35'
}
GLLibrary class >> example1 [
	"
	self example1.
	"
	"Prints information about the OpenGL context created by GLFW to the Transcript."
	| window library |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		library := window context library.
		library makeCurrentDuring: [
			Transcript
				openIfNone;
				cr; nextPutAll: '** OpenGL version **';
				cr; nextPutAll: library versionString;
				cr; nextPutAll: '** OpenGL vendor **';
				cr; nextPutAll: library vendorString;
				cr; nextPutAll: '** OpenGL renderer **';
				cr; nextPutAll: library rendererString;
				cr; nextPutAll: '** OpenGL GLSL version **';
				cr; nextPutAll: library shadingLanguageVersionString;
				cr; nextPutAll: '** OpenGL extensions **';
				cr.
			library extensions do: [:ext |
				Transcript nextPutAll: ext; cr].
			Transcript flush]
	] ensure: [window destroy].
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/24/2021 23:35'
}
GLLibrary class >> example2 [
	"
	self example2.
	"
	"A simple OpenGL example that (slowly) cycles through colors.
	Click anywhere to dismiss it."
	| window library |
	"There are different ways to get ahold of an OpenGL context. Squeak by default ships with the external `B3DAcceleratorPlugin` that can be used to create a context overlaying an area of the native Squeak window. We will instead be using GLFW."
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		"To actually interact with OpenGL we need the library as it was created by the context. There are some wrapper libraries that provide additional features, but the innermost library should always be this one."
		library := window context library.
		"We need to tell OpenGL which context to activate."
		library makeCurrentDuring: [
			"From here on out we can refer to our library using the global variable `GL`."
			[window shouldClose or: [Sensor anyButtonPressed]] whileFalse: [
				GL clearColor: (Color h: Time utcMicrosecondClock / 2e4 \\ 360.0 s: 1.0 v: 1.0).
				GL clear: GL_COLOR_BUFFER_BIT.
				GLFW pollEvents.
				window swapBuffers]]
	] ensure: [window destroy].
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/24/2021 23:35'
}
GLLibrary class >> example3 [
	"
	self example3.
	"
	"A simple OpenGL 1.0 (i.e. deprecated) example showing a rotating red rectangle on white background.
	Click anywhere to dismiss it."
	| window library |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		library := window context library withVersionChecking: GL10 new.
		library makeCurrentDuring: [
			GL disable: GL_DEPTH_TEST.
			GL clearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
			[window shouldClose or: [Sensor anyButtonPressed]] whileFalse: [
				GL clear: GL_COLOR_BUFFER_BIT.
				
				GL rotatef: 5.0 with: 0.0 with: 0.0 with: 1.0.
				GL color3f: 1.0 with: 0.0 with: 0.0.
				
				GL begin: GL_POLYGON.
					GL vertex2f: -0.7 with: -0.7.
					GL vertex2f:  0.7 with: -0.7.
					GL vertex2f:  0.7 with:  0.7.
					GL vertex2f: -0.7 with:  0.7.
				GL end.
				
				GLFW pollEvents.
				window swapBuffers]]
	] ensure: [window destroy].
]