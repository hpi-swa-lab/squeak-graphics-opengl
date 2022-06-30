Class {
	#name : #GLShaderManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-Shaders'
}

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:42'
}
GLShaderManager >> creationImp [

	^ creationImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:42'
}
GLShaderManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 11:48'
}
GLShaderManager >> initializeImplementorsForVersion: aVersion [

	mainImp := GLShaderImp new.
	creationImp := GLShaderImp new.
]
