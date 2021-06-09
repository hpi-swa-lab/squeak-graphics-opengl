Class {
	#name : #GLScopedQuery,
	#superclass : #GLQuery,
	#category : #'OpenGLObjects-Queries'
}

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
