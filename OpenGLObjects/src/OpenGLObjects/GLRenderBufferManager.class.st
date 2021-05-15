Class {
	#name : #GLRenderBufferManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-ObjectManagers'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderBufferManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderBufferManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:46'
}
GLRenderBufferManager >> initialize [

	super initialize.
	creationImp := GLRenderBufferCreationImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLRenderBufferManager >> isValidID: anInteger [

	^ GL isRenderbuffer: anInteger
]
