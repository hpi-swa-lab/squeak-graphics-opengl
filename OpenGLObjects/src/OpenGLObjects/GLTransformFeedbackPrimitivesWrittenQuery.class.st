"
Records the number of primitives written by a geometry shader stream to a transform feedback object (or by stream 0 if no geometry shader is active) by the scoped drawing commands.

When active for a vertex stream, the counter for that vertex stream is incremented every time the vertices of a primitive written to that stream are recorded into one or more buffer objects. If transform feedback is not active or if a primitive to be recorded does not fit in a buffer object, the counter is not incremented.

Each combination of vertex stream and query target maintains a separate active query object.
The number of vertex streams is given by the value of the implementation-dependent constant MAX_VERTEX_STREAMS.
"
Class {
	#name : #GLTransformFeedbackPrimitivesWrittenQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 15:19'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:36'
}
GLTransformFeedbackPrimitivesWrittenQuery class >> target [

	^ GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN
]
