Class {
	#name : #GLProgramInterface,
	#superclass : #Object,
	#instVars : [
		'variables',
		'nameToVariable',
		'program',
		'resourceClass'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/10/2021 23:07'
}
GLProgramInterface class >> program: aProgram resourceClass: aProgramResourceClass [

	^ self new
		initializeWithProgram: aProgram resourceClass: aProgramResourceClass;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 11:03'
}
GLProgramInterface >> atIndex: index [

	^ variables at: index + 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 22:59'
}
GLProgramInterface >> atName: aString [

	^ self
		atName: aString
		ifAbsent: [
			(self errorUnknownResourceName: aString) ifNotNil: [
				self ignoreName: aString]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 18:27'
}
GLProgramInterface >> atName: aString ifAbsent: aBlock [

	^ nameToVariable at: aString ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 18:28'
}
GLProgramInterface >> atName: aString ifPresent: aBlock [

	| v |
	v := self atName: aString ifAbsent: [^ nil].
	^ aBlock value: v
]

{
	#category : #'error handling',
	#timestamp : 'stlu 12/16/2020 21:16'
}
GLProgramInterface >> doesNotUnderstand: aMessage [

	aMessage numArgs = 0 ifTrue: [
		^ self atName: aMessage selector].
	(aMessage numArgs = 1 and: [aMessage selector isBinary not]) ifTrue: [
		(self atName: aMessage selector allButLast) value: aMessage argument.
		^ self].
	^ super doesNotUnderstand: aMessage
]

{
	#category : #'error handling',
	#timestamp : 'stlu 1/10/2021 23:10'
}
GLProgramInterface >> errorUnknownResourceName: aString [

	^ (GLUnknownProgramResource
		program: program
		resourceClass: resourceClass
		resourceName: aString) signal
]

{
	#category : #'error handling',
	#timestamp : 'stlu 3/19/2021 14:02'
}
GLProgramInterface >> ignoreName: aString [

	^ nameToVariable
		at: aString
		put: (GLNullProgramResource
				program: program
				name: aString
				resourceClass: resourceClass)
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/11/2021 00:10'
}
GLProgramInterface >> ignoredVariables [

	^ nameToVariable select: [:variable |
		variable isNull]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/10/2021 23:07'
}
GLProgramInterface >> initializeWithProgram: aProgram resourceClass: aProgramResourceClass [

	program := aProgram.
	resourceClass := aProgramResourceClass.
	
	variables := resourceClass allInProgram: program.
	nameToVariable := Dictionary new: variables size.
	variables do: [:var |
		nameToVariable at: var name put: var.
		var type isArray ifTrue: [
			| shortName |
			shortName := var name copyUpTo: $[.
			nameToVariable at: shortName put: var]]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/11/2021 00:10'
}
GLProgramInterface >> migrateResourcesFrom: another [

	variables do: [:variable |
		another atName: variable name ifPresent: [:other |
			other isNull ifFalse: [
				variable value: other value]]].
	another ignoredVariables do: [:variable |
		variable isNull ifTrue: [
			nameToVariable
				at: variable name
				ifAbsentPut: [variable]]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:06'
}
GLProgramInterface >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:05'
}
GLProgramInterface >> resourceClass [

	^ resourceClass
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:06'
}
GLProgramInterface >> variables [

	^ variables
]
