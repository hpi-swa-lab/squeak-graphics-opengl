"
I am an array of Matrices.
"
Class {
	#name : #MatrixArray,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
MatrixArray >> size [
	"Return the number of primitive vertices that can be stored in the receiver"
	^self basicSize // self contentsSize
]
