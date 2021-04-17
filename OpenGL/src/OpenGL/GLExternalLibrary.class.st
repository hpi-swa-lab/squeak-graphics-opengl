"
I dispatch calls to the actual graphics interface via FFI.

Users will not (and should not) interact with an instance of this class directly, but rather a unique subclass. Instances of such subclasses will dynamically lookup selectors in the GLRegistry and install a copy of the respective method. This ensures a unique ExternalLibraryFunction object, since some windowing system interfaces (*cough* WGL *cough*) do not guarantee the addresses of OpenGL functions to be the same for 2 different contexts of the same API. Consequently, every OpenGL context should reference an instance of a different unique subclass of this class.
"
Class {
	#name : #GLExternalLibrary,
	#superclass : #GLLibrary,
	#instVars : [
		'moduleName'
	],
	#classVars : [
		'Instances'
	],
	#category : #'OpenGL-API',
	#commentStamp : 'stlu 4/14/2021 14:43'
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/15/2021 21:58'
}
GLExternalLibrary class >> context: aContext [

	^ self
		context: aContext
		moduleName: aContext version moduleName
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/16/2021 17:03'
}
GLExternalLibrary class >> context: aContext moduleName: aString [

	^ self new
		context: aContext;
		moduleName: aString;
		yourself
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 4/15/2021 21:54'
}
GLExternalLibrary class >> initialize [

	Instances := WeakOrderedCollection new.
	Smalltalk addToShutDownList: self.
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 4/16/2021 17:05'
}
GLExternalLibrary class >> invalidateInstances [
	"Make sure everybody interacting with an OpenGL library will notice a no longer valid instance."
	| instances replacements |
	instances := Array streamContents: [:stream |
					Instances do: [:each |
						each ifNotNil: [stream nextPut: each]]].
	instances ifEmpty: [^ self].
	
	self flag: #todo. "Do we want to migrate context instances? Those can hold valuable state."
	replacements := Array new: instances size withAll: GLInvalidLibrary new.
	instances elementsForwardIdentityTo: replacements.
	Instances reset
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/16/2021 17:04'
}
GLExternalLibrary class >> new [

	^ Instances add: (self newSubclass basicNew initialize; yourself)
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 4/15/2021 22:06'
}
GLExternalLibrary class >> shutDown: quitting [

	self flag: #todo. "needs to happen after all shutdowns using the library"
	quitting ifTrue: [
		self invalidateInstances]
]

{
	#category : #'dynamic lookup',
	#timestamp : 'stlu 4/14/2021 17:35'
}
GLExternalLibrary >> doesNotUnderstand: aMessage [

	(self install: aMessage selector) ifNotNil: [
		^ aMessage sendTo: self].
	
	self flag: #todo. "better feedback / error handling when dynamic lookup fails"
	^ super doesNotUnderstand: aMessage
]

{
	#category : #'dynamic lookup',
	#timestamp : 'stlu 4/15/2021 11:25'
}
GLExternalLibrary >> install: aSelector [

	| registryMethod copiedMethod |
	registryMethod := GLRegistry compiledMethodAt: aSelector ifAbsent: [^ nil].
	copiedMethod := registryMethod shallowCopy.
	
	"assumption: commands have external functions, enums don't"
	registryMethod externalLibraryFunction ifNotNil: [:func |
		| functionAddress copiedFunc |
		functionAddress := (self context resolveFunctionAddress: func name asString) ifNil: [^ nil].
		
		copiedFunc := func shallowCopy.
		copiedFunc setModule: self moduleName.
		copiedFunc setHandle: functionAddress.
		copiedMethod literalAt: 1 put: copiedFunc].
	
	self class basicAddSelector: aSelector withMethod: copiedMethod.
	^ copiedMethod
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/14/2021 12:41'
}
GLExternalLibrary >> moduleName [

	^ moduleName
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/14/2021 12:41'
}
GLExternalLibrary >> moduleName: anObject [

	moduleName := anObject
]
