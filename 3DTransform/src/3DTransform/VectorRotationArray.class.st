"
I am an array of Quaternions.
"
Class {
	#name : #VectorRotationArray,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorRotationArray class >> contentsClass [
	^Quaternion
]
