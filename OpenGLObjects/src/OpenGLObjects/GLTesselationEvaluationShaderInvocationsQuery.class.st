Class {
	#name : #GLTesselationEvaluationShaderInvocationsQuery,
	#superclass : #GLShaderInvocationsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:36'
}
GLTesselationEvaluationShaderInvocationsQuery class >> target [

	^ GL_TESS_EVALUATION_SHADER_INVOCATIONS
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTesselationEvaluationShaderInvocationsQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeTesselationEvaluationShaderInvocationsQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTesselationEvaluationShaderInvocationsQuery >> end [

	manager scopingImp endQuery: self.
	manager activeTesselationEvaluationShaderInvocationsQuery: nil.
]
