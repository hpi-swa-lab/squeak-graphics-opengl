"
I am an inplace storage area for Color4 items used during lighting and shading.
"
Class {
	#name : #VectorColor4Array,
	#superclass : #VectorArray,
	#type : #words,
	#category : #'3DTransform-Arrays'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor4Array class >> contentsClass [
	^VectorColor
]

{
	#category : #'special ops',
	#'squeak_changestamp' : 'stlu 8/12/2021 18:07'
}
VectorColor4Array >> += aColor [
	"Add the given color to all the elements in the receiver"
	| r g b a |
	r := aColor red.
	g := aColor green.
	b := aColor blue.
	a := aColor alpha.
	1 to: self basicSize by: 4 do: [:i |
		self componentAt: i put: (self componentAt: i) + r.
		self componentAt: i+1 put: (self componentAt: i+1) + g.
		self componentAt: i+2 put: (self componentAt: i+2) + b.
		self componentAt: i+3 put: (self componentAt: i+3) + a].
]

{
	#category : #'special ops',
	#'squeak_changestamp' : 'stlu 8/12/2021 18:07'
}
VectorColor4Array >> add: aColor4 at: index [
	| baseIdx |
	baseIdx := index-1*4.
	self componentAt: baseIdx+1 put: (self componentAt: baseIdx+1) + aColor4 red.
	self componentAt: baseIdx+2 put: (self componentAt: baseIdx+2) + aColor4 green.
	self componentAt: baseIdx+3 put: (self componentAt: baseIdx+3) + aColor4 blue.
	self componentAt: baseIdx+4 put: (self componentAt: baseIdx+4) + aColor4 alpha.

]

{
	#category : #'special ops',
	#'squeak_changestamp' : 'stlu 8/12/2021 18:08'
}
VectorColor4Array >> clampAllFrom: minValue to: maxValue [
	"Clamp all elements in the receiver to be in the range (minValue, maxValue)"
	1 to: self basicSize do: [:i |
		| value |
		value := self componentAt: i.
		value := value min: maxValue.
		value := value max: minValue.
		self componentAt: i put: value].
]

{
	#category : #'special ops',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor4Array >> fillWith: anInteger [
	<primitive: 145>
	self primitiveFailed
]
