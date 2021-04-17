Class {
	#name : #FloatVectorView,
	#superclass : #VectorView,
	#category : #'3DTransform-Views',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 1/21/2021 18:22'
}
FloatVectorView class >> storeClass [

	^ Float32Array
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 23:11'
}
FloatVectorView >> at: index [

	^ store floatAt: start + (index - 1 * stride)
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 23:11'
}
FloatVectorView >> at: index put: value [

	^ store floatAt: start + (index - 1 * stride) put: value
]
