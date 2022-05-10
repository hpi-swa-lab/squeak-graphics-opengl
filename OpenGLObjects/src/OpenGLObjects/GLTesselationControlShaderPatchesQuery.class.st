Class {
	#name : #GLTesselationControlShaderPatchesQuery,
	#superclass : #GLPipelineStatisticsQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLTesselationControlShaderPatchesQuery class >> target [

	^ GL_TESS_CONTROL_SHADER_PATCHES
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTesselationControlShaderPatchesQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeTesselationControlShaderPatchesQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTesselationControlShaderPatchesQuery >> end [

	manager scopingImp endQuery: self.
	manager activeTesselationControlShaderPatchesQuery: nil.
]
