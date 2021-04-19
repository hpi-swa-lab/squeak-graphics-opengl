Class {
	#name : #IntegerVectorView,
	#superclass : #VectorView,
	#category : #'3DTransform-Views',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:39'
}
IntegerVectorView class >> storeClass [

	^ SignedWordArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:42'
}
IntegerVectorView >> at: index [

	^ store signedLongAt: start + (index - 1 * stride)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:42'
}
IntegerVectorView >> at: index put: value [

	^ store signedLongAt: start + (index - 1 * stride) put: value
]
