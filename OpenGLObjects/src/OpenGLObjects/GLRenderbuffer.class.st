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
	#'squeak_changestamp' : 'stlu 7/29/2021 23:24'
}
GLRenderbuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager mainImp generateRenderbufferIDs: count)
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
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:50'
}
GLRenderbuffer >> delete [

	manager mainImp deleteRenderbuffer: self.
	super delete.
]

{
	#category : #storage,
	#'squeak_changestamp' : 'stlu 12/10/2021 15:45'
}
GLRenderbuffer >> initializeStorage: extent format: internalFormatEnum [

	manager stateAccessImp
		renderbuffer: self
		initializeStorage: extent
		format: internalFormatEnum.
]

{
	#category : #storage,
	#'squeak_changestamp' : 'stlu 12/10/2021 15:45'
}
GLRenderbuffer >> initializeStorage: extent format: internalFormatEnum samples: numSamples [

	manager stateAccessImp
		renderbuffer: self
		initializeStorage: extent
		format: internalFormatEnum
		samples: numSamples.
]
