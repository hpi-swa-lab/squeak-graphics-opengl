Extension { #name : #GLVersionCheckingLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 4/19/2021 19:12'
}
GLVersionCheckingLibrary class >> example1 [ "self example1"
	"An OpenGL example which uses deprecated fixed-function pipeline api calls.
	Uses the automatic version checking to define OpenGL 3.3 Core Profile as the target version.
	Throws an error when it reaches the deprecated api calls."
	| window context library |
	window := GLFWWindow
					extent: 400 @ 400
					title: self name , ' example1'.
	window ifNil: [^ self error: 'GLFW Error'].
	context := window context.
	
	library := context library withVersionChecking: (GL33 profile: #core). "wraps version checking library around default library"
	[library makeCurrentDuring: [
		GL disable: GL_DEPTH_TEST.
		GL clearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
		[window shouldClose] whileFalse: [
			GL clear: GL_COLOR_BUFFER_BIT.
			
			GL rotatef: 5.0 with: 0.0 with: 0.0 with: 1.0. "removed in OpenGL 3.2 Core Profile"
			GL color3f: 1.0 with: 0.0 with: 0.0. "removed in OpenGL 3.2 Core Profile"
			
			GL begin: GL_POLYGON. "removed in OpenGL 3.2 Core Profile"
				GL vertex2f: -0.7 with: -0.7. "removed in OpenGL 3.2 Core Profile"
				GL vertex2f:  0.7 with: -0.7.
				GL vertex2f:  0.7 with:  0.7.
				GL vertex2f: -0.7 with:  0.7.
			GL end. "removed in OpenGL 3.2 Core Profile"
			
			context swapBuffers.
			GLFW pollEvents]]
	] ensure: [context destroy]
]
