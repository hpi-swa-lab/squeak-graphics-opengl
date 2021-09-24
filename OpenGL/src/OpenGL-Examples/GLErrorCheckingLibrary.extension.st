Extension { #name : #GLErrorCheckingLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/24/2021 23:34'
}
GLErrorCheckingLibrary class >> example1 [
	"
	self example1.
	"
	"An OpenGL example which produces an internal OpenGL error.
	Uses the automatic error checking.
	Immediately throws an error after an erroneous api call was executed."
	| window library |
	window := GLFWWindow
		extent: 400 @ 400
		title: thisContext homeMethod reference.
	window ifNil: [^ self error: 'GLFW Error'].
	
	[
		"wraps error checking library around default library"
		library := window context library withErrorChecking.
		library makeCurrentDuring: [
			[window shouldClose or: [Sensor anyButtonPressed]] whileFalse: [
				GL clear: GL_COLOR. "invalid enum. should be GL_COLOR_BUFFER_BIT"
				GLFW pollEvents.
				window swapBuffers]]
	] ensure: [window destroy].
]
