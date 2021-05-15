Class {
	#name : #GLFrameBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-ObjectManagers'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:39'
}
GLFrameBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:38'
}
GLFrameBufferManager >> initialize [

	super initialize.
	creationImp := GLFrameBufferCreationImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:51'
}
GLFrameBufferManager >> isValidID: anInteger [

	^ GL isFramebuffer: anInteger
]
