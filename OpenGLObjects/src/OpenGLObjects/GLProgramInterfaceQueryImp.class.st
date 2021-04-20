Class {
	#name : #GLProgramInterfaceQueryImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #inputs,
	#'squeak_changestamp' : 'stlu 12/14/2020 13:04'
}
GLProgramInterfaceQueryImp >> getInputs: aProgram [

	self subclassResponsibility
]

{
	#category : #uniforms,
	#'squeak_changestamp' : 'stlu 12/14/2020 13:04'
}
GLProgramInterfaceQueryImp >> getUniforms: aProgram [

	self subclassResponsibility
]
