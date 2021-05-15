Class {
	#name : #GLVertexArrayManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:54'
}
GLVertexArrayManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:54'
}
GLVertexArrayManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:10'
}
GLVertexArrayManager >> initialize [

	super initialize.
	creationImp := GLVertexArrayCreationImp new.
	stateAccessImp := GLVertexArrayDirectStateAccessImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:53'
}
GLVertexArrayManager >> isValidID: anInteger [

	^ GL isVertexArray: anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:10'
}
GLVertexArrayManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:10'
}
GLVertexArrayManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]