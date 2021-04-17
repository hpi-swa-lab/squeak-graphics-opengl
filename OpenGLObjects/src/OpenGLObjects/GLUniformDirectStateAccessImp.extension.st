Extension { #name : #GLUniformDirectStateAccessImp }

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:47'
}
GLUniformDirectStateAccessImp class >> arraySetterTemplate [

	^ 'set: aUniform to{1}Component{4}Array: {2} count: numElements

	GL
		programUniform{1}{3}v: aUniform program id
		with: aUniform location
		with: numElements
		with: {2}'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:48'
}
GLUniformDirectStateAccessImp class >> matrixSetterTemplate [

	^ 'set: aUniform to{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	GL
		programUniformMatrix{5}{6}v: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: {4}'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:49'
}
GLUniformDirectStateAccessImp class >> scalarSetterTemplate [

	^ 'set: aUniform to{1}: {2}

	GL
		programUniform{3}{4}: aUniform program id
		with: aUniform location
		with: {5}'
]
