Extension { #name : #RawBitsArray }

{
	#category : #'*OpenGLObjects',
	#timestamp : 'stlu 11/23/2020 16:04'
}
RawBitsArray >> setAsValueOfUniform: aUniform [

	aUniform setToArray: self
]
