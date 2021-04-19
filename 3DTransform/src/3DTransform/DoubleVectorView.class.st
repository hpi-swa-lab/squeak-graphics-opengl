Class {
	#name : #DoubleVectorView,
	#superclass : #VectorView,
	#category : #'3DTransform-Views',
	#'squeak_changestamp' : ''
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 12:52'
}
DoubleVectorView class >> storeClass [

	^ Float64Array
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 12:46'
}
DoubleVectorView >> at: index [

	^ store doubleAt: start + (index - 1 * stride)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/22/2021 12:52'
}
DoubleVectorView >> at: index put: value [

	^ store doubleAt: start + (index - 1 * stride) put: value
]
