Class {
	#name : #GLQueryImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Queries'
}

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:30'
}
GLQueryImp >> beginQuery: aQuery [

	GL beginQuery: aQuery target with: aQuery id
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 5/24/2021 13:34'
}
GLQueryImp >> createQueryIDs: count target: queryTargetEnum [

	| ids |
	ids := IntegerArray new: count.
	self createQueryIDs: count target: queryTargetEnum into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 5/24/2021 13:33'
}
GLQueryImp >> createQueryIDs: count target: queryTargetEnum into: anIntegerArray [

	GL createQueries: queryTargetEnum with: count with: anIntegerArray
]

{
	#category : #scoping,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:48'
}
GLQueryImp >> endQuery: aQuery [

	GL endQuery: aQuery target
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 5/24/2021 13:32'
}
GLQueryImp >> generateQueryIDs: count [

	| ids |
	ids := IntegerArray new: count.
	self generateQueryIDs: count into: ids.
	^ ids
]

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 5/24/2021 13:32'
}
GLQueryImp >> generateQueryIDs: count into: anIntegerArray [

	GL genQueries: count with: anIntegerArray
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:20'
}
GLQueryImp >> retrieveINT32Parameter: paramEnum from: aQuery [

	| result |
	self flag: #todo. "ensure no buffer is bound to GL_QUERY_BUFFER"
	result := IntegerArray new: 1.
	GL getQueryObjectiv: aQuery id with: paramEnum with: result.
	^ result at: 1
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:23'
}
GLQueryImp >> retrieveINT64Parameter: paramEnum from: aQuery [

	| result |
	self flag: #todo. "ensure no buffer is bound to GL_QUERY_BUFFER"
	result := SignedDoubleWordArray new: 1.
	GL getQueryObjecti64v: aQuery id with: paramEnum with: result.
	^ result at: 1
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:24'
}
GLQueryImp >> retrieveUINT32Parameter: paramEnum from: aQuery [

	| result |
	self flag: #todo. "ensure no buffer is bound to GL_QUERY_BUFFER"
	result := WordArray new: 1.
	GL getQueryObjectuiv: aQuery id with: paramEnum with: result.
	^ result at: 1
]

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 5/24/2021 18:24'
}
GLQueryImp >> retrieveUINT64Parameter: paramEnum from: aQuery [

	| result |
	self flag: #todo. "ensure no buffer is bound to GL_QUERY_BUFFER"
	result := DoubleWordArray new: 1.
	GL getQueryObjectui64v: aQuery id with: paramEnum with: result.
	^ result at: 1
]
