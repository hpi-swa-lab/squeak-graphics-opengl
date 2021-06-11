"
I am an array of Quaternions.
"
Class {
	#name : #VectorRotationArray,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorRotationArray class >> contentsClass [
	^Quaternion
]
