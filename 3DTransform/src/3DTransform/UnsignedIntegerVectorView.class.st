Class {
	#name : #UnsignedIntegerVectorView,
	#superclass : #VectorView,
	#category : #'3DTransform-Views',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:46'
}
UnsignedIntegerVectorView class >> storeClass [

	^ WordArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:41'
}
UnsignedIntegerVectorView >> at: index [

	^ store unsignedLongAt: start + (index - 1 * stride)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 13:41'
}
UnsignedIntegerVectorView >> at: index put: value [

	^ store unsignedLongAt: start + (index - 1 * stride) put: value
]
