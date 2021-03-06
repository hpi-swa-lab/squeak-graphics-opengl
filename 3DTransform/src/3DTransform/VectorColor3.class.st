Class {
	#name : #VectorColor3,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 class >> numElements [
	^3
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 class >> r: rValue g: gValue b: bValue [
	^self new r: rValue g: gValue b: bValue
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 class >> red: r green: g blue: b [ 
	"Create an initialize a color vector."

	| newColor |
	newColor := VectorColor3 new.

	newColor red: r.
	newColor green: g.
	newColor blue: b.

	^ newColor.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> a [

	^ 1.0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> alpha [

	^ 1.0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> alpha: a [

 "do nothing"
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asColor [
	^Color r: self red g: self green b: self blue alpha: self alpha
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asVector3 [

	^Vector3 x: self r y: self g z: self b
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asVector4 [

	^Vector4 x: self r y: self g z: self b w: self a.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asVectorColor [

	^VectorColor r: self r g: self g b: self b a:self a.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asVectorColor3 [

	^self
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> asVectorColor4 [

	^VectorColor r: self r g: self g b: self b a:self a.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor3 >> b [

	^ self componentAt: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
VectorColor3 >> blue [

	^ self componentAt: 3
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:17'
}
VectorColor3 >> blue: aNumber [

	self componentAt: 3 put: aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:12'
}
VectorColor3 >> g [

	^ self componentAt: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:12'
}
VectorColor3 >> green [

	^ self componentAt: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:17'
}
VectorColor3 >> green: aNumber [

	self componentAt: 2 put: aNumber.
]

{
	#category : #interpolating,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> interpolateTo: end at: amountDone [
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
VectorColor3 >> isZero [
	^self alpha isZero
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> pixelValue32 [
	^self asColor pixelWordForDepth: 32
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> privateLoadFrom: srcObject [
	| color |
	color := srcObject asColor.
	self red: color red.
	self green: color green.
	self blue: color blue.
	self alpha: color alpha.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:12'
}
VectorColor3 >> r [

	^ self componentAt: 1
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> r: rValue g: gValue b: bValue [
	self red: rValue.
	self green: gValue.
	self blue: bValue.

]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
VectorColor3 >> r: rValue g: gValue b: bValue a: aValue [
	self red: rValue.
	self green: gValue.
	self blue: bValue.
	self alpha: aValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:12'
}
VectorColor3 >> red [

	^ self componentAt: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:17'
}
VectorColor3 >> red: aNumber [

	self componentAt: 1 put: aNumber.
]
