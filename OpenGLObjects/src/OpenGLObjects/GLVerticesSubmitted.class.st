"
Returns information on the number of vertices transferred to the GL.

When active, the count is incremented every time a vertex is transferred to the GL.
In the case of primitive types with adjacency information, implementations may or may not count vertices not belonging to the main primitives.
In the case of line loop primitives, implementations are allowed to count the first vertex twice for the purposes of VERTICES_SUBMITTED queries. Additionally, vertices corresponding to incomplete primitives may or may not be counted.
"
Class {
	#name : #GLVerticesSubmitted,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:37'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:37'
}
GLVerticesSubmitted class >> target [

	^ GL_VERTICES_SUBMITTED
]
