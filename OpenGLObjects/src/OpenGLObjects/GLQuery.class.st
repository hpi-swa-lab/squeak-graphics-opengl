Class {
	#name : #GLQuery,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/24/2021 13:31'
}
GLQuery class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createQueryIDs: count target: self target)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/24/2021 13:30'
}
GLQuery class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/29/2021 23:24'
}
GLQuery class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager mainImp generateQueryIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 15:32'
}
GLQuery class >> manager [

	^ GL objectState queryManager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:32'
}
GLQuery class >> target [

	self subclassResponsibility.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:49'
}
GLQuery >> delete [

	manager mainImp deleteQuery: self.
	super delete.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:29'
}
GLQuery >> isResultAvailable [

	^ (manager retrievalImp
		retrieveUINT32Parameter: GL_QUERY_RESULT_AVAILABLE
		from: self) = GL_TRUE
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/2/2022 17:14'
}
GLQuery >> result [

	^ manager retrievalImp
		retrieveUINT64Parameter: GL_QUERY_RESULT
		from: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:31'
}
GLQuery >> target [

	^ self class target
]
