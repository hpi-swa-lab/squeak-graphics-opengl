Class {
	#name : #GLGeometryShaderInvocationsQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLGeometryShaderInvocationsQuery class >> target [

	^ GL_GEOMETRY_SHADER_INVOCATIONS
]
