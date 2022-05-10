"
Returns information on the number of primitives transferred to the GL.

When active, the count is incremented every time a point, line, triangle, or patch primitive is transferred to the GL.
Restarting a primitive topology using the primitive restart index has no effect on the issued primitives count.
Incomplete primitives may or may not be counted.
"
Class {
	#name : #GLPrimitivesSubmittedQuery,
	#superclass : #GLPipelineStatisticsQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 15:25'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLPrimitivesSubmittedQuery class >> target [

	^ GL_PRIMITIVES_SUBMITTED
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLPrimitivesSubmittedQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activePrimitivesSubmittedQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLPrimitivesSubmittedQuery >> end [

	manager scopingImp endQuery: self.
	manager activePrimitivesSubmittedQuery: nil.
]
