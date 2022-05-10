Class {
	#name : #GLVertexShaderInvocationsQuery,
	#superclass : #GLShaderInvocationsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:37'
}
GLVertexShaderInvocationsQuery class >> target [

	^ GL_VERTEX_SHADER_INVOCATIONS
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLVertexShaderInvocationsQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeVertexShaderInvocationsQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLVertexShaderInvocationsQuery >> end [

	manager scopingImp endQuery: self.
	manager activeVertexShaderInvocationsQuery: nil.
]
