Class {
	#name : #GLDrawElementsIndirectCommand,
	#superclass : #ExternalStructure,
	#category : #'OpenGL-Types'
}

{
	#category : #'field definition',
	#'squeak_changestamp' : 'stlu 9/13/2021 10:33'
}
GLDrawElementsIndirectCommand class >> fields [
	"
	self defineFields.
	"
	^ #(
		("numVertices"			count			'uint32_t')
		("numInstances"		instanceCount	'uint32_t')
		("startingVertex"		firstIndex		'uint32_t')
		("indexOffset"			baseVertex		'int32_t')
		("startingInstance"		baseInstance	'uint32_t')
	)
"
typedef struct {
	uint count;
	uint instanceCount;
	uint firstIndex;
	int baseVertex;
	uint baseInstance;
} DrawElementsIndirectCommand;
"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:34'
}
GLDrawElementsIndirectCommand >> indexOffset [

	^ self baseVertex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:34'
}
GLDrawElementsIndirectCommand >> indexOffset: anInteger [

	self baseVertex: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:35'
}
GLDrawElementsIndirectCommand >> numInstances [

	^ self instanceCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:35'
}
GLDrawElementsIndirectCommand >> numInstances: anInteger [

	self instanceCount: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:35'
}
GLDrawElementsIndirectCommand >> numVertices [

	^ self count
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:35'
}
GLDrawElementsIndirectCommand >> numVertices: anInteger [

	self count: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:36'
}
GLDrawElementsIndirectCommand >> startingInstance [

	^ self baseInstance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:36'
}
GLDrawElementsIndirectCommand >> startingInstance: anInteger [

	self baseInstance: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:36'
}
GLDrawElementsIndirectCommand >> startingVertex [

	^ self firstIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:37'
}
GLDrawElementsIndirectCommand >> startingVertex: anInteger [

	self firstIndex: anInteger.
]
