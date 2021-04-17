Class {
	#name : #GLLinkError,
	#superclass : #Error,
	#instVars : [
		'program',
		'infoLog'
	],
	#category : #'OpenGLObjects-Errors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError class >> program: glProgram infoLog: aString [

	^ self new
		program: glProgram;
		infoLog: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError >> infoLog [

	^ infoLog
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError >> infoLog: anObject [

	infoLog := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError >> messageText [

	^ messageText ifNil: [infoLog]
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:51'
}
GLLinkError >> program: anObject [

	program := anObject
]
