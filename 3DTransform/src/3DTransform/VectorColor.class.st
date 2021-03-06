"
I represent an RGBA color value in floating point format. I am used during the lighting and shading computations.
"
Class {
	#name : #VectorColor,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor class >> numElements [
	^4
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor class >> r: rValue g: gValue b: bValue [
	^self new r: rValue g: gValue b: bValue a: 1.0
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor class >> r: rValue g: gValue b: bValue a: aValue [
	^self new r: rValue g: gValue b: bValue a: aValue
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> a [

	^ self componentAt: 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> alpha [

	^ self componentAt: 4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
VectorColor >> alpha: aNumber [

	self componentAt: 4 put: aNumber.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> asColor [
	^Color r: self red g: self green b: self blue alpha: self alpha
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVector3 [

	^Vector3 x: self r y: self g z: self b
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVector4 [

	^Vector4 x: self r y: self g z: self b w: self a.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> asVectorColor [

	^self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> b [

	^ self componentAt: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> blue [

	^ self componentAt: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
VectorColor >> blue: aNumber [

	self componentAt: 3 put: aNumber.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> copyFrom: array [

	| sz |
	sz := self size min: array size.
	1 to: sz do:[:index | self at:index put: (array at: index)].
	array size = 3 ifTrue:[self at:4 put:1.0].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> g [

	^ self componentAt: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> green [

	^ self componentAt: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:17'
}
VectorColor >> green: aNumber [

	self componentAt: 2 put: aNumber.
]

{
	#category : #interpolating,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> isZero [
	^self alpha isZero
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> pixelValue32 [
	^self asColor pixelWordForDepth: 32
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> r [

	^ self componentAt: 1
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor >> r: rValue g: gValue b: bValue a: aValue [
	self red: rValue.
	self green: gValue.
	self blue: bValue.
	self alpha: aValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor >> red [

	^ self componentAt: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:17'
}
VectorColor >> red: aNumber [

	self componentAt: 1 put: aNumber.
]
