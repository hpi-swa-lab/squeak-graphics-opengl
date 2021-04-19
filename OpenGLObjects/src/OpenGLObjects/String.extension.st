Extension { #name : #String }

{
	#category : #'*OpenGLObjects',
	#'squeak_changestamp' : 'stlu 11/23/2020 15:10'
}
String >> asParameterName [
	"Collection name asParameterName -> 'aCollection'"
	^ (self first isVowel ifTrue: ['an'] ifFalse: ['a']) , self
]
