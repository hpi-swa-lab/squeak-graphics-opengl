Extension { #name : #GLUniformStateAccessImp }

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:47'
}
GLUniformStateAccessImp class >> arraySetterTemplate [

	^ 'set: aUniform to{1}Component{4}Array: {2} count: numElements

	self subclassResponsibility'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 14:09'
}
GLUniformStateAccessImp class >> generate [

	self generateArrayInterfaceFor: self classified: #'setting - arrays'.
	self generateMatrixInterfaceFor: self classified: #'setting - matrices'.
	self generateScalarInterfaceFor: self classified: #'setting - scalars'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 16:57'
}
GLUniformStateAccessImp class >> generateArrayInterfaceFor: aClass classified: categorySymbol [

	{ GLSLFloat . GLSLDouble . GLSLInteger . GLSLUnsignedInteger } do: [:type |
		1 to: 4 do: [:numComponents |
			| code |
			code := aClass arraySetterTemplate format: {
						numComponents.
						type squeakArrayClass name asParameterName.
						type commandInitials.
						type squeakName }.
			aClass compile: code classified: categorySymbol]].
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 16:19'
}
GLUniformStateAccessImp class >> generateMatrixInterfaceFor: aClass classified: categorySymbol [

	GLSLMatrix allSubclassesDo: [:type |
		| code  |
		code := aClass matrixSetterTemplate format: {
					type componentType squeakName.
					type numColumns.
					type numRows.
					type componentType squeakArrayClass name asParameterName.
					'' , type numColumns , (type numColumns = type numRows ifTrue: [''] ifFalse: ['x' , type numRows]).
					type componentType commandInitials }.
		aClass compile: code classified: categorySymbol]
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 16:57'
}
GLUniformStateAccessImp class >> generateScalarInterfaceFor: aClass classified: categorySymbol [

	{ GLSLFloat . GLSLDouble . GLSLInteger . GLSLUnsignedInteger } do: [:type |
		| code paramName |
		paramName := type squeakName asParameterName.
		code := aClass scalarSetterTemplate format: {
					type squeakName. "e.g. 'UnsignedInteger'"
					paramName. "e.g. anUnsignedInteger"
					'1'.
					type commandInitials.
					paramName }.
		aClass compile: code classified: categorySymbol.
			
		2 to: 4 do: [:numComponents |
			| vars |
			vars := (1 to: numComponents) collect: [:i | type declarator , i].
			code := aClass scalarSetterTemplate format: {
						type squeakName , 's'.
						vars joinSeparatedBy: ' _: '.
						numComponents.
						type commandInitials.
						vars joinSeparatedBy: ' with: '.}.
			aClass compile: code classified: categorySymbol]].
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 17:48'
}
GLUniformStateAccessImp class >> generateTypeDoubleDispatch [

	
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 16:22'
}
GLUniformStateAccessImp class >> generateVectorTypeDoubleDispatch [

	GLSLVector allSubclassesDo: [:type |
		| code |
		code := 'setUniform: aUniform toArray: aRawBitsArray count: numElements

	aUniform setTo{1}Component{2}Array: aRawBitsArray count: numElements' format: {
			type numComponents.
			type actualComponentType squeakName }.
		type compile: code classified: #'program resources']
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:48'
}
GLUniformStateAccessImp class >> matrixSetterTemplate [

	^ 'set: aUniform to{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	self subclassResponsibility'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 15:49'
}
GLUniformStateAccessImp class >> scalarSetterTemplate [

	^ 'set: aUniform to{1}: {2}

	self subclassResponsibility'
]
