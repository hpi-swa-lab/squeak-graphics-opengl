Class {
	#name : #GLBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-ObjectManagers'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 11:54'
}
GLBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 11:54'
}
GLBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/26/2021 11:54'
}
GLBufferManager >> initialize [

	super initialize.
	creationImp := GLBufferCreationImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:50'
}
GLBufferManager >> isValidID: anInteger [

	^ GL isBuffer: anInteger
]
