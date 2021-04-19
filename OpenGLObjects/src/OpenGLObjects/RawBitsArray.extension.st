Extension { #name : #RawBitsArray }

{
	#category : #'*OpenGLObjects',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:04'
}
RawBitsArray >> setAsValueOfUniform: aUniform [

	aUniform setToArray: self
]
