Extension { #name : #Parser }

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Parser >> callback [
	<pragmaParser>
	
	| descriptorClass retType externalName args argType |
	descriptorClass := ExternalFunction.
	"Parse return type"
	self advance.
	here = 'const' ifTrue: [self advance].
	retType := self externalType: descriptorClass.
	retType == nil ifTrue:[^self expected:'return type'].
	"Parse function name or index"
	externalName := here.

	(self match: #leftParenthesis) ifFalse:[^self expected:'function pointer (*)'].
	(self matchToken: #*) ifFalse:[^self expected:'function pointer (*)'].
	(self match: #rightParenthesis) ifFalse:[^self expected:'function pointer (*)'].

	(self match: #leftParenthesis) ifFalse:[^self expected:'argument list'].
	args := WriteStream on: Array new.
	[self match: #rightParenthesis] whileFalse:[
		here = 'const' ifTrue: [self advance].
		here = ',' ifTrue: [self advance].
		argType := self externalType: descriptorClass.
		argType == nil ifTrue:[^self expected:'argument'].
		argType isVoid & argType isPointerType not ifFalse:[args nextPut: argType]].

	self addPragma: (Pragma keyword: #callback: arguments: {{retType}, args contents}).
	^true
]

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Parser >> externalType: descriptorClass [
	"Parse and return an external type"
	| xType typeName |
	typeName := here. "Note that pointer token is not yet parsed!"
	(xType := descriptorClass typeNamed: typeName)
		ifNil: [
			"Raise an error if user is there"
			self interactive ifTrue: [^nil].
			"otherwise go over it silently -- use an unknown struct type"
			xType := descriptorClass newTypeNamed: here].
	self advance.
	^ (self matchToken: #*)
		ifTrue:[xType asPointerType]
		ifFalse:[(self matchToken: #**)
			ifTrue: [xType asPointerToPointerType]
			ifFalse: [xType]]
]
