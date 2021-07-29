Class {
	#name : #GLSeparateShaderObjectsImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

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

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:34'
}
GLSeparateShaderObjectsImp >> getProgramInputs: aProgram [

	^ self getResources: GLProgramInput program: aProgram
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 7/29/2021 20:34'
}
GLSeparateShaderObjectsImp >> getProgramUniforms: aProgram [

	^ self getResources: GLUniform program: aProgram
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 12/16/2020 18:54'
}
GLSeparateShaderObjectsImp >> getResource: aResourceClass program: aProgram at: index [

	| properties name |
	properties := self
					queryResourceProperties: aResourceClass propertiesToQuery
					program: aProgram
					interface: aResourceClass interfaceEnum
					at: index.
	name := self
				queryResourceName: properties first
				program: aProgram
				interface:aResourceClass interfaceEnum
				at: index.
	^ aResourceClass
		program: aProgram
		name: name
		properties: properties
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 12/16/2020 18:54'
}
GLSeparateShaderObjectsImp >> getResources: aResourceClass program: aProgram [

	| numResources resources |
	numResources := self
						queryInterface: aResourceClass interfaceEnum
						program: aProgram
						property: GL_ACTIVE_RESOURCES.
	resources := Array new: numResources.
	1 to: numResources do: [:i |
		| resource |
		resource := self getResource: aResourceClass program: aProgram at: i - 1.
		resources at: i put: resource].
	^ resources
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 12/13/2020 14:47'
}
GLSeparateShaderObjectsImp >> queryInterface: interfaceEnum program: aProgram property: propertyEnum [

	| result |
	result := WordArray new: 1.
	GL
		getProgramInterfaceiv: aProgram id
		with: interfaceEnum
		with: propertyEnum
		with: result.
	^ result first
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 12/13/2020 14:42'
}
GLSeparateShaderObjectsImp >> queryResourceName: nameLength program: aProgram interface: interfaceEnum at: index [

	| result |
	result := ByteArray new: nameLength "includes null-terminator".
	GL
		getProgramResourceName: aProgram id
		with: interfaceEnum
		with: index
		with: result size
		with: nil
		with: result.
	^ result allButLast utf8Decoded
]

{
	#category : #'program resource querying',
	#'squeak_changestamp' : 'stlu 12/13/2020 14:42'
}
GLSeparateShaderObjectsImp >> queryResourceProperties: aWordArray program: aProgram interface: interfaceEnum at: index [

	| result |
	result := WordArray new: aWordArray size.
	GL
		getProgramResourceiv: aProgram id
		with: interfaceEnum
		with: index
		with: aWordArray size
		with: aWordArray
		with: result size
		with: nil
		with: result.
	^ result
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to1ComponentDoubleArray: aFloat64Array count: numElements [

	GL
		programUniform1dv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to1ComponentFloatArray: aFloat32Array count: numElements [

	GL
		programUniform1fv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to1ComponentIntegerArray: anIntegerArray count: numElements [

	GL
		programUniform1iv: aUniform program id
		with: aUniform location
		with: numElements
		with: anIntegerArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	GL
		programUniform1uiv: aUniform program id
		with: aUniform location
		with: numElements
		with: aWordArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to2ComponentDoubleArray: aFloat64Array count: numElements [

	GL
		programUniform2dv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to2ComponentFloatArray: aFloat32Array count: numElements [

	GL
		programUniform2fv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to2ComponentIntegerArray: anIntegerArray count: numElements [

	GL
		programUniform2iv: aUniform program id
		with: aUniform location
		with: numElements
		with: anIntegerArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	GL
		programUniform2uiv: aUniform program id
		with: aUniform location
		with: numElements
		with: aWordArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to3ComponentDoubleArray: aFloat64Array count: numElements [

	GL
		programUniform3dv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to3ComponentFloatArray: aFloat32Array count: numElements [

	GL
		programUniform3fv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to3ComponentIntegerArray: anIntegerArray count: numElements [

	GL
		programUniform3iv: aUniform program id
		with: aUniform location
		with: numElements
		with: anIntegerArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	GL
		programUniform3uiv: aUniform program id
		with: aUniform location
		with: numElements
		with: aWordArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to4ComponentDoubleArray: aFloat64Array count: numElements [

	GL
		programUniform4dv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to4ComponentFloatArray: aFloat32Array count: numElements [

	GL
		programUniform4fv: aUniform program id
		with: aUniform location
		with: numElements
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to4ComponentIntegerArray: anIntegerArray count: numElements [

	GL
		programUniform4iv: aUniform program id
		with: aUniform location
		with: numElements
		with: anIntegerArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform to4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	GL
		programUniform4uiv: aUniform program id
		with: aUniform location
		with: numElements
		with: aWordArray.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDouble: aDouble [

	GL
		programUniform1d: aUniform program id
		with: aUniform location
		with: aDouble.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2x3dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2x4dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3x2dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3x4dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4x2dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4x3dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4dv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat64Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubles: double1 _: double2 [

	GL
		programUniform2d: aUniform program id
		with: aUniform location
		with: double1 with: double2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubles: double1 _: double2 _: double3 [

	GL
		programUniform3d: aUniform program id
		with: aUniform location
		with: double1 with: double2 with: double3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toDoubles: double1 _: double2 _: double3 _: double4 [

	GL
		programUniform4d: aUniform program id
		with: aUniform location
		with: double1 with: double2 with: double3 with: double4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloat: aFloat [

	GL
		programUniform1f: aUniform program id
		with: aUniform location
		with: aFloat.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2x3fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix2x4fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3x2fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix3x4fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4x2fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4x3fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	GL
		programUniformMatrix4fv: aUniform program id
		with: aUniform location
		with: numMatrices
		with: isRowMajor
		with: aFloat32Array.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloats: float1 _: float2 [

	GL
		programUniform2f: aUniform program id
		with: aUniform location
		with: float1 with: float2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloats: float1 _: float2 _: float3 [

	GL
		programUniform3f: aUniform program id
		with: aUniform location
		with: float1 with: float2 with: float3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toFloats: float1 _: float2 _: float3 _: float4 [

	GL
		programUniform4f: aUniform program id
		with: aUniform location
		with: float1 with: float2 with: float3 with: float4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toInteger: anInteger [

	GL
		programUniform1i: aUniform program id
		with: aUniform location
		with: anInteger.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toIntegers: int1 _: int2 [

	GL
		programUniform2i: aUniform program id
		with: aUniform location
		with: int1 with: int2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toIntegers: int1 _: int2 _: int3 [

	GL
		programUniform3i: aUniform program id
		with: aUniform location
		with: int1 with: int2 with: int3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toIntegers: int1 _: int2 _: int3 _: int4 [

	GL
		programUniform4i: aUniform program id
		with: aUniform location
		with: int1 with: int2 with: int3 with: int4.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toUnsignedInteger: anUnsignedInteger [

	GL
		programUniform1ui: aUniform program id
		with: aUniform location
		with: anUnsignedInteger.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 [

	GL
		programUniform2ui: aUniform program id
		with: aUniform location
		with: uint1 with: uint2.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 [

	GL
		programUniform3ui: aUniform program id
		with: aUniform location
		with: uint1 with: uint2 with: uint3.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLSeparateShaderObjectsImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	GL
		programUniform4ui: aUniform program id
		with: aUniform location
		with: uint1 with: uint2 with: uint3 with: uint4.
]
