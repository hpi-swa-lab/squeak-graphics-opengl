Class {
	#name : #GLUniform,
	#superclass : #GLProgramResource,
	#instVars : [
		'location',
		'type',
		'value',
		'stateAccessImp'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/16/2020 20:46'
}
GLUniform class >> allInProgram: aProgram [

	^ self queryImp getUniforms: aProgram
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> arraySetterTemplate [

	^ 'setTo{1}Component{4}Array: {2} count: numElements

	stateAccessImp set: self to{1}Component{4}Array: {2} count: numElements'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 14:06'
}
GLUniform class >> generateSetterInferface [

	GLUniformStateAccessImp generateArrayInterfaceFor: self classified: #'setting - arrays'.
	GLUniformStateAccessImp generateMatrixInterfaceFor: self classified: #'setting - matrices'.
	GLUniformStateAccessImp generateScalarInterfaceFor: self classified: #'setting - scalars'
]

{
	#category : #querying,
	#timestamp : 'stlu 12/13/2020 14:26'
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
	#timestamp : 'stlu 12/16/2020 18:54'
}
GLUniform class >> interfaceEnum [

	^ GL_UNIFORM
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> matrixSetterTemplate [

	^ 'setTo{1}Matrices{2}x{3}: {4} count: numMatrices transpose: isRowMajor

	stateAccessImp
		set: self
		to{1}Matrices{2}x{3}: {4}
		count: numMatrices
		transpose: isRowMajor'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/14/2020 14:22'
}
GLUniform class >> scalarSetterTemplate [

	^ 'setTo{1}: {2}

	stateAccessImp set: self to{1}: {2}'
]

{
	#category : #getting,
	#timestamp : 'stlu 12/16/2020 19:38'
}
GLUniform >> getValue [

	self notYetImplemented
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/15/2021 12:18'
}
GLUniform >> initialize [

	super initialize.
	stateAccessImp := GLObjectImps current uniformSetter
]

{
	#category : #initialization,
	#timestamp : 'stlu 12/14/2020 16:17'
}
GLUniform >> initializeProperties: aWordArray [

	location := aWordArray second.
	type := GLSLType numElements: aWordArray fourth enum: aWordArray third
]

{
	#category : #testing,
	#timestamp : 'stlu 12/16/2020 18:45'
}
GLUniform >> isUniform [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/13/2020 14:33'
}
GLUniform >> location [

	^ location
]

{
	#category : #printing,
	#timestamp : 'stlu 1/10/2021 12:43'
}
GLUniform >> printOn: aStream [

	aStream
		print: location;
		nextPutAll: ': uniform '.
	type printDeclarationNamed: name on: aStream
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo1ComponentDoubleArray: aFloat64Array count: numElements [

	stateAccessImp set: self to1ComponentDoubleArray: aFloat64Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo1ComponentFloatArray: aFloat32Array count: numElements [

	stateAccessImp set: self to1ComponentFloatArray: aFloat32Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo1ComponentIntegerArray: anIntegerArray count: numElements [

	stateAccessImp set: self to1ComponentIntegerArray: anIntegerArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	stateAccessImp set: self to1ComponentUnsignedIntegerArray: aWordArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo2ComponentDoubleArray: aFloat64Array count: numElements [

	stateAccessImp set: self to2ComponentDoubleArray: aFloat64Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo2ComponentFloatArray: aFloat32Array count: numElements [

	stateAccessImp set: self to2ComponentFloatArray: aFloat32Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo2ComponentIntegerArray: anIntegerArray count: numElements [

	stateAccessImp set: self to2ComponentIntegerArray: anIntegerArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	stateAccessImp set: self to2ComponentUnsignedIntegerArray: aWordArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo3ComponentDoubleArray: aFloat64Array count: numElements [

	stateAccessImp set: self to3ComponentDoubleArray: aFloat64Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo3ComponentFloatArray: aFloat32Array count: numElements [

	stateAccessImp set: self to3ComponentFloatArray: aFloat32Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo3ComponentIntegerArray: anIntegerArray count: numElements [

	stateAccessImp set: self to3ComponentIntegerArray: anIntegerArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	stateAccessImp set: self to3ComponentUnsignedIntegerArray: aWordArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo4ComponentDoubleArray: aFloat64Array count: numElements [

	stateAccessImp set: self to4ComponentDoubleArray: aFloat64Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo4ComponentFloatArray: aFloat32Array count: numElements [

	stateAccessImp set: self to4ComponentFloatArray: aFloat32Array count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo4ComponentIntegerArray: anIntegerArray count: numElements [

	stateAccessImp set: self to4ComponentIntegerArray: anIntegerArray count: numElements
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setTo4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	stateAccessImp set: self to4ComponentUnsignedIntegerArray: aWordArray count: numElements
]

{
	#category : #setting,
	#timestamp : 'stlu 11/23/2020 16:04'
}
GLUniform >> setTo: anObject [

	anObject setAsValueOfUniform: self
]

{
	#category : #setting,
	#timestamp : 'stlu 11/23/2020 16:04'
}
GLUniform >> setToArray: aRawBitsArray [

	type setUniform: self toArray: aRawBitsArray
]

{
	#category : #setting,
	#timestamp : 'stlu 11/23/2020 16:04'
}
GLUniform >> setToArray: aRawBitsArray count: numElements [ 

	type setUniform: self toArray: aRawBitsArray count: numElements
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDouble: aDouble [

	stateAccessImp set: self toDouble: aDouble
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices2x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices2x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices2x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices3x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices3x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices3x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices4x2: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices4x3: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toDoubleMatrices4x4: aFloat64Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubles: double1 _: double2 [

	stateAccessImp set: self toDoubles: double1 _: double2
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubles: double1 _: double2 _: double3 [

	stateAccessImp set: self toDoubles: double1 _: double2 _: double3
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToDoubles: double1 _: double2 _: double3 _: double4 [

	stateAccessImp set: self toDoubles: double1 _: double2 _: double3 _: double4
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloat: aFloat [

	stateAccessImp set: self toFloat: aFloat
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices2x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices2x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices2x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices3x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices3x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices3x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices4x2: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices4x3: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	stateAccessImp
		set: self
		toFloatMatrices4x4: aFloat32Array
		count: numMatrices
		transpose: isRowMajor
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloats: float1 _: float2 [

	stateAccessImp set: self toFloats: float1 _: float2
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloats: float1 _: float2 _: float3 [

	stateAccessImp set: self toFloats: float1 _: float2 _: float3
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToFloats: float1 _: float2 _: float3 _: float4 [

	stateAccessImp set: self toFloats: float1 _: float2 _: float3 _: float4
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToInteger: anInteger [

	stateAccessImp set: self toInteger: anInteger
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToIntegers: int1 _: int2 [

	stateAccessImp set: self toIntegers: int1 _: int2
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToIntegers: int1 _: int2 _: int3 [

	stateAccessImp set: self toIntegers: int1 _: int2 _: int3
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToIntegers: int1 _: int2 _: int3 _: int4 [

	stateAccessImp set: self toIntegers: int1 _: int2 _: int3 _: int4
]

{
	#category : #setting,
	#timestamp : 'stlu 11/23/2020 16:05'
}
GLUniform >> setToObject: anObject [

	type setUniform: self toObject: anObject
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToUnsignedInteger: anUnsignedInteger [

	stateAccessImp set: self toUnsignedInteger: anUnsignedInteger
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 [

	stateAccessImp set: self toUnsignedIntegers: uint1 _: uint2
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 _: uint3 [

	stateAccessImp set: self toUnsignedIntegers: uint1 _: uint2 _: uint3
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:24'
}
GLUniform >> setToUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	stateAccessImp set: self toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/16/2020 00:39'
}
GLUniform >> type [

	^ type
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/16/2020 19:48'
}
GLUniform >> value [

	^ value
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/16/2020 19:39'
}
GLUniform >> value: anObject [

	self setTo: anObject.
	value := anObject
]
