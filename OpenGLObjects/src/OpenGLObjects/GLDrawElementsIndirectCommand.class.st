Class {
	#name : #GLDrawElementsIndirectCommand,
	#superclass : #ExternalStructure,
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #'field definition',
	#'squeak_changestamp' : 'stlu 9/10/2021 13:01'
}
GLDrawElementsIndirectCommand class >> fields [
	"
	self defineFields.
	"
	^ #(
		(numVertices		'uint32_t')
		(numInstances		'uint32_t')
		(startingVertex		'uint32_t')
		(indexOffset		'int32_t')
		(startingInstance	'uint32_t')
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
