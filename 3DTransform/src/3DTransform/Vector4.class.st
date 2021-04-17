"
I represent 3D points in homogenous coordinates.
"
Class {
	#name : #Vector4,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 class >> from: anArray [

	^ self x: (anArray at:1) y: (anArray at:2) z: (anArray at:3) w:(anArray at:4).
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 class >> numElements [
	^4
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 class >> x: x y: y z: z [

	^ self x: x y: y z: z w: 1.0
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 class >> x: x y: y z: z w: w [
	^self new x: x y: y z: z w: w
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 class >> zero [
	^self new
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> asVector3 [

	| wValue |
	wValue := self w.
	wValue = 0.0 ifTrue: [^ Vector3 zero].
	^ Vector3
		x: self x / wValue
		y: self y / wValue
		z: self z / wValue
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> asVector4 [
	^self
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> asVectorColor [

	^ VectorColor r: self x g: self y b: self z a: self w.

]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> privateLoadFrom: srcObject [
	self x: srcObject x y: srcObject y z: srcObject z w: srcObject w.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> w [
	^self at: 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> w: aFloat [
	self at: 4 put: aFloat
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> x [
	^self at: 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> x: aFloat [
	self at: 1 put: aFloat
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> x: x y: y z: z w: w [
	self x: x.
	self y: y.
	self z: z.
	self w: w.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> y [
	^self at: 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> y: aFloat [
	self at: 2 put: aFloat
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> z [
	^self at: 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Vector4 >> z: aFloat [
	self at: 3 put: aFloat
]
