Extension { #name : #GLUniform }

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 5/15/2021 13:59'
}
GLUniform class >> arraySetterTemplate [

	^ 'setTo{1}Component{4}Array: {2} count: numElements

	program manager uniformSetterImp
		set: self
		to{1}Component{4}Array: {2}
		count: numElements'
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 12/14/2020 14:06'
}
GLUniform class >> generateSetterInferface [

	GLUniformStateAccessImp generateArrayInterfaceFor: self classified: #'setting - arrays'.
	GLUniformStateAccessImp generateMatrixInterfaceFor: self classified: #'setting - matrices'.
	GLUniformStateAccessImp generateScalarInterfaceFor: self classified: #'setting - scalars'
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 5/15/2021 13:58'
}
GLUniform class >> matrixSetterTemplate [

	^ 'setTo{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	program manager uniformSetterImp
		set: self
		to{1}Matrices{2}x{3}: {4}
		count: numMatrices
		transpose: isRowMajor'
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 5/15/2021 13:59'
}
GLUniform class >> scalarSetterTemplate [

	^ 'setTo{1}: {2}

	program manager uniformSetterImp
		set: self
		to{1}: {2}'
]
