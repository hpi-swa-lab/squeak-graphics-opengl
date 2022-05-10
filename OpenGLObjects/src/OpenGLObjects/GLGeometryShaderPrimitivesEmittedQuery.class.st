Class {
	#name : #GLGeometryShaderPrimitivesEmittedQuery,
	#superclass : #GLPipelineStatisticsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLGeometryShaderPrimitivesEmittedQuery class >> target [

	^ GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLGeometryShaderPrimitivesEmittedQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeGeometryShaderPrimitivesEmittedQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLGeometryShaderPrimitivesEmittedQuery >> end [

	manager scopingImp endQuery: self.
	manager activeGeometryShaderPrimitivesEmittedQuery: nil.
]
