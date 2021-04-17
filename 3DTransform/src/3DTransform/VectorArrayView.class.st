Class {
	#name : #VectorArrayView,
	#superclass : #ArrayedCollection,
	#instVars : [
		'startVector',
		'size',
		'stride'
	],
	#category : #'3DTransform-Views',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/21/2021 16:25'
}
VectorArrayView class >> startVector: aVector size: size stride: stride [

	^ self basicNew
		startVector: aVector;
		size: size;
		stride: stride;
		initialize
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:06'
}
VectorArrayView >> at: index [

	^ startVector copyWithOffset: index - 1 * stride
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:07'
}
VectorArrayView >> at: index put: value [

	^ (startVector copyWithOffset: index - 1 * stride) setTo: value
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> size [

	^ size
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> size: anObject [

	size := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> startVector [

	^ startVector
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> startVector: anObject [

	startVector := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> stride [

	^ stride
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 00:08'
}
VectorArrayView >> stride: anObject [

	stride := anObject
]

{
	#category : #converting,
	#timestamp : 'stlu 1/21/2021 16:31'
}
VectorArrayView >> transposed [

	| newStartVector |
	newStartVector := startVector shallowCopy
						size: size;
						stride: stride.
	^ self species
		startVector: newStartVector
		size: startVector size
		stride: startVector stride
]
