Class {
	#name : #VectorColor3Array,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor3Array class >> contentsClass [
	^VectorColor3
]

{
	#category : #'special ops',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor3Array >> += aColor [
	"Add the given color to all the elements in the receiver"
	| r g b |
	r := aColor red.
	g := aColor green.
	b := aColor blue.
	1 to: self basicSize by: 4 do:[:i|
		self floatAt: i put: (self floatAt: i) + r.
		self floatAt: i+1 put: (self floatAt: i+1) + g.
		self floatAt: i+2 put: (self floatAt: i+2) + b.
	].
]

{
	#category : #'special ops',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor3Array >> add: aColor4 at: index [
	| baseIdx |
	baseIdx := index-1*4.
	self floatAt: baseIdx+1 put: (self floatAt: baseIdx+1) + aColor4 red.
	self floatAt: baseIdx+2 put: (self floatAt: baseIdx+2) + aColor4 green.
	self floatAt: baseIdx+3 put: (self floatAt: baseIdx+3) + aColor4 blue.

]

{
	#category : #'special ops',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor3Array >> clampAllFrom: minValue to: maxValue [
	"Clamp all elements in the receiver to be in the range (minValue, maxValue)"
	| value |
	1 to: self basicSize do:[:i|
		value := self floatAt: i.
		value := value min: maxValue.
		value := value max: minValue.
		self floatAt: i put: value.
	].
]

{
	#category : #'special ops',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor3Array >> fillWith: anInteger [
	<primitive: 145>
	self primitiveFailed
]
