Class {
	#name : #GLRenderbuffer,
	#superclass : #GLObject,
	#category : #'OpenGLObjects-Renderbuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:48'
}
GLRenderbuffer class >> bound [

	^ self manager boundRenderbuffer
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbuffer class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createRenderbufferIDs: count)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:48'
}
GLRenderbuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:51'
}
GLRenderbuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateRenderbufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:46'
}
GLRenderbuffer class >> manager [

	^ GL objectState renderbufferManager
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:50'
}
GLRenderbuffer class >> unbind [

	self manager bindRenderbuffer: nil
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:49'
}
GLRenderbuffer >> bind [

	manager bindRenderbuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:49'
}
GLRenderbuffer >> boundDuring: aBlock [

	^ manager bindRenderbuffer: self during: aBlock
]

{
	#category : #storage,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:15'
}
GLRenderbuffer >> initializeStorage: extent format: internalFormatEnum samples: numSamples [

	self stateAccessImp
		renderbuffer: self
		initializeStorage: extent
		format: internalFormatEnum
		samples: numSamples
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:33'
}
GLRenderbuffer >> stateAccessImp [

	^ manager stateAccessImp
]
