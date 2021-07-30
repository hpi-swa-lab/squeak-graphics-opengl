Class {
	#name : #GLProgramManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'currentProgram',
		'staticPrograms',
		'mainImp',
		'creationImp',
		'uniformSetterImp',
		'interfaceQueryImp'
	],
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:16'
}
GLProgramManager >> creationImp [

	^ mainImp
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:49'
}
GLProgramManager >> currentProgram [

	^ currentProgram
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:16'
}
GLProgramManager >> initialize [

	super initialize.
	staticPrograms := IdentityDictionary new.
	
	mainImp := GLProgramImp new.
	interfaceQueryImp := GLSeparateShaderObjectsImp new.
	uniformSetterImp := GLSeparateShaderObjectsImp new.
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:48'
}
GLProgramManager >> interfaceQueryImp [

	^ interfaceQueryImp
]

{
	#category : #implementors,
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
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:47'
}
GLProgramManager >> staticPrograms [

	^ staticPrograms
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:58'
}
GLProgramManager >> uniformSetterImp [

	^ uniformSetterImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:58'
}
GLProgramManager >> uniformSetterImp: anObject [

	uniformSetterImp := anObject
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:19'
}
GLProgramManager >> useProgram: programOrNil [

	currentProgram == programOrNil ifTrue: [^ self].
	
	mainImp useProgram: programOrNil.
	
	currentProgram := programOrNil.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:19'
}
GLProgramManager >> useProgram: programOrNil during: aBlock [

	| previous |
	previous := currentProgram.
	self useProgram: programOrNil.
	^ aBlock ensure: [
		self useProgram: previous]
]
