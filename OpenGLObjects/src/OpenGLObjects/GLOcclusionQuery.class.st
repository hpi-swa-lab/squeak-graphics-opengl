Class {
	#name : #GLOcclusionQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:38'
}
GLOcclusionQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeOcclusionQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:38'
}
GLOcclusionQuery >> end [

	manager scopingImp endQuery: self.
	manager activeOcclusionQuery: nil.
]
