Extension { #name : #GLLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 4/16/2021 14:34'
}
GLLibrary class >> example1 [ "self example1"
	"A minimal OpenGL example.
	Prints information about the created OpenGL context to the Transcript."
	| lib bounds |
	self flag: #todo. "Correct place for this example?"
	self flag: #todo. "Move away from B3D since the plugin is only really available on LInux"
	bounds := 0@0 extent: 400@400.
	lib := (B3DContext bounds: bounds) library.
	[
		Transcript
			cr; nextPutAll: lib versionString;
			cr; nextPutAll: lib vendorString;
			cr; nextPutAll: lib rendererString;
			cr; nextPutAll: lib shadingLanguageVersionString;
			cr.
		lib extensions do: [:ext |
			Transcript nextPutAll: ext; cr].
		Transcript flush
	] ensure: [lib context destroy]
]

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 4/17/2021 11:19'
}
GLLibrary class >> example2 [ "self example2"
	"A very simple OpenGL 1.0 example showing a rotating red rectangle on white background.
	Click anywhere to dismiss it."
	| context |
	self flag: #todo. "Correct place for this example?"
	self flag: #todo. "Move away from B3D since the plugin is only really available on LInux"
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
