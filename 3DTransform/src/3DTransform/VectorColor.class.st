"
I represent an RGBA color value in floating point format. I am used during the lighting and shading computations.
"
Class {
	#name : #VectorColor,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor class >> numElements [
	^4
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor class >> r: rValue g: gValue b: bValue [
	^self new r: rValue g: gValue b: bValue a: 1.0
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor class >> r: rValue g: gValue b: bValue a: aValue [
	^self new r: rValue g: gValue b: bValue a: aValue
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor class >> red: r green: g blue: b alpha: a [
	"Create an initialize a color vector."

	| newColor |
	newColor := VectorColor new.

	newColor red: r.
	newColor green: g.
	newColor blue: b.
	newColor alpha: a.

	^ newColor.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> a [
	^self floatAt: 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> alpha [
	^self floatAt: 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> alpha: aNumber [
	self floatAt: 4 put: aNumber
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> asColor [
	^Color r: self red g: self green b: self blue alpha: self alpha
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVector3 [

	^Vector3 x: self r y: self g z: self b
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVector4 [

	^Vector4 x: self r y: self g z: self b w: self a.
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVectorColor [

	^self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> b [
	^self floatAt: 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> blue [
	^self floatAt: 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> blue: aNumber [
	self floatAt: 3 put: aNumber
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> copyFrom: array [

	| sz |
	sz := self size min: array size.
	1 to: sz do:[:index | self at:index put: (array at: index)].
	array size = 3 ifTrue:[self at:4 put:1.0].
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> g [
	^self floatAt: 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> green [
	^self floatAt: 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> green: aNumber [
	self floatAt: 2 put: aNumber
]

{
	#category : #interpolating,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> interpolateTo: end at: amountDone [
	"Return the color vector yielded by interpolating from the state of the object to the specified end state at the specified amount done"

	| newColor r g b a |
	r := self red.
	g := self green.
	b := self blue.
	a := self alpha.

	newColor := VectorColor new.
	newColor red: r + (((end red) - r) * amountDone).
	newColor green: g + (((end green) - g) * amountDone).
	newColor blue: b + (((end blue) - b) * amountDone).
	newColor alpha: a + (((end alpha) - a) * amountDone).

	^ newColor.

]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> isZero [
	^self alpha isZero
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> pixelValue32 [
	^self asColor pixelWordForDepth: 32
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> privateLoadFrom: srcObject [
	| color |
	color := srcObject asColor.
	self red: color red.
	self green: color green.
	self blue: color blue.
	self alpha: color alpha.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> r [
	^self floatAt: 1
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> r: rValue g: gValue b: bValue a: aValue [
	self red: rValue.
	self green: gValue.
	self blue: bValue.
	self alpha: aValue.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> red [
	^self floatAt: 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
VectorColor >> red: aNumber [
	self floatAt: 1 put: aNumber
]
