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
	#'squeak_changestamp' : 'stlu 5/24/2022 17:52'
}
GLLibrary class >> example3 [
	"
	self example3.
	"
	"A simple OpenGL 1.0 (i.e. deprecated) example showing a rotating red rectangle on white background.
	Click anywhere to dismiss it."
	| window |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		window context library makeCurrentDuring: [
			GL requireVersion: GL10 new.
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

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 5/24/2022 18:04'
}
GLLibrary class >> example4 [
	"
	self example4.
	"
	"An example of automatic error checking.
	The following code produces an internal OpenGL error.
	The automatic error checking is used to catch it immediately afterwards."
	| window |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		window context library makeCurrentDuring: [
			"activates automatic error checking"
			GL checksForErrors: true.
			
			[window shouldClose or: [Sensor anyButtonPressed]] whileFalse: [
				"the following command throws an error in the GL"
				GL clear: GL_COLOR. "Error: Invalid value. A numeric argument is out of range."
				"should have been GL_COLOR_BUFFER_BIT instead of GL_COLOR"
				
				GLFW pollEvents.
				window swapBuffers]]
	] ensure: [window destroy].
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 5/24/2022 18:03'
}
GLLibrary class >> example5 [
	"
	self example5.
	"
	"An example of automatic version checking.
	The OpenGL code below uses deprecated fixed-function pipeline api calls.
	We define OpenGL 3.3 Core Profile as the target version, causing an error to be thrown once the deprecated commands are reached."
	| window |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		window context library makeCurrentDuring: [
			"require OpenGL 3.3 Core Profile"
			GL requireVersion: (GL33 profile: #core).
			
			GL disable: GL_DEPTH_TEST.
			GL clearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
			[window shouldClose or: [Sensor anyButtonPressed]] whileFalse: [
				GL clear: GL_COLOR_BUFFER_BIT.
				
				"The next command will throw an error since it is not available in OpenGL 3.3 Core Profile."
				"The command was removed in OpenGL 3.2 Core Profile."
				GL rotatef: 5.0 with: 0.0 with: 0.0 with: 1.0. "Error: glRotatef is not available"
				GL color3f: 1.0 with: 0.0 with: 0.0. "also removed in OpenGL 3.2 Core Profile"
				
				GL begin: GL_POLYGON. "also removed in OpenGL 3.2 Core Profile"
					GL vertex2f: -0.7 with: -0.7. "also removed in OpenGL 3.2 Core Profile"
					GL vertex2f:  0.7 with: -0.7.
					GL vertex2f:  0.7 with:  0.7.
					GL vertex2f: -0.7 with:  0.7.
				GL end. "also removed in OpenGL 3.2 Core Profile"
				
				GLFW pollEvents.
				window swapBuffers]]
	] ensure: [window destroy].
]
