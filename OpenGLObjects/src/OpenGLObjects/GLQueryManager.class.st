Class {
	#name : #GLQueryManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'scopingImp',
		'retrievalImp',
		'activeTimeElapsedQuery'
	],
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:27'
}
GLQueryManager >> activeTimeElapsedQuery [

	^ activeTimeElapsedQuery
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:27'
}
GLQueryManager >> activeTimeElapsedQuery: anObject [

	activeTimeElapsedQuery := anObject
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 12:42'
}
GLQueryManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 12:42'
}
GLQueryManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:03'
}
GLQueryManager >> initialize [

	super initialize.
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
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/24/2021 12:43'
}
GLQueryManager >> isValidID: anInteger [

	^ GL isQuery: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:03'
}
GLQueryManager >> retrievalImp [

	^ retrievalImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:03'
}
GLQueryManager >> retrievalImp: anObject [

	retrievalImp := anObject
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:29'
}
GLQueryManager >> scopingImp [

	^ scopingImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:29'
}
GLQueryManager >> scopingImp: anObject [

	scopingImp := anObject
]
