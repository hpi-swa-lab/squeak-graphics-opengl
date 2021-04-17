Class {
	#name : #GLUnknownProgramResource,
	#superclass : #Warning,
	#instVars : [
		'program',
		'resourceClass',
		'resourceName'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/10/2021 23:09'
}
GLUnknownProgramResource class >> program: aProgram resourceClass: aProgramResourceClass resourceName: aString [

	^ self new
		program: aProgram;
		resourceClass: aProgramResourceClass;
		resourceName: aString;
		yourself
]

{
	#category : #defaults,
	#timestamp : 'stlu 1/10/2021 22:57'
}
GLUnknownProgramResource >> defaultResumeValue [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/11/2021 00:45'
}
GLUnknownProgramResource >> messageText [

	^ messageText ifNil: [
		String streamContents: [:stream |
			stream
				print: program;
				nextPutAll: ' does not have an active variable named ''';
				nextPutAll: resourceName;
				nextPutAll: ''' of interface ';
				print: resourceClass;
				nextPutAll: '. Proceeding will cause the program to emit a dummy resource object that ignores all messages for this and all future accesses.']]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:15'
}
GLUnknownProgramResource >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:15'
}
GLUnknownProgramResource >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:09'
}
GLUnknownProgramResource >> resourceClass [

	^ resourceClass
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:09'
}
GLUnknownProgramResource >> resourceClass: anObject [

	resourceClass := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 22:36'
}
GLUnknownProgramResource >> resourceName [

	^ resourceName
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 22:36'
}
GLUnknownProgramResource >> resourceName: anObject [

	resourceName := anObject
]
