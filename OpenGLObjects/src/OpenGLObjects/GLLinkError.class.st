Class {
	#name : #GLLinkError,
	#superclass : #Error,
	#instVars : [
		'program',
		'infoLog'
	],
	#category : #'OpenGLObjects-Errors',
	#'squeak_changestamp' : ''
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError class >> program: glProgram infoLog: aString [

	^ self new
		program: glProgram;
		infoLog: aString;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError >> infoLog [

	^ infoLog
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError >> infoLog: anObject [

	infoLog := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError >> messageText [

	^ messageText ifNil: [infoLog]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError >> program [

	^ program
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:51'
}
GLLinkError >> program: anObject [

	program := anObject
]
