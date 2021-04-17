Extension { #name : #String }

{
	#category : #'*OpenGLObjects',
	#timestamp : 'stlu 11/23/2020 15:10'
}
String >> asParameterName [
	"Collection name asParameterName -> 'aCollection'"
	^ (self first isVowel ifTrue: ['an'] ifFalse: ['a']) , self
]
