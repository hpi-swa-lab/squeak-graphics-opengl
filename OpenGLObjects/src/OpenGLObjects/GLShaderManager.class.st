Class {
	#name : #GLShaderManager,
	#superclass : #GLObjectManager,
	#instVars : [
		'creationImp'
	],
	#category : #'OpenGLObjects-Shaders'
}

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:42'
}
GLShaderManager >> creationImp [

	^ creationImp
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:42'
}
GLShaderManager >> creationImp: anObject [

	creationImp := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/25/2021 14:35'
}
GLShaderManager >> initialize [

	super initialize.
	creationImp := GLShaderCreationImp new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:53'
}
GLShaderManager >> isValidID: anInteger [

	^ GL isShader: anInteger
]
