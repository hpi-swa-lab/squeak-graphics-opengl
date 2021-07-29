Extension { #name : #GLSeparateShaderObjectsImp }

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:42'
}
GLSeparateShaderObjectsImp class >> templateForArraySetter [

	^ 'setUniform: aUniform to{1}Component{4}Array: {2} count: numElements

	GL
		programUniform{1}{3}v: aUniform program id
		with: aUniform location
		with: numElements
		with: {2}.'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:42'
}
GLSeparateShaderObjectsImp class >> templateForMatrixSetter [

	^ 'setUniform: aUniform to{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	GL
		programUniformMatrix{5}{6}v: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: {4}.'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:42'
}
GLSeparateShaderObjectsImp class >> templateForScalarSetter [

	^ 'setUniform: aUniform to{1}: {2}

	GL
		programUniform{3}{4}: aUniform program id
		with: aUniform location
		with: {5}.'
]
