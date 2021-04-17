Extension { #name : #Point }

{
	#category : #'*OpenGLObjects',
	#timestamp : 'stlu 1/6/2021 11:24'
}
Point >> setAsValueOfUniform: aUniform [

	(Vector2 x: x y: y) setAsValueOfUniform: aUniform
]
