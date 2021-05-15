Class {
	#name : #GLProgramResource,
	#superclass : #Object,
	#instVars : [
		'program',
		'name'
	],
	#pools : [
		'GLConstants'
	],
	#classInstVars : [
		'queryProperties',
		'propertiesToQuery'
	],
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/16/2020 20:44'
}
GLProgramResource class >> allInProgram: aProgram [

	self subclassResponsibility
]

{
	#category : #querying,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:25'
}
GLProgramResource class >> getPropertiesToQuery [

	^ { GL_NAME_LENGTH }
]

{
	#category : #querying,
	#'squeak_changestamp' : 'stlu 12/16/2020 18:57'
}
GLProgramResource class >> interfaceEnum [

	self subclassResponsibility
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:10'
}
GLProgramResource class >> program: aProgram name: aString [

	^ self new
		program: aProgram;
		name: aString
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:30'
}
GLProgramResource class >> program: aProgram name: aString properties: aWordArray [

	^ (self program: aProgram name: aString)
		initializeProperties: aWordArray
]

{
	#category : #querying,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:24'
}
GLProgramResource class >> propertiesToQuery [

	^ propertiesToQuery ifNil: [
		propertiesToQuery := self getPropertiesToQuery asWordArray]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:31'
}
GLProgramResource >> initializeProperties: aWorldArray [

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/16/2020 18:46'
}
GLProgramResource >> isInput [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 1/10/2021 23:00'
}
GLProgramResource >> isNull [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/16/2020 18:46'
}
GLProgramResource >> isUniform [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:09'
}
GLProgramResource >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> name: anObject [

	name := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> program [

	^ program
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 18:37'
}
GLProgramResource >> type [

	self subclassResponsibility
]
