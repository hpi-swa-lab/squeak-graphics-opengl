Extension { #name : #Color }

{
	#category : #'*OpenGLObjects',
	#'squeak_changestamp' : 'stlu 1/6/2021 11:23'
}
Color >> setAsValueOfUniform: aUniform [

	self asVectorColor setAsValueOfUniform: aUniform
]
