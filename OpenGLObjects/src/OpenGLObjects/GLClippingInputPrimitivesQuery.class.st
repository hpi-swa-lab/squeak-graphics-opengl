Class {
	#name : #GLClippingInputPrimitivesQuery,
	#superclass : #GLPipelineStatisticsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLClippingInputPrimitivesQuery class >> target [

	^ GL_CLIPPING_INPUT_PRIMITIVES
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLClippingInputPrimitivesQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeClippingInputPrimitivesQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLClippingInputPrimitivesQuery >> end [

	manager scopingImp endQuery: self.
	manager activeClippingInputPrimitivesQuery: nil.
]
