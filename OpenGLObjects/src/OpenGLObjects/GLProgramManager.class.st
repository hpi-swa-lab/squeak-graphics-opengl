Class {
	#name : #GLProgramManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-ObjectManagers'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:48'
}
GLProgramManager >> creationImp [

	^ creationImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:48'
}
GLProgramManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/25/2021 23:00'
}
GLProgramManager >> initialize [

	super initialize.
	creationImp := GLProgramCreationImp new.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLProgramManager >> isValidID: anInteger [

	^ GL isProgram: anInteger
]
