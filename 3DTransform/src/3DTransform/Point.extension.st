Extension { #name : #Point }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Point >> @ aNumber [

	^ Vector3
		x: x
		y: y
		z: aNumber
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Point >> asVector3 [

	^ self @ 0.0
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Point >> z [

	^ 0.0
]
