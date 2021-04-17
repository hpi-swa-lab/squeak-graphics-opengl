Extension { #name : #Color }

{
	#category : #'*OpenGLObjects',
	#timestamp : 'stlu 1/6/2021 11:23'
}
Color >> setAsValueOfUniform: aUniform [

	self asVectorColor setAsValueOfUniform: aUniform
]
