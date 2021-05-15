Class {
	#name : #GLProgramManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'currentProgram',
		'creationImp',
		'uniformSetterImp',
		'interfaceQueryImp'
	],
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:48'
}
GLProgramManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:48'
}
GLProgramManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:49'
}
GLProgramManager >> currentProgram [

	^ currentProgram
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:49'
}
GLProgramManager >> currentProgram: anObject [

	currentProgram := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:57'
}
GLProgramManager >> initialize [

	super initialize.
	creationImp := GLProgramCreationImp new.
	interfaceQueryImp := GLDirectProgramInterfaceQueryImp new.
	uniformSetterImp := GLUniformDirectStateAccessImp new.
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:48'
}
GLProgramManager >> interfaceQueryImp [

	^ interfaceQueryImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:48'
}
GLProgramManager >> interfaceQueryImp: anObject [

	interfaceQueryImp := anObject
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:52'
}
GLProgramManager >> isValidID: anInteger [

	^ GL isProgram: anInteger
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:58'
}
GLProgramManager >> uniformSetterImp [

	^ uniformSetterImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:58'
}
GLProgramManager >> uniformSetterImp: anObject [

	uniformSetterImp := anObject
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:53'
}
GLProgramManager >> useProgram: programOrNil [

	GL useProgram: (programOrNil ifNil: [0] ifNotNil: [programOrNil id]).
	currentProgram := programOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:15'
}
GLProgramManager >> useProgram: programOrNil during: aBlock [

	| previous |
	currentProgram == programOrNil ifTrue: [^ aBlock value].
	previous := currentProgram.
	self useProgram: programOrNil.
	^ aBlock ensure: [
		self useProgram: previous]
]
