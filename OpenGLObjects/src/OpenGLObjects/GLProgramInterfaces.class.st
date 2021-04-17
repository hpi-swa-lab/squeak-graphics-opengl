Class {
	#name : #GLProgramInterfaces,
	#superclass : #Object,
	#instVars : [
		'program',
		'uniforms',
		'inputs'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/13/2020 15:28'
}
GLProgramInterfaces class >> program: aProgram [

	^ self new
		initializeWithProgram: aProgram;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:43'
}
GLProgramInterfaces >> atomicCounterBuffers [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:45'
}
GLProgramInterfaces >> bufferVariables [

	self notYetImplemented
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/10/2021 23:07'
}
GLProgramInterfaces >> initializeWithProgram: aProgram [

	program := aProgram.
	uniforms := GLProgramInterface program: program resourceClass: GLUniform.
	inputs := GLProgramInterface program: program resourceClass: GLProgramInput
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:42'
}
GLProgramInterfaces >> inputs [

	^ inputs
]

{
	#category : #initialization,
	#timestamp : 'zagto 1/5/2021 17:38'
}
GLProgramInterfaces >> migrateResourcesFrom: another [

	uniforms migrateResourcesFrom: another uniforms
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/13/2020 14:57'
}
GLProgramInterfaces >> outputs [

	self notYetImplemented
]

{
	#category : #printing,
	#timestamp : 'stlu 12/13/2020 15:48'
}
GLProgramInterfaces >> printOn: aStream [

	super printOn: aStream
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:42'
}
GLProgramInterfaces >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:45'
}
GLProgramInterfaces >> shaderStorageBlocks [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:43'
}
GLProgramInterfaces >> subroutineUniforms [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:43'
}
GLProgramInterfaces >> subroutines [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:45'
}
GLProgramInterfaces >> transformFeedbackBuffers [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:44'
}
GLProgramInterfaces >> transformFeedbackVaryings [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:43'
}
GLProgramInterfaces >> uniformBlocks [

	self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 19:42'
}
GLProgramInterfaces >> uniforms [

	^ uniforms
]
