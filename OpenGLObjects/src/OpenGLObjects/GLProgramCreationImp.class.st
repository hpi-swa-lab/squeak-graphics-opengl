Class {
	#name : #GLProgramCreationImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/25/2021 23:10'
}
GLProgramCreationImp >> createProgramID [

	^ GL createProgram
]
