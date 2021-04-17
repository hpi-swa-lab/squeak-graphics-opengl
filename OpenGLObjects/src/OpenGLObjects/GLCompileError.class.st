Class {
	#name : #GLCompileError,
	#superclass : #Error,
	#instVars : [
		'shader',
		'infoLog'
	],
	#category : #'OpenGLObjects-Errors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 10/26/2020 17:38'
}
GLCompileError class >> shader: glShader infoLog: aString [

	^ self new
		shader: glShader;
		infoLog: aString;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 17:35'
}
GLCompileError >> infoLog [

	^ infoLog
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 17:35'
}
GLCompileError >> infoLog: anObject [

	infoLog := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/27/2020 12:09'
}
GLCompileError >> messageText [

	^ messageText ifNil: [infoLog]
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 17:34'
}
GLCompileError >> shader [

	^ shader
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 17:35'
}
GLCompileError >> shader: aGLShader [

	shader := aGLShader
]
