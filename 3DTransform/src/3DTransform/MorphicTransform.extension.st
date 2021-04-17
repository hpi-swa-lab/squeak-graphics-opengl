Extension { #name : #MorphicTransform }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
MorphicTransform >> asMatrix2x3 [

	^ ((Matrix2x3 withRotation: angle radiansToDegrees negated)
			composedWithLocal: (Matrix2x3 withScale: scale))
				offset: offset negated
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
MorphicTransform >> asMatrix4x4 [

	^((Matrix4x4 withRotation: angle radiansToDegrees negated around: 0 @ 0 @ 1) composedWithLocal:
		(Matrix4x4 withScale: scale asPoint @ 1))
			translation: offset negated @ 0
]
