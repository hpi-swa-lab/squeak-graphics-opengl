Class {
	#name : #GLCompileError,
	#superclass : #Error,
	#instVars : [
		'shader',
		'infoLog'
	],
	#category : #'OpenGLObjects-Errors'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 10/26/2020 17:38'
}
GLCompileError class >> shader: glShader infoLog: aString [

	^ self new
		shader: glShader;
		infoLog: aString;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 17:35'
}
GLCompileError >> infoLog [

	^ infoLog
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 17:35'
}
GLCompileError >> infoLog: anObject [

	infoLog := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/27/2020 12:09'
}
GLCompileError >> messageText [

	^ messageText ifNil: [infoLog]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 17:34'
}
GLCompileError >> shader [

	^ shader
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 17:35'
}
GLCompileError >> shader: aGLShader [

	shader := aGLShader
]
