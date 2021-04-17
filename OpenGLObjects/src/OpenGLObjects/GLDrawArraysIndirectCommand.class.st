Class {
	#name : #GLDrawArraysIndirectCommand,
	#superclass : #ExternalStructure,
	#category : #'OpenGLObjects-VertexArrays',
	#commentStamp : ''
}

{
	#category : #'field definition',
	#timestamp : 'stlu 3/14/2021 13:25'
}
GLDrawArraysIndirectCommand class >> fields [
	"
	self defineFields.
	"
	^ #(
		(count			'uint32_t')
		(primCount		'uint32_t')
		(first			'uint32_t')
		(baseInstance	'uint32_t')
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
