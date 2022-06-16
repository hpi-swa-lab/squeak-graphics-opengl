Class {
	#name : #GLScopedQuery,
	#superclass : #GLQuery,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLScopedQuery class >> generateBeginEndCode [
"
self generateBeginEndCode
"
	self withAllSubclassesDo: [:cls |
		cls subclasses ifEmpty: [| name var |
			name := cls name allButFirst: 2. "remove GL prefix"
			var := 'active' , name.
			GLQueryManager addInstVarNames: { var }.
			(GLQueryManager canUnderstand: var) ifFalse: [
				GLQueryManager createGetterFor: var].
			(GLQueryManager canUnderstand: var asSimpleSetter) ifFalse: [
				GLQueryManager createSetterFor: var].
			cls compile: ('begin

	manager scopingImp beginQuery: self.
	manager {1}: self.' format: { var }) classified: #scoping.
			cls compile: ('end

	manager scopingImp endQuery: self.
	manager {1}: nil.' format: { var }) classified: #scoping]].
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLScopedQuery class >> generateBeginEndCode [
"
self generateBeginEndCode
"
	self withAllSubclassesDo: [:cls |
		cls subclasses ifEmpty: [| name var |
			name := cls name allButFirst: 2. "remove GL prefix"
			var := 'active' , name.
			GLQueryManager addInstVarNames: { var }.
			(GLQueryManager canUnderstand: var) ifFalse: [
				GLQueryManager createGetterFor: var].
			(GLQueryManager canUnderstand: var asSimpleSetter) ifFalse: [
				GLQueryManager createSetterFor: var].
			cls compile: ('begin

	manager scopingImp beginQuery: self.
	manager {1}: self.' format: { var }) classified: #scoping.
			cls compile: ('end

	manager scopingImp endQuery: self.
	manager {1}: nil.' format: { var }) classified: #scoping]].
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:25'
}
GLScopedQuery >> begin [

	self subclassResponsibility.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:30'
}
GLScopedQuery >> during: aBlock [

	self begin.
	^ aBlock ensure: [
		self end]
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:25'
}
GLScopedQuery >> end [

	self subclassResponsibility.
]
