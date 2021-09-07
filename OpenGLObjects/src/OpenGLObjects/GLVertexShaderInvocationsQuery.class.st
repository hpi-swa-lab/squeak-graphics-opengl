Class {
	#name : #GLVertexShaderInvocationsQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:37'
}
GLVertexShaderInvocationsQuery class >> target [

	^ GL_VERTEX_SHADER_INVOCATIONS
]
