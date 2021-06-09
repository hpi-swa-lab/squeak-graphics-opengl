"
Records the number of primitives sent to a particular geometry shader output stream (or by stream 0 if no geometry shader is active) by the scoped drawing commands.

When active for a vertex stream, the count is incremented every time a primitive emitted to that stream reaches the transform feedback stage, whether or not transform feedback is active. The counter counts the number of primitives emitted by a geometry shader, if active, possibly further tessellated into separate primitives during the transform feedback stage, if active.

Each combination of vertex stream and query target maintains a separate active query object.
The number of vertex streams is given by the value of the implementation-dependent constant MAX_VERTEX_STREAMS.
"
Class {
	#name : #GLPrimitivesGenerated,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 15:19'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLPrimitivesGenerated class >> target [

	^ GL_PRIMITIVES_GENERATED
]
