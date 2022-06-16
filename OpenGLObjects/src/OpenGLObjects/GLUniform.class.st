Class {
	#name : #GLUniform,
	#superclass : #GLProgramResource,
	#instVars : [
		'location',
		'type',
		'value',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:34'
}
GLUniform class >> allInProgram: aProgram [

	^ aProgram manager interfaceQueryImp getProgramUniforms: aProgram
]

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
	#category : #querying,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:26'
}
GLUniform class >> getPropertiesToQuery [

	^ {
		GL_NAME_LENGTH .
		GL_LOCATION .
		GL_TYPE .
		GL_ARRAY_SIZE .
	}
]

{
	#category : #querying,
	#'squeak_changestamp' : 'stlu 12/16/2020 18:54'
}
GLUniform class >> interfaceEnum [

	^ GL_UNIFORM
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

{
	#category : #getting,
	#'squeak_changestamp' : 'stlu 12/16/2020 19:38'
}
GLUniform >> getValue [

	self notYetImplemented
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/14/2020 16:17'
}
GLUniform >> initializeProperties: aWordArray [

	location := aWordArray second.
	type := GLSLType numElements: aWordArray fourth enum: aWordArray third
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/16/2020 18:45'
}
GLUniform >> isUniform [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/13/2020 14:33'
}
GLUniform >> location [

	^ location
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 1/10/2021 12:43'
}
GLUniform >> printOn: aStream [

	aStream
		print: location;
		nextPutAll: ': uniform '.
	type printDeclarationNamed: name on: aStream
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo1ComponentDoubleArray: aFloat64Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to1ComponentDoubleArray: aFloat64Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo1ComponentFloatArray: aFloat32Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to1ComponentFloatArray: aFloat32Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo1ComponentIntegerArray: anIntegerArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to1ComponentIntegerArray: anIntegerArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to1ComponentUnsignedIntegerArray: aWordArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo2ComponentDoubleArray: aFloat64Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to2ComponentDoubleArray: aFloat64Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo2ComponentFloatArray: aFloat32Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to2ComponentFloatArray: aFloat32Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo2ComponentIntegerArray: anIntegerArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to2ComponentIntegerArray: anIntegerArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to2ComponentUnsignedIntegerArray: aWordArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo3ComponentDoubleArray: aFloat64Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to3ComponentDoubleArray: aFloat64Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo3ComponentFloatArray: aFloat32Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to3ComponentFloatArray: aFloat32Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo3ComponentIntegerArray: anIntegerArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to3ComponentIntegerArray: anIntegerArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to3ComponentUnsignedIntegerArray: aWordArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo4ComponentDoubleArray: aFloat64Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to4ComponentDoubleArray: aFloat64Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo4ComponentFloatArray: aFloat32Array count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to4ComponentFloatArray: aFloat32Array
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo4ComponentIntegerArray: anIntegerArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to4ComponentIntegerArray: anIntegerArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setTo4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	program manager uniformSetterImp
		setUniform: self
		to4ComponentUnsignedIntegerArray: aWordArray
		count: numElements.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:04'
}
GLUniform >> setTo: anObject [

	anObject setAsValueOfUniform: self
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:04'
}
GLUniform >> setToArray: aRawBitsArray [

	type setUniform: self toArray: aRawBitsArray
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:04'
}
GLUniform >> setToArray: aRawBitsArray count: numElements [ 

	type setUniform: self toArray: aRawBitsArray count: numElements
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDouble: aDouble [

	program manager uniformSetterImp
		setUniform: self
		toDouble: aDouble.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices2x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices2x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices2x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices3x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices3x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices3x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices4x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices4x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toDoubleMatrices4x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubles: double1 _: double2 [

	program manager uniformSetterImp
		setUniform: self
		toDoubles: double1 _: double2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubles: double1 _: double2 _: double3 [

	program manager uniformSetterImp
		setUniform: self
		toDoubles: double1 _: double2 _: double3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToDoubles: double1 _: double2 _: double3 _: double4 [

	program manager uniformSetterImp
		setUniform: self
		toDoubles: double1 _: double2 _: double3 _: double4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloat: aFloat [

	program manager uniformSetterImp
		setUniform: self
		toFloat: aFloat.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices2x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices2x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices2x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices3x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices3x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices3x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices4x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices4x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	program manager uniformSetterImp
		setUniform: self
		toFloatMatrices4x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloats: float1 _: float2 [

	program manager uniformSetterImp
		setUniform: self
		toFloats: float1 _: float2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloats: float1 _: float2 _: float3 [

	program manager uniformSetterImp
		setUniform: self
		toFloats: float1 _: float2 _: float3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToFloats: float1 _: float2 _: float3 _: float4 [

	program manager uniformSetterImp
		setUniform: self
		toFloats: float1 _: float2 _: float3 _: float4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToInteger: anInteger [

	program manager uniformSetterImp
		setUniform: self
		toInteger: anInteger.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToIntegers: int1 _: int2 [

	program manager uniformSetterImp
		setUniform: self
		toIntegers: int1 _: int2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToIntegers: int1 _: int2 _: int3 [

	program manager uniformSetterImp
		setUniform: self
		toIntegers: int1 _: int2 _: int3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToIntegers: int1 _: int2 _: int3 _: int4 [

	program manager uniformSetterImp
		setUniform: self
		toIntegers: int1 _: int2 _: int3 _: int4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:05'
}
GLUniform >> setToObject: anObject [

	type setUniform: self toObject: anObject
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToUnsignedInteger: anUnsignedInteger [

	program manager uniformSetterImp
		setUniform: self
		toUnsignedInteger: anUnsignedInteger.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 [

	program manager uniformSetterImp
		setUniform: self
		toUnsignedIntegers: uint1 _: uint2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 _: uint3 [

	program manager uniformSetterImp
		setUniform: self
		toUnsignedIntegers: uint1 _: uint2 _: uint3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:46'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	program manager uniformSetterImp
		setUniform: self
		toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/16/2020 00:39'
}
GLUniform >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/16/2020 19:48'
}
GLUniform >> value [

	^ value
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/16/2020 19:39'
}
GLUniform >> value: anObject [

	self setTo: anObject.
	value := anObject
]
