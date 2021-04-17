Extension { #name : #GLUniformLegacyStateAccessImp }

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:47'
}
GLUniformLegacyStateAccessImp class >> arraySetterTemplate [

	^ 'set: aUniform to{1}Component{4}Array: {2} count: numElements

	aUniform program boundDuring: [
		GL
			uniform{1}{3}v: aUniform location
			with: numElements
			with: {2}]'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:48'
}
GLUniformLegacyStateAccessImp class >> matrixSetterTemplate [

	^ 'set: aUniform to{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	aUniform program boundDuring: [
		GL
			uniformMatrix{5}{6}v: aUniform location
			with: numMatrices
			with: isRowMajor
			with: {4}]'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:49'
}
GLUniformLegacyStateAccessImp class >> scalarSetterTemplate [

	^ 'set: aUniform to{1}: {2}

	aUniform program boundDuring: [
		GL
			uniform{3}{4}: aUniform location
			with: {5}]'
]
