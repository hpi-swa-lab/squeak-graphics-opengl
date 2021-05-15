Class {
	#name : #GLContext,
	#superclass : #Object,
	#instVars : [
		'library',
		'version',
		'extensions',
		'userData',
		'isDestroyed',
		'objectState'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Core'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 10/26/2020 10:19'
}
GLContext class >> initialize [

	Smalltalk addToShutDownList: self.
	Smalltalk addToStartUpList: self
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 11/13/2020 14:17'
}
GLContext class >> shutDown: quitting [

	self flag: #todo. "Disabled for now. Not 100% necessary, mostly best practice."
	"quitting ifTrue: [
		self allSubInstancesDo: [:each |
			each destroy]]"
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 12/15/2020 13:59'
}
GLContext class >> startUp: resuming [

	self flag: #todo. "isDestroyed and isSymbol can both indicate destroyed contexts"
	resuming ifTrue: [
		self allSubInstancesDo: [:each |
			"Replace existing contexts on startUp not shutDown to allow saving the image while contexts are active."
			each becomeForward: #DestroyedGLContext]]
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLContext >> activate [

	self subclassResponsibility
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLContext >> deactivate [

	self subclassResponsibility
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 4/15/2021 12:38'
}
GLContext >> destroy [

	self flag: #todo. "objectStore do: [:each | each cleanUp]"
	isDestroyed := true
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 10/16/2020 12:25'
}
GLContext >> endFrame [

	self flag: #todo. "Not sure this belongs here"
	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/9/2020 14:51'
}
GLContext >> extensions [

	^ extensions
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 5/15/2021 16:50'
}
GLContext >> initialize [

	isDestroyed := false.
	userData := Dictionary new.
	self initializeVersion.
	self initializeLibrary.
	self initializeExtensions.
	
	self supportsGLObjects ifTrue: [
		library makeCurrentDuring: [
			objectState := GLObjectState context: self]]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 4/16/2021 13:00'
}
GLContext >> initializeExtensions [

	library makeCurrentDuring: [
		extensions := library extensions]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 4/16/2021 13:01'
}
GLContext >> initializeLibrary [

	library := GLExternalLibrary context: self.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 4/16/2021 13:02'
}
GLContext >> initializeVersion [

	self subclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/8/2020 16:15'
}
GLContext >> isDestroyed [

	^ isDestroyed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/3/2020 18:31'
}
GLContext >> library [

	^ library
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 14:21'
}
GLContext >> objectState [

	^ objectState
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 4/14/2021 17:04'
}
GLContext >> resolveFunctionAddress: functionName [

	self subclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/16/2020 12:23'
}
GLContext >> shouldClose [

	self flag: #todo. "This does not belong here"
	self subclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 4/20/2021 12:32'
}
GLContext >> supportsGLObjects [

	self flag: #todo. "Is there a more robust way to determine this?"
	^ self environment hasClassNamed: #GLObject
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 10/16/2020 12:24'
}
GLContext >> swapBuffers [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/3/2020 18:57'
}
GLContext >> userData [

	^ userData
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/9/2020 14:51'
}
GLContext >> version [

	^ version
]
