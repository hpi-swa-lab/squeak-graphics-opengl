Class {
	#name : #GLUniformStateAccessImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

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

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to1ComponentDoubleArray: aFloat64Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to1ComponentFloatArray: aFloat32Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to1ComponentIntegerArray: anIntegerArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to2ComponentDoubleArray: aFloat64Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to2ComponentFloatArray: aFloat32Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to2ComponentIntegerArray: anIntegerArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to3ComponentDoubleArray: aFloat64Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to3ComponentFloatArray: aFloat32Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to3ComponentIntegerArray: anIntegerArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to4ComponentDoubleArray: aFloat64Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to4ComponentFloatArray: aFloat32Array count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to4ComponentIntegerArray: anIntegerArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform to4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDouble: aDouble [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubles: double1 _: double2 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubles: double1 _: double2 _: double3 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toDoubles: double1 _: double2 _: double3 _: double4 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloat: aFloat [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloats: float1 _: float2 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloats: float1 _: float2 _: float3 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toFloats: float1 _: float2 _: float3 _: float4 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toInteger: anInteger [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toIntegers: int1 _: int2 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toIntegers: int1 _: int2 _: int3 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toIntegers: int1 _: int2 _: int3 _: int4 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toUnsignedInteger: anUnsignedInteger [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 [

	self subclassResponsibility
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	self subclassResponsibility
]
