Extension { #name : #GLErrorCheckingLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 4/19/2021 12:18'
}
GLErrorCheckingLibrary class >> example1 [ "self example1"
	"An OpenGL example which produces an internal OpenGL error.
	Uses the automatic error checking.
	Immediately throws an error after an erroneous api call was executed."
	| window context library |
	window := GLFWWindow
					extent: 400 @ 400
					title: self name , ' example1'.
	window ifNil: [^ self error: 'GLFW Error'].
	context := window context.
	
	library := context library withErrorChecking. "wraps error checking library around default library"
	[library makeCurrentDuring: [
		[window shouldClose] whileFalse: [
			GL clear: GL_COLOR. "invalid enum. should be GL_COLOR_BUFFER_BIT"
			context swapBuffers.
			GLFW pollEvents]]
	] ensure: [context destroy]
]
