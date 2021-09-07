Class {
	#name : #GLGeometryShaderPrimitivesEmittedQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLGeometryShaderPrimitivesEmittedQuery class >> target [

	^ GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED
]
