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
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/16/2020 20:44'
}
GLProgramResource class >> allInProgram: aProgram [

	self subclassResponsibility
]

{
	#category : #querying,
	#timestamp : 'stlu 12/13/2020 14:25'
}
GLProgramResource class >> getPropertiesToQuery [

	^ { GL_NAME_LENGTH }
]

{
	#category : #querying,
	#timestamp : 'stlu 12/16/2020 18:57'
}
GLProgramResource class >> interfaceEnum [

	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : 'stlu 12/13/2020 14:10'
}
GLProgramResource class >> program: aProgram name: aString [

	^ self new
		program: aProgram;
		name: aString
]

{
	#category : #private,
	#timestamp : 'stlu 12/13/2020 14:30'
}
GLProgramResource class >> program: aProgram name: aString properties: aWordArray [

	^ (self program: aProgram name: aString)
		initializeProperties: aWordArray
]

{
	#category : #querying,
	#timestamp : 'stlu 12/13/2020 14:24'
}
GLProgramResource class >> propertiesToQuery [

	^ propertiesToQuery ifNil: [
		propertiesToQuery := self getPropertiesToQuery asWordArray]
]

{
	#category : #querying,
	#timestamp : 'stlu 4/15/2021 12:17'
}
GLProgramResource class >> queryImp [

	^ GLObjectImps current programInterfaceQuery
]

{
	#category : #initialization,
	#timestamp : 'stlu 12/13/2020 14:31'
}
GLProgramResource >> initializeProperties: aWorldArray [

	
]

{
	#category : #testing,
	#timestamp : 'stlu 12/16/2020 18:46'
}
GLProgramResource >> isInput [

	^ false
]

{
	#category : #testing,
	#timestamp : 'stlu 1/10/2021 23:00'
}
GLProgramResource >> isNull [

	^ false
]

{
	#category : #testing,
	#timestamp : 'stlu 12/16/2020 18:46'
}
GLProgramResource >> isUniform [

	^ false
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/13/2020 14:09'
}
GLProgramResource >> name [

	^ name
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> name: anObject [

	name := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/16/2020 00:27'
}
GLProgramResource >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 18:37'
}
GLProgramResource >> type [

	self subclassResponsibility
]
