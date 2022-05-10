Extension { #name : #MorphicTransform }

{
	#category : #'*3DTransform',
	#'squeak_changestamp' : 'stlu 4/22/2022 22:44'
}
MorphicTransform >> asMatrix2x3 [

	^ Matrix2x3 identity setToMorphicTransform: self
]

{
	#category : #'*3DTransform',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
MorphicTransform >> asMatrix4x4 [

	^((Matrix4x4 withRotation: angle radiansToDegrees negated around: 0 @ 0 @ 1) composedWithLocal:
		(Matrix4x4 withScale: scale asPoint @ 1))
			translation: offset negated @ 0
]
