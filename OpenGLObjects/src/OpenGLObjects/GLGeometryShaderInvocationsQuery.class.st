Class {
	#name : #GLGeometryShaderInvocationsQuery,
	#superclass : #GLShaderInvocationsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLGeometryShaderInvocationsQuery class >> target [

	^ GL_GEOMETRY_SHADER_INVOCATIONS
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLGeometryShaderInvocationsQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeGeometryShaderInvocationsQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLGeometryShaderInvocationsQuery >> end [

	manager scopingImp endQuery: self.
	manager activeGeometryShaderInvocationsQuery: nil.
]
