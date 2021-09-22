Extension { #name : #GLErrorCheckingLibrary }

{
	#category : #'*OpenGL-Examples',
	#'squeak_changestamp' : 'stlu 9/22/2021 14:42'
}
GLErrorCheckingLibrary class >> example1 [
	"
	self example1.
	"
	"An OpenGL example which produces an internal OpenGL error.
	Uses the automatic error checking.
	Immediately throws an error after an erroneous api call was executed."
	| context library |
	context := B3DContext bounds: (0@0 extent: 400@400).
	"wraps error checking library around default library"
	library := context library withErrorChecking.
	[library makeCurrentDuring: [
		[Sensor anyButtonPressed] whileFalse: [
			GL clear: GL_COLOR. "invalid enum. should be GL_COLOR_BUFFER_BIT"
			context swapBuffers]]
	] ensure: [context destroy].
]
