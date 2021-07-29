Class {
	#name : #GLShaderCreationImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 4/25/2021 23:10'
}
GLShaderCreationImp >> createShaderID: shaderTypeEnum [

	^ GL createShader: shaderTypeEnum
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 7/28/2021 18:24'
}
GLShaderCreationImp >> deleteShader: aShader [

	GL deleteShader: aShader id.
]
