Class {
	#name : #GLShaderImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/25/2021 23:10'
}
GLShaderImp >> createShaderID: shaderTypeEnum [

	^ GL createShader: shaderTypeEnum
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/28/2021 18:24'
}
GLShaderImp >> deleteShader: aShader [

	GL deleteShader: aShader id.
]
