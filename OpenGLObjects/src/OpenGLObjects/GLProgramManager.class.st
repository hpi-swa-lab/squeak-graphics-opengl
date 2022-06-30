Class {
	#name : #GLProgramManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'currentProgram',
		'staticPrograms',
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
	#'squeak_changestamp' : 'stlu 6/20/2022 11:49'
}
GLProgramManager >> initializeForContext: aContext [

	super initializeForContext: aContext.
	staticPrograms := IdentityDictionary new.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 11:48'
}
GLProgramManager >> initializeImplementorsForVersion: aVersion [

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
