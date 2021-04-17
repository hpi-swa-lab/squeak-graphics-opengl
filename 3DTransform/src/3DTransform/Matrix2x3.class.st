"
I am an adaptation of `MatrixTransform2x3` that does not use any VM plugins.
For much faster access to my components, I store them as separate instance variables instead of as fields in a FloatArray, unlike `MatrixTransform2x3`.

Why 2x3, not 3x3?
Bottom row is always the same when multiplying:
```
c := a * b
				b11 b12 b13
				b21 b22 b23
				0      0     1

a11 a12 a13	c11 c12 c13
a21 a22 a23	c21 c22 c23
0     0    1		0      0     1
```
"
Class {
	#name : #Matrix2x3,
	#superclass : #DisplayTransform,
	#instVars : [
		'a11',
		'a12',
		'a13',
		'a21',
		'a22',
		'a23'
	],
	#classVars : [
		'Identity',
		'Zero'
	],
	#category : #'3DTransform',
	#commentStamp : 'stlu 9/1/2020 17:53'
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> identity [

	^ Identity shallowCopy
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> initialize [

	Identity := self basicNew setIdentity.
	Zero := self basicNew setZero
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> new [

	^ self zero
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withAngle: degrees [

	^ self identity setAngle: degrees
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withOffset: aScalar [

	^ self identity setOffset: aScalar asPoint
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withRotation: degrees [

	^ self withAngle: degrees
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withScale: aScalar [

	^ self identity setScale: aScalar asPoint
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> zero [

	^ Zero shallowCopy
]

{
	#category : #composing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> * m2 [
	"Perform a matrix multiplication."
	^ self composedWithLocal: m2
]

{
	#category : #composing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> *= m2 [
	"Perform a matrix multiplication."
	self composeWithLocal: m2
]

{
	#category : #comparing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> = aMatrix2x3 [

	self == aMatrix2x3 ifTrue: [^ true].
	self species == aMatrix2x3 species ifFalse: [^ false].
	a11 = aMatrix2x3 a11 ifFalse: [^ false].
	a12 = aMatrix2x3 a12 ifFalse: [^ false].
	a13 = aMatrix2x3 a13 ifFalse: [^ false].
	a21 = aMatrix2x3 a21 ifFalse: [^ false].
	a22 = aMatrix2x3 a22 ifFalse: [^ false].
	a23 = aMatrix2x3 a23 ifFalse: [^ false].
	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a11 [

	^ a11
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a11: anObject [

	a11 := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a12 [

	^ a12
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a12: anObject [

	a12 := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a13 [

	^ a13
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a13: anObject [

	a13 := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a21 [

	^ a21
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a21: anObject [

	a21 := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a22 [

	^ a22
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a22: anObject [

	a22 := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a23 [

	^ a23
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> a23: anObject [

	a23 := anObject
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> asMatrix2x3 [

	^ self
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> asMatrix4x4 [

	| m |
	m := Matrix4x4 new.
	m a11: a11.
	m a12: a12.
	m a21: a21.
	m a22: a22.
	m a14: a13.
	m a24: a23.
	m a33: 1.0.
	m a44: 1.0.
	^ m
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> asMatrixTransform2x3 [

	^ MatrixTransform2x3 new
		a11: a11;
		a12: a12;
		a13: a13;
		a21: a21;
		a22: a22;
		a23: a23;
		yourself
]

{
	#category : #composing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> composeWithLocal: aMatrix2x3 [
	"Compose the receiver with the local transformation passed in."
	| b11 b12 b13 b21 b22 b23 tmp |
	b11 := aMatrix2x3 a11.
	b12 := aMatrix2x3 a12.
	b13 := aMatrix2x3 a13.
	b21 := aMatrix2x3 a21.
	b22 := aMatrix2x3 a22.
	b23 := aMatrix2x3 a23.
	a13 := a13 + (a11 * b13) + (a12 * b23).
	a23 := a23 + (a21 * b13) + (a22 * b23).
	tmp := a11.
	a11 := (tmp * b11) + (a12 * b21).
	a12 := (tmp * b12) + (a12 * b22).
	tmp := a21.
	a21 := (tmp * b11) + (a22 * b21).
	a22 := (tmp * b12) + (a22 * b22)
	
]

{
	#category : #composing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> composedWithLocal: aTransformation [
	"Return the composition of the receiver and the local transformation passed in"
	^ self shallowCopy composeWithLocal: aTransformation asMatrix2x3
]

{
	#category : #'transforming rects',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> globalBoundsToLocal: aRectangle [
	"not the prettiest method, but quite a bit faster than super"
	| minX minY maxX maxY pt |
	self isPureTranslation ifTrue: [
		"atm most transforms in use are pure translations, making this fast path well worth it"
		^ (self globalPointToLocal: aRectangle topLeft)
			corner: (self globalPointToLocal: aRectangle bottomRight)].
	
	pt := self globalPointToLocal: aRectangle topLeft.
	minX := maxX := pt x.
	minY := maxY := pt y.
	
	pt := self globalPointToLocal: aRectangle topRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self globalPointToLocal: aRectangle bottomRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self globalPointToLocal: aRectangle bottomLeft.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	^ Rectangle origin: (minX @ minY) corner: (maxX @ maxY)
]

{
	#category : #'transforming points',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> globalPointToLocal: aPoint [
	"Transform aPoint from global coordinates into local coordinates"
	| x y det |
	det := (a11 * a22) - (a12 * a21).
	det = 0.0 ifTrue: [^ 0.0@0.0]. "So we have at least a valid result"
	x := aPoint x asFloat - a13.
	y := aPoint y asFloat - a23.
	^ (((x * a22) - (a12 * y)) / det)
		@ (((a11 * y) - (x * a21)) / det)
]

{
	#category : #comparing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> hash [

	^ (((((self species hash
		bitXor: a11 hash)
			bitXor: a12 hash)
				bitXor: a13 hash)
					bitXor: a21 hash)
						bitXor: a22 hash)
							bitXor: a23 hash
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> inverseTransformation [
	"Answers the inverse transformation of the receiver."
	^ self shallowCopy invert
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> invert [
	"The inverse transformation is computed by first calculating
	the inverse offset and then computing transformations
	for the two identity vectors (1@0) and (0@1)"
	| r1 r2 r3 |
	r3 := self globalPointToLocal: 0.0 @ 0.0.
	r1 := (self globalPointToLocal: 1.0 @ 0.0) - r3.
	r2 := (self globalPointToLocal: 0.0 @ 1.0) - r3.
	a11 := r1 x. a12 := r2 x. a13 := r3 x.
	a21 := r1 y. a22 := r2 y. a23 := r3 y
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> isIdentity [

	a13 = 0.0 ifFalse: [^ false].
	a23 = 0.0 ifFalse: [^ false].
	a11 = 1.0 ifFalse: [^ false].
	a22 = 1.0 ifFalse: [^ false].
	a12 = 0.0 ifFalse: [^ false].
	^ a21 = 0.0
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> isMatrix2x3 [

	^ true
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> isPureTranslation [

	a11 = 1.0 ifFalse: [^ false].
	a22 = 1.0 ifFalse: [^ false].
	a12 = 0.0 ifFalse: [^ false].
	^ a21 = 0.0
]

{
	#category : #'transforming rects',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> localBoundsToGlobal: aRectangle [
	"not the prettiest method, but quite a bit faster than super"
	| minX minY maxX maxY pt |
	self isPureTranslation ifTrue: [
		"atm most transforms in use are pure translations, making this fast path well worth it"
		^ (self localPointToGlobal: aRectangle topLeft)
			corner: (self localPointToGlobal: aRectangle bottomRight)].
	
	pt := self localPointToGlobal: aRectangle topLeft.
	minX := maxX := pt x.
	minY := maxY := pt y.
	
	pt := self localPointToGlobal: aRectangle topRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self localPointToGlobal: aRectangle bottomRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self localPointToGlobal: aRectangle bottomLeft.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	^ Rectangle origin: (minX @ minY) corner: (maxX @ maxY)
]

{
	#category : #'transforming points',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> localPointToGlobal: aPoint [
	"Transform aPoint from local coordinates into global coordinates"
	| x y |
	x := aPoint x asFloat.
	y := aPoint y asFloat.
	^ (a13 + (x * a11) + (y * a12))
		@ (a23 + (x * a21) + (y * a22))
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> offset [

	^ a13 @ a23
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> offset: aScalar [

	self setOffset: aScalar asPoint
]

{
	#category : #printing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: a11; tab; print: a12; tab; print: a13;
		cr; print: a21; tab; print: a22; tab; print: a23;
		nextPut:$).
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> setAngle: degrees [
	"Set the raw rotation angle in the receiver"
	| rad s c |
	rad := degrees degreesToRadians.
	s := rad sin.
	c := rad cos.
	a11 := c. a12 := s negated.
	a21 := s. a22 := c
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> setIdentity [

	a11 := 1.0. a12 := 0.0. a13 := 0.0.
	a21 := 0.0. a22 := 1.0. a23 := 0.0
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> setOffset: aPoint [
	"Set the raw offset in the receiver"
	a13 := aPoint x asFloat.
	a23 := aPoint y asFloat
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> setScale: aPoint [
	"Set the raw scale in the receiver"
	a11 := aPoint x asFloat.
	a22 := aPoint y asFloat
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> setZero [

	a11 := 0.0. a12 := 0.0. a13 := 0.0.
	a21 := 0.0. a22 := 0.0. a23 := 0.0
]
