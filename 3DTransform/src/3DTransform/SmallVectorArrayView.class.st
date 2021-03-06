Class {
	#name : #SmallVectorArrayView,
	#superclass : #VectorArrayView,
	#instVars : [
		'vectors'
	],
	#category : #'3DTransform-Views'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/21/2021 16:28'
}
SmallVectorArrayView >> at: index [

	^ vectors at: index
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/21/2021 16:29'
}
SmallVectorArrayView >> at: index put: value [

	^ (vectors at: index) setTo: value
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 1/21/2021 16:28'
}
SmallVectorArrayView >> initialize [

	vectors := Array new: self size.
	1 to: vectors size do: [:i |
		vectors at: i put: (super at: i)]
]
