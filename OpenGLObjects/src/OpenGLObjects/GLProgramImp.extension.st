Extension { #name : #GLProgramImp }

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:43'
}
GLProgramImp class >> templateForArraySetter [

	^ 'setUniform: aUniform to{1}Component{4}Array: {2} count: numElements

	aUniform program boundDuring: [
		GL
			uniform{1}{3}v: aUniform location
			with: numElements
			with: {2}].'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:44'
}
GLProgramImp class >> templateForMatrixSetter [

	^ 'setUniform: aUniform to{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	aUniform program boundDuring: [
		GL
			uniformMatrix{5}{6}v: aUniform location
			with: numMatrices
			with: isRowMajor
			with: {4}].'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:44'
}
GLProgramImp class >> templateForScalarSetter [

	^ 'setUniform: aUniform to{1}: {2}

	aUniform program boundDuring: [
		GL
			uniform{3}{4}: aUniform location
			with: {5}].'
]
