Extension { #name : #ExternalType }

{
	#category : #'*GLFW-FFI-Support',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType >> asArrayType: aNumber [

	self isPointerType ifFalse: [^ self asPointerType asArrayType: aNumber].
	
	^ ExternalArrayType basicNew
		type: self;
		numberOfItems: aNumber;
		yourself
]

{
	#category : #'*GLFW-FFI-Support',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType >> isTypeAlias [

	^ false
]

{
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
