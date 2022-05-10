Class {
	#name : #GLClippingOutputPrimitivesQuery,
	#superclass : #GLPipelineStatisticsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLClippingOutputPrimitivesQuery class >> target [

	^ GL_CLIPPING_OUTPUT_PRIMITIVES
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLClippingOutputPrimitivesQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeClippingOutputPrimitivesQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLClippingOutputPrimitivesQuery >> end [

	manager scopingImp endQuery: self.
	manager activeClippingOutputPrimitivesQuery: nil.
]
