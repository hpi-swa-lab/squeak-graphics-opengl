"
Returns information on whether or not transform feedback overflow happened in one or all streams.

When active for a specific vertex stream and transform feedback is active, a primitive to be recorded on said stream that does not fit in one of the buffer objects used for capture will cause the overflow state to be set to true.
Each combination of vertex stream and query target maintains a separate active query object.
The number of vertex streams is given by the value of the implementation-dependent constant MAX_VERTEX_STREAMS.

When active without specifying a vertex stream and transform feedback is active, a primitive to be recorded on ANY stream that does not fit in one of the buffer objects used for capture will cause the overflow state to be set to true.
"
Class {
	#name : #GLTransformFeedbackOverflowQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 15:19'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:36'
}
GLTransformFeedbackOverflowQuery class >> target [

	^ GL_TRANSFORM_FEEDBACK_OVERFLOW
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTransformFeedbackOverflowQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeTransformFeedbackOverflowQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTransformFeedbackOverflowQuery >> end [

	manager scopingImp endQuery: self.
	manager activeTransformFeedbackOverflowQuery: nil.
]
