Class {
	#name : #GLProgramImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

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

{
	#category : #creation,
	#'squeak_changestamp' : 'stlu 4/25/2021 23:10'
}
GLProgramImp >> createProgramID [

	^ GL createProgram
]

{
	#category : #deletion,
	#'squeak_changestamp' : 'stlu 7/30/2021 01:39'
}
GLProgramImp >> deleteProgram: aProgram [

	GL deleteProgram: aProgram id.
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to1ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1dv: aUniform location
			with: numElements
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to1ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1fv: aUniform location
			with: numElements
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to1ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1iv: aUniform location
			with: numElements
			with: anIntegerArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1uiv: aUniform location
			with: numElements
			with: aWordArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to2ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2dv: aUniform location
			with: numElements
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to2ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2fv: aUniform location
			with: numElements
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to2ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2iv: aUniform location
			with: numElements
			with: anIntegerArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2uiv: aUniform location
			with: numElements
			with: aWordArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to3ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3dv: aUniform location
			with: numElements
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to3ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3fv: aUniform location
			with: numElements
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to3ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3iv: aUniform location
			with: numElements
			with: anIntegerArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3uiv: aUniform location
			with: numElements
			with: aWordArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to4ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4dv: aUniform location
			with: numElements
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to4ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4fv: aUniform location
			with: numElements
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to4ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4iv: aUniform location
			with: numElements
			with: anIntegerArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform to4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4uiv: aUniform location
			with: numElements
			with: aWordArray].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDouble: aDouble [

	aUniform program boundDuring: [
		GL
			uniform1d: aUniform location
			with: aDouble].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubles: double1 _: double2 [

	aUniform program boundDuring: [
		GL
			uniform2d: aUniform location
			with: double1 with: double2].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubles: double1 _: double2 _: double3 [

	aUniform program boundDuring: [
		GL
			uniform3d: aUniform location
			with: double1 with: double2 with: double3].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toDoubles: double1 _: double2 _: double3 _: double4 [

	aUniform program boundDuring: [
		GL
			uniform4d: aUniform location
			with: double1 with: double2 with: double3 with: double4].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloat: aFloat [

	aUniform program boundDuring: [
		GL
			uniform1f: aUniform location
			with: aFloat].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloats: float1 _: float2 [

	aUniform program boundDuring: [
		GL
			uniform2f: aUniform location
			with: float1 with: float2].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloats: float1 _: float2 _: float3 [

	aUniform program boundDuring: [
		GL
			uniform3f: aUniform location
			with: float1 with: float2 with: float3].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toFloats: float1 _: float2 _: float3 _: float4 [

	aUniform program boundDuring: [
		GL
			uniform4f: aUniform location
			with: float1 with: float2 with: float3 with: float4].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toInteger: anInteger [

	aUniform program boundDuring: [
		GL
			uniform1i: aUniform location
			with: anInteger].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toIntegers: int1 _: int2 [

	aUniform program boundDuring: [
		GL
			uniform2i: aUniform location
			with: int1 with: int2].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toIntegers: int1 _: int2 _: int3 [

	aUniform program boundDuring: [
		GL
			uniform3i: aUniform location
			with: int1 with: int2 with: int3].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toIntegers: int1 _: int2 _: int3 _: int4 [

	aUniform program boundDuring: [
		GL
			uniform4i: aUniform location
			with: int1 with: int2 with: int3 with: int4].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toUnsignedInteger: anUnsignedInteger [

	aUniform program boundDuring: [
		GL
			uniform1ui: aUniform location
			with: anUnsignedInteger].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 [

	aUniform program boundDuring: [
		GL
			uniform2ui: aUniform location
			with: uint1 with: uint2].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 [

	aUniform program boundDuring: [
		GL
			uniform3ui: aUniform location
			with: uint1 with: uint2 with: uint3].
]

{
	#category : #'uniform setters',
	#'squeak_changestamp' : 'stlu 7/29/2021 21:48'
}
GLProgramImp >> setUniform: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	aUniform program boundDuring: [
		GL
			uniform4ui: aUniform location
			with: uint1 with: uint2 with: uint3 with: uint4].
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:14'
}
GLProgramImp >> useProgram: programOrNil [

	GL useProgram: (programOrNil ifNil: [0] ifNotNil: [programOrNil id]).
]
