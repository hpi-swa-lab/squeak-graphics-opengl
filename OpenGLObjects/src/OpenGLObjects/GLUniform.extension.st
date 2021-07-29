Extension { #name : #GLUniform }

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:33'
}
GLUniform class >> generateArraySetterInterfaceFor: aClass classified: categorySymbol [

	{ GLSLFloat . GLSLDouble . GLSLInteger . GLSLUnsignedInteger } do: [:type |
		1 to: 4 do: [:numComponents |
			| code |
			code := aClass templateForArraySetter format: {
						numComponents.
						type squeakArrayClass name asParameterName.
						type commandInitials.
						type squeakName }.
			aClass compile: code classified: categorySymbol]].
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:33'
}
GLUniform class >> generateMatrixSetterInterfaceFor: aClass classified: categorySymbol [

	GLSLMatrix allSubclassesDo: [:type |
		| code  |
		code := aClass templateForMatrixSetter format: {
					type componentType squeakName.
					type numColumns.
					type numRows.
					type componentType squeakArrayClass name asParameterName.
					'' , type numColumns , (type numColumns = type numRows ifTrue: [''] ifFalse: ['x' , type numRows]).
					type componentType commandInitials }.
		aClass compile: code classified: categorySymbol]
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:34'
}
GLUniform class >> generateScalarSetterInterfaceFor: aClass classified: categorySymbol [

	{ GLSLFloat . GLSLDouble . GLSLInteger . GLSLUnsignedInteger } do: [:type |
		| code paramName |
		paramName := type squeakName asParameterName.
		code := aClass templateForScalarSetter format: {
					type squeakName. "e.g. 'UnsignedInteger'"
					paramName. "e.g. anUnsignedInteger"
					'1'.
					type commandInitials.
					paramName }.
		aClass compile: code classified: categorySymbol.
			
		2 to: 4 do: [:numComponents |
			| vars |
			vars := (1 to: numComponents) collect: [:i | type declarator , i].
			code := aClass templateForScalarSetter format: {
						type squeakName , 's'.
						vars joinSeparatedBy: ' _: '.
						numComponents.
						type commandInitials.
						vars joinSeparatedBy: ' with: '.}.
			aClass compile: code classified: categorySymbol]].
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:39'
}
GLUniform class >> generateSetterInferface [

	self generateSetterInterfaceFor: self.
	self generateSetterInterfaceFor: GLProgramImp.
	self generateSetterInterfaceFor: GLSeparateShaderObjectsImp.
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:58'
}
GLUniform class >> generateSetterInterfaceFor: aClass [

	self generateArraySetterInterfaceFor: aClass classified: #'uniform setters'.
	self generateMatrixSetterInterfaceFor: aClass classified: #'uniform setters'.
	self generateScalarSetterInterfaceFor: aClass classified: #'uniform setters'.
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:52'
}
GLUniform class >> generateVectorTypeDoubleDispatch [

	self flag: #todo. "idk what state this code is in"
	GLSLVector allSubclassesDo: [:type |
		| code |
		code := 'setUniform: aUniform toArray: aRawBitsArray count: numElements

	aUniform setTo{1}Component{2}Array: aRawBitsArray count: numElements.' format: {
			type numComponents.
			type actualComponentType squeakName }.
		type compile: code classified: #'program resources']
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:32'
}
GLUniform class >> templateForArraySetter [

	^ 'setTo{1}Component{4}Array: {2} count: numElements

	program manager uniformSetterImp
		setUniform: self
		to{1}Component{4}Array: {2}
		count: numElements.'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:32'
}
GLUniform class >> templateForMatrixSetter [

	^ 'setTo{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	program manager uniformSetterImp
		setUniform: self
		to{1}Matrices{2}x{3}: {4}
		count: numMatrices
		transpose: isRowMajor.'
]

{
	#category : #'*OpenGLObjects-Generation-uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:31'
}
GLUniform class >> templateForScalarSetter [

	^ 'setTo{1}: {2}

	program manager uniformSetterImp
		setUniform: self
		to{1}: {2}.'
]
