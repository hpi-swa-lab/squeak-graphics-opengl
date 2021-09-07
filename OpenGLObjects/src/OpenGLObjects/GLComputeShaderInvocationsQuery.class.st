Class {
	#name : #GLComputeShaderInvocationsQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLComputeShaderInvocationsQuery class >> target [

	^ GL_COMPUTE_SHADER_INVOCATIONS
]
