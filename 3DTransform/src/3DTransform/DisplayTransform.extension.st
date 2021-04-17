Extension { #name : #DisplayTransform }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
DisplayTransform >> asMatrix2x3 [

	^ self asMatrixTransform2x3 asMatrix2x3
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
DisplayTransform >> isMatrix2x3 [

	^ false
]
