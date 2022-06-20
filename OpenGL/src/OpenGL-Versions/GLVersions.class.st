Class {
	#name : #GLVersions,
	#superclass : #SharedPool,
	#classVars : [
		'GL10',
		'GL11',
		'GL12',
		'GL13',
		'GL14',
		'GL15',
		'GL20',
		'GL21',
		'GL30',
		'GL31',
		'GL32',
		'GL32#Compatibility',
		'GL32#Core',
		'GL32Compatibility',
		'GL32Core',
		'GL33',
		'GL33#Compatibility',
		'GL33#Core',
		'GL33Compatibility',
		'GL33Core',
		'GL40',
		'GL40#Compatibility',
		'GL40#Core',
		'GL40Compatibility',
		'GL40Core',
		'GL41',
		'GL41#Compatibility',
		'GL41#Core',
		'GL41Compatibility',
		'GL41Core',
		'GL42',
		'GL42#Compatibility',
		'GL42#Core',
		'GL42Compatibility',
		'GL42Core',
		'GL43',
		'GL43#Compatibility',
		'GL43#Core',
		'GL43Compatibility',
		'GL43Core',
		'GL44',
		'GL44#Compatibility',
		'GL44#Core',
		'GL44Compatibility',
		'GL44Core',
		'GL45',
		'GL45#Compatibility',
		'GL45#Core',
		'GL45Compatibility',
		'GL45Core',
		'GL46',
		'GL46#Compatibility',
		'GL46#Core',
		'GL46Compatibility',
		'GL46Core',
		'GLES10',
		'GLES10#Common',
		'GLES10Common',
		'GLES11',
		'GLES11#Common',
		'GLES11Common',
		'GLES20',
		'GLES30',
		'GLES31',
		'GLES32',
		'GLSC20'
	],
	#category : #'OpenGL-Versions'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 6/20/2022 14:53'
}
GLVersions class >> initialize [
"
self initialize.
"
	GL10 := GLVersion api: GLAPI major: 1 minor: 0 profile: nil.
	GL11 := GLVersion api: GLAPI major: 1 minor: 1 profile: nil.
	GL12 := GLVersion api: GLAPI major: 1 minor: 2 profile: nil.
	GL13 := GLVersion api: GLAPI major: 1 minor: 3 profile: nil.
	GL14 := GLVersion api: GLAPI major: 1 minor: 4 profile: nil.
	GL15 := GLVersion api: GLAPI major: 1 minor: 5 profile: nil.
	GL20 := GLVersion api: GLAPI major: 2 minor: 0 profile: nil.
	GL21 := GLVersion api: GLAPI major: 2 minor: 1 profile: nil.
	GL30 := GLVersion api: GLAPI major: 3 minor: 0 profile: nil.
	GL31 := GLVersion api: GLAPI major: 3 minor: 1 profile: nil.
	GL32Core := GLVersion api: GLAPI major: 3 minor: 2 profile: #core.
	GL32Compatibility := GLVersion api: GLAPI major: 3 minor: 2 profile: #compatibility.
	GL32 := GLVersion api: GLAPI major: 3 minor: 2 profile: nil.
	GL33Core := GLVersion api: GLAPI major: 3 minor: 3 profile: #core.
	GL33Compatibility := GLVersion api: GLAPI major: 3 minor: 3 profile: #compatibility.
	GL33 := GLVersion api: GLAPI major: 3 minor: 3 profile: nil.
	GL40Core := GLVersion api: GLAPI major: 4 minor: 0 profile: #core.
	GL40Compatibility := GLVersion api: GLAPI major: 4 minor: 0 profile: #compatibility.
	GL40 := GLVersion api: GLAPI major: 4 minor: 0 profile: nil.
	GL41Core := GLVersion api: GLAPI major: 4 minor: 1 profile: #core.
	GL41Compatibility := GLVersion api: GLAPI major: 4 minor: 1 profile: #compatibility.
	GL41 := GLVersion api: GLAPI major: 4 minor: 1 profile: nil.
	GL42Core := GLVersion api: GLAPI major: 4 minor: 2 profile: #core.
	GL42Compatibility := GLVersion api: GLAPI major: 4 minor: 2 profile: #compatibility.
	GL42 := GLVersion api: GLAPI major: 4 minor: 2 profile: nil.
	GL43Core := GLVersion api: GLAPI major: 4 minor: 3 profile: #core.
	GL43Compatibility := GLVersion api: GLAPI major: 4 minor: 3 profile: #compatibility.
	GL43 := GLVersion api: GLAPI major: 4 minor: 3 profile: nil.
	GL44Core := GLVersion api: GLAPI major: 4 minor: 4 profile: #core.
	GL44Compatibility := GLVersion api: GLAPI major: 4 minor: 4 profile: #compatibility.
	GL44 := GLVersion api: GLAPI major: 4 minor: 4 profile: nil.
	GL45Core := GLVersion api: GLAPI major: 4 minor: 5 profile: #core.
	GL45Compatibility := GLVersion api: GLAPI major: 4 minor: 5 profile: #compatibility.
	GL45 := GLVersion api: GLAPI major: 4 minor: 5 profile: nil.
	GL46Core := GLVersion api: GLAPI major: 4 minor: 6 profile: #core.
	GL46Compatibility := GLVersion api: GLAPI major: 4 minor: 6 profile: #compatibility.
	GL46 := GLVersion api: GLAPI major: 4 minor: 6 profile: nil.
	GLES10Common := GLVersion api: GLES1API major: 1 minor: 0 profile: #common.
	GLES10 := GLVersion api: GLES1API major: 1 minor: 0 profile: nil.
	GLES11Common := GLVersion api: GLES1API major: 1 minor: 1 profile: #common.
	GLES11 := GLVersion api: GLES1API major: 1 minor: 1 profile: nil.
	GLES20 := GLVersion api: GLES2API major: 2 minor: 0 profile: nil.
	GLES30 := GLVersion api: GLES2API major: 3 minor: 0 profile: nil.
	GLES31 := GLVersion api: GLES2API major: 3 minor: 1 profile: nil.
	GLES32 := GLVersion api: GLES2API major: 3 minor: 2 profile: nil.
	GLSC20 := GLVersion api: GLSC2API major: 2 minor: 0 profile: nil.
]
