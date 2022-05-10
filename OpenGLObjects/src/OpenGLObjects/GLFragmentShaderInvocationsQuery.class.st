Class {
	#name : #GLFragmentShaderInvocationsQuery,
	#superclass : #GLShaderInvocationsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:34'
}
GLFragmentShaderInvocationsQuery class >> target [

	^ GL_FRAGMENT_SHADER_INVOCATIONS
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLFragmentShaderInvocationsQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeFragmentShaderInvocationsQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLFragmentShaderInvocationsQuery >> end [

	manager scopingImp endQuery: self.
	manager activeFragmentShaderInvocationsQuery: nil.
]
