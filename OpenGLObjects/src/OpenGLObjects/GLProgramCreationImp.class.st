Class {
	#name : #GLProgramCreationImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/25/2021 23:10'
}
GLProgramCreationImp >> createProgramID [

	^ GL createProgram
]