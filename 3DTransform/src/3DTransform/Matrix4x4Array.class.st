"
I am an array of Matrix4x4Arrays.
"
Class {
	#name : #Matrix4x4Array,
	#superclass : #MatrixArray,
	#type : #words,
	#classVars : [
		'Zero4x4Matrix'
	],
	#category : #'3DTransform-Arrays',
	#commentStamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4Array class >> contentsClass [
	^Matrix4x4
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4Array class >> initialize [
	"Matrix4x4Array initialize"
	Zero4x4Matrix := Matrix4x4 new.
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4Array >> addMatrix: mat [
	1 to: self size do:[:i | self at: i put: (self at: i)+mat.].
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4Array >> contentsClass [
	^Matrix4x4
]

{
	#category : #'as yet unclassified',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4Array >> contentsSize [
	^16
]
