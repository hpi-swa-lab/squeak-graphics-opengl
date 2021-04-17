Extension { #name : #FFIPlatformDescription }

{
	#category : #'*OpenGL-FFI-Support',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFIPlatformDescription >> abi [

	| processor |
	processor := self subtype asLowercase.
	
	(processor = 'arm' or: [(processor beginsWith: 'armv') and: [processor fifth <= $7]])
		ifTrue: [^ 'ARM32'].
	(processor first = $i and: [processor = 'intel' or: ['i#86' match: processor]])
		ifTrue: [^ 'IA32'].

	(processor first = $x and: [processor = 'x64' or: [('x86#64*' match: processor)]])
		ifTrue: [^ self isWindows ifTrue: ['X64Win64'] ifFalse: ['X64']].
		
	^ 'UNKNOWN'
]
