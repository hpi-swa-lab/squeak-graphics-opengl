Class {
	#name : #GLUniformLegacyStateAccessImp,
	#superclass : #GLUniformStateAccessImp,
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

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

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to1ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1dv: aUniform location
			with: numElements
			with: aFloat64Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to1ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1fv: aUniform location
			with: numElements
			with: aFloat32Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to1ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1iv: aUniform location
			with: numElements
			with: anIntegerArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to1ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform1uiv: aUniform location
			with: numElements
			with: aWordArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to2ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2dv: aUniform location
			with: numElements
			with: aFloat64Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to2ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2fv: aUniform location
			with: numElements
			with: aFloat32Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to2ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2iv: aUniform location
			with: numElements
			with: anIntegerArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to2ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform2uiv: aUniform location
			with: numElements
			with: aWordArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to3ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3dv: aUniform location
			with: numElements
			with: aFloat64Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to3ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3fv: aUniform location
			with: numElements
			with: aFloat32Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to3ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3iv: aUniform location
			with: numElements
			with: anIntegerArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to3ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform3uiv: aUniform location
			with: numElements
			with: aWordArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to4ComponentDoubleArray: aFloat64Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4dv: aUniform location
			with: numElements
			with: aFloat64Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to4ComponentFloatArray: aFloat32Array count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4fv: aUniform location
			with: numElements
			with: aFloat32Array]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to4ComponentIntegerArray: anIntegerArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4iv: aUniform location
			with: numElements
			with: anIntegerArray]
]

{
	#category : #'setting - arrays',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform to4ComponentUnsignedIntegerArray: aWordArray count: numElements [

	aUniform program boundDuring: [
		GL
			uniform4uiv: aUniform location
			with: numElements
			with: aWordArray]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDouble: aDouble [

	aUniform program boundDuring: [
		GL
			uniform1d: aUniform location
			with: aDouble]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices2x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices2x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices2x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices3x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices3x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices3x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices4x2: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x2dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices4x3: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x3dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubleMatrices4x4: aFloat64Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4dv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat64Array]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubles: double1 _: double2 [

	aUniform program boundDuring: [
		GL
			uniform2d: aUniform location
			with: double1 with: double2]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubles: double1 _: double2 _: double3 [

	aUniform program boundDuring: [
		GL
			uniform3d: aUniform location
			with: double1 with: double2 with: double3]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toDoubles: double1 _: double2 _: double3 _: double4 [

	aUniform program boundDuring: [
		GL
			uniform4d: aUniform location
			with: double1 with: double2 with: double3 with: double4]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloat: aFloat [

	aUniform program boundDuring: [
		GL
			uniform1f: aUniform location
			with: aFloat]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices2x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices2x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices2x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix2x4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices3x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices3x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices3x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix3x4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices4x2: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x2fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices4x3: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4x3fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - matrices',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloatMatrices4x4: aFloat32Array count: numMatrices transpose: isRowMajor [

	aUniform program boundDuring: [
		GL
			uniformMatrix4fv: aUniform location
			with: numMatrices
			with: isRowMajor
			with: aFloat32Array]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloats: float1 _: float2 [

	aUniform program boundDuring: [
		GL
			uniform2f: aUniform location
			with: float1 with: float2]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloats: float1 _: float2 _: float3 [

	aUniform program boundDuring: [
		GL
			uniform3f: aUniform location
			with: float1 with: float2 with: float3]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toFloats: float1 _: float2 _: float3 _: float4 [

	aUniform program boundDuring: [
		GL
			uniform4f: aUniform location
			with: float1 with: float2 with: float3 with: float4]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toInteger: anInteger [

	aUniform program boundDuring: [
		GL
			uniform1i: aUniform location
			with: anInteger]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toIntegers: int1 _: int2 [

	aUniform program boundDuring: [
		GL
			uniform2i: aUniform location
			with: int1 with: int2]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toIntegers: int1 _: int2 _: int3 [

	aUniform program boundDuring: [
		GL
			uniform3i: aUniform location
			with: int1 with: int2 with: int3]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toIntegers: int1 _: int2 _: int3 _: int4 [

	aUniform program boundDuring: [
		GL
			uniform4i: aUniform location
			with: int1 with: int2 with: int3 with: int4]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toUnsignedInteger: anUnsignedInteger [

	aUniform program boundDuring: [
		GL
			uniform1ui: aUniform location
			with: anUnsignedInteger]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 [

	aUniform program boundDuring: [
		GL
			uniform2ui: aUniform location
			with: uint1 with: uint2]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 [

	aUniform program boundDuring: [
		GL
			uniform3ui: aUniform location
			with: uint1 with: uint2 with: uint3]
]

{
	#category : #'setting - scalars',
	#timestamp : 'stlu 12/14/2020 14:12'
}
GLUniformLegacyStateAccessImp >> set: aUniform toUnsignedIntegers: uint1 _: uint2 _: uint3 _: uint4 [

	aUniform program boundDuring: [
		GL
			uniform4ui: aUniform location
			with: uint1 with: uint2 with: uint3 with: uint4]
]
