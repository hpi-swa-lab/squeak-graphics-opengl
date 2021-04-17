Extension { #name : #SignedWordArray }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:37'
}
SignedWordArray >> integerAt: index [
	| word |
	<primitive: 165>
	word := self basicAt: index.
	word < 16r3FFFFFFF ifTrue:[^word]. "Avoid LargeInteger computations"
	^word >= 16r80000000	"Negative?!"
		ifTrue:["word - 16r100000000"
				(word bitInvert32 + 1) negated]
		ifFalse:[word]
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:37'
}
SignedWordArray >> integerAt: index put: anInteger [
	| word |
	<primitive: 166>
	anInteger < 0
		ifTrue:[anInteger < -16r80000000 ifTrue: [self error: anInteger asString , ' out of range'].
				"word := 16r100000000 + anInteger"
				word := (anInteger + 1) negated bitInvert32]
		ifFalse:[anInteger > 16r7FFFFFFF ifTrue: [self error: anInteger asString , ' out of range'].
				word := anInteger].
	self  basicAt: index put: word.
	^anInteger
]
