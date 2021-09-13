Class {
	#name : #GLDrawArraysIndirectCommand,
	#superclass : #ExternalStructure,
	#category : #'OpenGL-Types'
}

{
	#category : #'field definition',
	#'squeak_changestamp' : 'stlu 9/13/2021 10:38'
}
GLDrawArraysIndirectCommand class >> fields [
	"
	self defineFields.
	"
	^ #(
		("numVertices"			count			'uint32_t')
		("numInstances"		primCount		'uint32_t')
		("startingVertex"		first				'uint32_t')
		("startingInstance"		baseInstance	'uint32_t')
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:38'
}
GLDrawArraysIndirectCommand >> numInstances [

	^ self primCount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:39'
}
GLDrawArraysIndirectCommand >> numInstances: anInteger [

	self primCount: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:39'
}
GLDrawArraysIndirectCommand >> numVertices [

	^ self count
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:39'
}
GLDrawArraysIndirectCommand >> numVertices: anInteger [

	self count: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:39'
}
GLDrawArraysIndirectCommand >> startingInstance [

	^ self baseInstance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:40'
}
GLDrawArraysIndirectCommand >> startingInstance: anInteger [

	self baseInstance: anInteger.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:40'
}
GLDrawArraysIndirectCommand >> startingVertex [

	^ self first
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/13/2021 10:40'
}
GLDrawArraysIndirectCommand >> startingVertex: anInteger [

	self first: anInteger.
]
