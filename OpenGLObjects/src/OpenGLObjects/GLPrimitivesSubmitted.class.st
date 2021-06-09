"
Returns information on the number of primitives transferred to the GL.

When active, the count is incremented every time a point, line, triangle, or patch primitive is transferred to the GL.
Restarting a primitive topology using the primitive restart index has no effect on the issued primitives count.
Incomplete primitives may or may not be counted.
"
Class {
	#name : #GLPrimitivesSubmitted,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 15:25'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLPrimitivesSubmitted class >> target [

	^ GL_PRIMITIVES_SUBMITTED
]
