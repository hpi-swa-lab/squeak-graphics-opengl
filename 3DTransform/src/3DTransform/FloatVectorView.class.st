Class {
	#name : #FloatVectorView,
	#superclass : #VectorView,
	#category : #'3DTransform-Views'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/21/2021 18:22'
}
FloatVectorView class >> storeClass [

	^ Float32Array
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:10'
}
FloatVectorView >> at: index [

	self flag: #todo. "floatAt: is not index based anymore"
	^ store floatAt: start + (index - 1 * stride)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:14'
}
FloatVectorView >> at: index put: value [

	self flag: #todo. "floatAt:put: is not index based anymore"
	^ store floatAt: start + (index - 1 * stride) put: value
]
