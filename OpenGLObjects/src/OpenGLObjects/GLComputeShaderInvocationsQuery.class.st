Class {
	#name : #GLComputeShaderInvocationsQuery,
	#superclass : #GLShaderInvocationsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLComputeShaderInvocationsQuery class >> target [

	^ GL_COMPUTE_SHADER_INVOCATIONS
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLComputeShaderInvocationsQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeComputeShaderInvocationsQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLComputeShaderInvocationsQuery >> end [

	manager scopingImp endQuery: self.
	manager activeComputeShaderInvocationsQuery: nil.
]
