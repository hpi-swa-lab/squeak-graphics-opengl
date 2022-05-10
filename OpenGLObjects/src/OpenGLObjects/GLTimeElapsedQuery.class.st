"
Records the time that it takes for the GPU to execute all of the scoped commands.

The timer starts when all commands before the scope have completed, and the timer ends when the last scoped command has completed.
"
Class {
	#name : #GLTimeElapsedQuery,
	#superclass : #GLScopedQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:27'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:36'
}
GLTimeElapsedQuery class >> target [

	^ GL_TIME_ELAPSED
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTimeElapsedQuery >> begin [

	manager scopingImp beginQuery: self.
	manager activeTimeElapsedQuery: self.
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:03'
}
GLTimeElapsedQuery >> end [

	manager scopingImp endQuery: self.
	manager activeTimeElapsedQuery: nil.
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/26/2021 17:52'
}
GLTimeElapsedQuery >> result [

	^ manager retrievalImp
		retrieveUINT32Parameter: GL_QUERY_RESULT
		from: self
]
