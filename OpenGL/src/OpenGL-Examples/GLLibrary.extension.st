Extension { #name : #GLLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/22/2021 13:57'
}
GLLibrary class >> example1 [
	"
	self example1.
	"
	"Prints information about the OpenGL context created by the B3DAcceleratorPlugin to the Transcript."
	| lib bounds |
	bounds := 0@0 extent: 400@400.
	lib := (B3DContext bounds: bounds) library.
	[
		Transcript
			openIfNone;
			cr; nextPutAll: '** OpenGL version **';
			cr; nextPutAll: lib versionString;
			cr; nextPutAll: '** OpenGL vendor **';
			cr; nextPutAll: lib vendorString;
			cr; nextPutAll: '** OpenGL renderer **';
			cr; nextPutAll: lib rendererString;
			cr; nextPutAll: '** OpenGL GLSL version **';
			cr; nextPutAll: lib shadingLanguageVersionString;
			cr; nextPutAll: '** OpenGL extensions **';
			cr.
		lib extensions do: [:ext |
			Transcript nextPutAll: ext; cr].
		Transcript flush
	] ensure: [lib context destroy]
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/22/2021 13:56'
}
GLLibrary class >> example2 [
	"
	self example2.
	"
	"A simple OpenGL example that (slowly) cycles through colors.
	Click anywhere to dismiss it."
	| context library |
	"There are different ways to get ahold of an OpenGL context. Squeak by default ships with the external `B3DAcceleratorPlugin` that can be used to create a context overlaying an area of the native Squeak window."
	context := B3DContext bounds: (0@0 extent: 400@400).
	"To actually interact with OpenGL we need the library as it was created by the context. There are some wrapper libraries that provide additional features, but the innermost library should always be this one."
	library := context library.
	[
		"We need to tell OpenGL which context to activate."
		library makeCurrentDuring: [
			"From here on out we can refer to our library using the global variable `GL`."
			[Sensor anyButtonPressed] whileFalse: [
				GL clearColor: (Color h: Time utcMicrosecondClock / 2e4 \\ 360.0 s: 1.0 v: 1.0).
				GL clear: GL_COLOR_BUFFER_BIT.
				context swapBuffers]]
	] ensure: [context destroy]
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/22/2021 13:38'
}
GLLibrary class >> example3 [
	"
	self example3.
	"
	"A simple OpenGL 1.0 (i.e. deprecated) example showing a rotating red rectangle on white background.
	Click anywhere to dismiss it."
	| context |
	context := B3DContext bounds: (0@0 extent: 400@400).
	[
		(context library withVersionChecking: GL10 new) makeCurrentDuring: [
			GL disable: GL_DEPTH_TEST.
			GL clearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
			[Sensor anyButtonPressed] whileFalse: [
				GL clear: GL_COLOR_BUFFER_BIT.
				
				GL rotatef: 5.0 with: 0.0 with: 0.0 with: 1.0.
				GL color3f: 1.0 with: 0.0 with: 0.0.
				
				GL begin: GL_POLYGON.
					GL vertex2f: -0.7 with: -0.7.
					GL vertex2f:  0.7 with: -0.7.
					GL vertex2f:  0.7 with:  0.7.
					GL vertex2f: -0.7 with:  0.7.
				GL end.
				
				context swapBuffers]]
	] ensure: [context destroy]
]
