"
I am an efficient representation of texture coordinates.
"
Class {
	#name : #Texture2Array,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Texture2Array class >> contentsClass [
	^Vector2
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Texture2Array >> at: index put: value [
	value isPoint
		ifTrue:[super at: index put: (Vector2 u: value x v: value y)]
		ifFalse:[super at: index put: value].
	^value
]
