Class {
	#name : #GLVertexArrayManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'boundVertexArray',
		'creationImp',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:17'
}
GLVertexArrayManager >> bindVertexArray: vertexArrayOrNil [

	boundVertexArray == vertexArrayOrNil ifTrue: [^ self].
	
	mainImp bindVertexArray: vertexArrayOrNil.
	
	boundVertexArray := vertexArrayOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:42'
}
GLVertexArrayManager >> bindVertexArray: vertexArrayOrNil during: aBlock [

	| previous |
	previous := boundVertexArray.
	self bindVertexArray: vertexArrayOrNil.
	^ aBlock ensure: [
		self bindVertexArray: previous]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:11'
}
GLVertexArrayManager >> boundVertexArray [

	^ boundVertexArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:11'
}
GLVertexArrayManager >> boundVertexArray: anObject [

	boundVertexArray := anObject
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:54'
}
GLVertexArrayManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:54'
}
GLVertexArrayManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 11:46'
}
GLVertexArrayManager >> initializeImplementorsForVersion: aVersion [
	
	mainImp := GLVertexArrayImp new.
	creationImp := GLVertexArrayImp new.
	stateAccessImp := GLDirectStateAccessImp new.
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:10'
}
GLVertexArrayManager >> stateAccessImp [

	^ stateAccessImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:10'
}
GLVertexArrayManager >> stateAccessImp: anObject [

	stateAccessImp := anObject
]
