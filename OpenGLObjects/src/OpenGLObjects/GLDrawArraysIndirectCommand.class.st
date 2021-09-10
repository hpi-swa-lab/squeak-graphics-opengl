Class {
	#name : #GLDrawArraysIndirectCommand,
	#superclass : #ExternalStructure,
	#category : #'OpenGLObjects-VertexArrays'
}

{
	#category : #'field definition',
	#'squeak_changestamp' : 'stlu 9/10/2021 12:59'
}
GLDrawArraysIndirectCommand class >> fields [
	"
	self defineFields.
	"
	^ #(
		(numVertices		'uint32_t')
		(numInstances		'uint32_t')
		(startingVertex		'uint32_t')
		(startingInstance	'uint32_t')
	)
"
typedef  struct {
	uint  count;
	uint  primCount;
	uint  first;
	uint  baseInstance;
} DrawArraysIndirectCommand;
"
]
