Extension { #name : #ExternalType }

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROC [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCAMD [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCARB [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCKHR [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLLeglClientBufferEXT [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLLeglImageOES [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:30'
}
ExternalType class >> GLVULKANPROCNV [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLbitfield [

	^ self uint32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 10/26/2020 14:23'
}
ExternalType class >> GLboolean [

	^ self bool
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLbyte [

	^ self int8_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLchar [

	^ self signedChar
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLcharARB [

	^ self GLchar
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampd [

	^ self double
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampf [

	^ self float
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampx [

	^ self int32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLdouble [

	^ self double
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:32'
}
ExternalType class >> GLeglClientBufferEXT [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:32'
}
ExternalType class >> GLeglImageOES [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLenum [

	^ self uint32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfixed [

	^ self int32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfixedARG [

	^ self GLfixed
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfloat [

	^ self float
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLhalf [

	^ self uint16_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLhalfARB [

	^ self GLhalf
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:28'
}
ExternalType class >> GLhalfNV [

	^ self GLhalf
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:33'
}
ExternalType class >> GLhandleARB [

	^ self uint32_t "void* on Apple"
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint [

	^ self int32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint64 [

	^ self int64_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint64EXT [

	^ self GLint64
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLintptr [

	^ self intptr_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLintptrARB [

	^ self GLintptr
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLshort [

	^ self int16_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizei [

	^ self int32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizeiptr [

	^ self intptr_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizeiptrARB [

	^ self GLsizeiptr
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsync [

	^ self void asPointerType
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLubyte [

	^ self uint8_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint [

	^ self uint32_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint64 [

	^ self uint64_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint64EXT [

	^ self GLuint64
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLushort [

	^ self uint16_t
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 3/3/2021 14:30'
}
ExternalType class >> GLvdpauSurfaceNV [

	^ self GLintptr
]

{
	#category : #'*OpenGL',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLvoid [

	^ self void
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType >> asArrayType: aNumber [

	self isPointerType ifFalse: [^ self asPointerType asArrayType: aNumber].
	
	^ ExternalArrayType basicNew
		type: self;
		numberOfItems: aNumber;
		yourself
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType >> isTypeAlias [

	^ false
]

{
	#category : #'*OpenGL-FFI-Support-override',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> lookupTypes: signature [
	"
	Supported arguments:
		'<callback: int (*) (double* double*)>' ... pragma as string
		#(int 'double*' 'double*') ... array with type names
		{ ExternalType int. ExternalType double asPointerType. ExternalType double asPointerType } ... array with external types
	"
	
	(signature isString and: [signature first == $<]) ifTrue: [
		^ (Parser new parse: 'foo', String cr, signature class: Object)
			properties pragmas first argumentAt: 1].
	
	signature first isString ifTrue: [
		^ signature collect: [:typeName | self typeNamed: typeName]].
	
	signature first class == ExternalType ifTrue: [
		^ signature].
	
	self error: 'Could not lookup external types from signature'.
]

{
	#category : #'*OpenGL-FFI-Support-override',
	#timestamp : 'stlu 11/13/2020 18:20'
}
ExternalType class >> typeNamed: typeName [
	"Supports pointer-type lookup for both atomic and structure types.
	Examples: 'long', 'long*', 'long *' or 'MyStruct', 'MyStruct*', 'MyStruct *'"
	
	| isPointerType actualTypeName type isArrayType |
	(isPointerType := typeName last == $*)
		ifTrue: [actualTypeName := typeName allButLast withoutTrailingBlanks]
		ifFalse: [actualTypeName := typeName].
	
	(isArrayType := typeName matchesRegex: '.+\[\d+\]')
		ifTrue: [
			actualTypeName := typeName copyFrom: 1 to: (typeName indexOf: $[) - 1].
	
	(Symbol lookup: actualTypeName)
		ifNotNil: [:sym | actualTypeName := sym].

	type := (self atomicTypeNamed: actualTypeName)
		ifNil: [self structTypeNamed: actualTypeName].

	^ type ifNotNil: [
		isArrayType
			ifTrue: [type asArrayType: (typeName copyFrom: (typeName indexOf: $[) + 1 to: typeName size - 1) asNumber]
			ifFalse: [isPointerType ifTrue: [type asPointerType] ifFalse: [type]]]
]
