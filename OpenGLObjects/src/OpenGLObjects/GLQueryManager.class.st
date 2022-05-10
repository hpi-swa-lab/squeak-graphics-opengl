Class {
	#name : #GLQueryManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'scopingImp',
		'retrievalImp',
		'activeTimeElapsedQuery',
		'activeOcclusionQuery',
		'activeTransformFeedbackOverflowQuery',
		'activeTransformFeedbackPrimitivesWrittenQuery',
		'activePrimitivesGeneratedQuery',
		'activeComputeShaderInvocationsQuery',
		'activeFragmentShaderInvocationsQuery',
		'activeGeometryShaderInvocationsQuery',
		'activeTesselationEvaluationShaderInvocationsQuery',
		'activeVertexShaderInvocationsQuery',
		'activeClippingInputPrimitivesQuery',
		'activeClippingOutputPrimitivesQuery',
		'activeVerticesSubmittedQuery',
		'activePrimitivesSubmittedQuery',
		'activeTesselationControlShaderPatchesQuery',
		'activeGeometryShaderPrimitivesEmittedQuery'
	],
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeClippingInputPrimitivesQuery [

	^ activeClippingInputPrimitivesQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeClippingInputPrimitivesQuery: anObject [

	activeClippingInputPrimitivesQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeClippingOutputPrimitivesQuery [

	^ activeClippingOutputPrimitivesQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeClippingOutputPrimitivesQuery: anObject [

	activeClippingOutputPrimitivesQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeComputeShaderInvocationsQuery [

	^ activeComputeShaderInvocationsQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeComputeShaderInvocationsQuery: anObject [

	activeComputeShaderInvocationsQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeFragmentShaderInvocationsQuery [

	^ activeFragmentShaderInvocationsQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeFragmentShaderInvocationsQuery: anObject [

	activeFragmentShaderInvocationsQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeGeometryShaderInvocationsQuery [

	^ activeGeometryShaderInvocationsQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeGeometryShaderInvocationsQuery: anObject [

	activeGeometryShaderInvocationsQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeGeometryShaderPrimitivesEmittedQuery [

	^ activeGeometryShaderPrimitivesEmittedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeGeometryShaderPrimitivesEmittedQuery: anObject [

	activeGeometryShaderPrimitivesEmittedQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:39'
}
GLQueryManager >> activeOcclusionQuery [

	^ activeOcclusionQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:39'
}
GLQueryManager >> activeOcclusionQuery: anObject [

	activeOcclusionQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activePrimitivesGeneratedQuery [

	^ activePrimitivesGeneratedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activePrimitivesGeneratedQuery: anObject [

	activePrimitivesGeneratedQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activePrimitivesSubmittedQuery [

	^ activePrimitivesSubmittedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activePrimitivesSubmittedQuery: anObject [

	activePrimitivesSubmittedQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTesselationControlShaderPatchesQuery [

	^ activeTesselationControlShaderPatchesQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTesselationControlShaderPatchesQuery: anObject [

	activeTesselationControlShaderPatchesQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTesselationEvaluationShaderInvocationsQuery [

	^ activeTesselationEvaluationShaderInvocationsQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTesselationEvaluationShaderInvocationsQuery: anObject [

	activeTesselationEvaluationShaderInvocationsQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTimeElapsedQuery [

	^ activeTimeElapsedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 16:57'
}
GLQueryManager >> activeTimeElapsedQuery: anObject [

	activeTimeElapsedQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTransformFeedbackOverflowQuery [

	^ activeTransformFeedbackOverflowQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTransformFeedbackOverflowQuery: anObject [

	activeTransformFeedbackOverflowQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTransformFeedbackPrimitivesWrittenQuery [

	^ activeTransformFeedbackPrimitivesWrittenQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeTransformFeedbackPrimitivesWrittenQuery: anObject [

	activeTransformFeedbackPrimitivesWrittenQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeVertexShaderInvocationsQuery [

	^ activeVertexShaderInvocationsQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeVertexShaderInvocationsQuery: anObject [

	activeVertexShaderInvocationsQuery := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeVerticesSubmittedQuery [

	^ activeVerticesSubmittedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLQueryManager >> activeVerticesSubmittedQuery: anObject [

	activeVerticesSubmittedQuery := anObject.
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 12:42'
}
GLQueryManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 12:42'
}
GLQueryManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:46'
}
GLQueryManager >> initialize [

	super initialize.
	
	mainImp := GLQueryImp new.
	creationImp := GLQueryImp new.
	scopingImp := GLQueryImp new.
	retrievalImp := GLQueryImp new.
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:27'
}
GLQueryManager >> isResultAvailable: aQuery [

	^ (retrievalImp
		retrieveUINT32Parameter: GL_QUERY_RESULT_AVAILABLE
		from: aQuery) = GL_TRUE
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:03'
}
GLQueryManager >> retrievalImp [

	^ retrievalImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:03'
}
GLQueryManager >> retrievalImp: anObject [

	retrievalImp := anObject
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:29'
}
GLQueryManager >> scopingImp [

	^ scopingImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:29'
}
GLQueryManager >> scopingImp: anObject [

	scopingImp := anObject
]
