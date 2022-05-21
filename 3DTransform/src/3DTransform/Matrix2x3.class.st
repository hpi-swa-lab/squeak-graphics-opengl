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
		'c1r1',
		'c2r1',
		'c3r1',
		'c1r2',
		'c2r2',
		'c3r2'
	],
	#classVars : [
		'Identity',
		'Zero'
	],
	#category : #'3DTransform'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> identity [

	^ Identity shallowCopy
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> initialize [

	Identity := self basicNew setIdentity.
	Zero := self basicNew setZero
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> new [

	^ self zero
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/22/2022 22:23'
}
Matrix2x3 class >> withAngle: radians [

	^ self identity setAngle: radians
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withOffset: aScalar [

	^ self identity setOffset: aScalar asPoint
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/22/2022 22:23'
}
Matrix2x3 class >> withRotation: degrees [

	^ self identity setAngle: degrees degreesToRadians
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> withScale: aScalar [

	^ self identity setScale: aScalar asPoint
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 class >> zero [

	^ Zero shallowCopy
]

{
	#category : #composing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> * m2 [
	"Perform a matrix multiplication."
	^ self composedWithLocal: m2
]

{
	#category : #composing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> *= m2 [
	"Perform a matrix multiplication."
	self composeWithLocal: m2
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:56'
}
Matrix2x3 >> = aMatrix2x3 [

	self == aMatrix2x3 ifTrue: [^ true].
	self species == aMatrix2x3 species ifFalse: [^ false].
	c1r1 = aMatrix2x3 c1r1 ifFalse: [^ false].
	c2r1 = aMatrix2x3 c2r1 ifFalse: [^ false].
	c3r1 = aMatrix2x3 c3r1 ifFalse: [^ false].
	c1r2 = aMatrix2x3 c1r2 ifFalse: [^ false].
	c2r2 = aMatrix2x3 c2r2 ifFalse: [^ false].
	c3r2 = aMatrix2x3 c3r2 ifFalse: [^ false].
	^ true
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:52'
}
Matrix2x3 >> a11 [

	^ c1r1
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a11: anObject [

	c1r1 := anObject.
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> a12 [

	^ c2r1
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a12: anObject [

	c2r1 := anObject.
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> a13 [

	^ c3r1
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a13: anObject [

	c3r1 := anObject.
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> a21 [

	^ c1r2
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a21: anObject [

	c1r2 := anObject.
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> a22 [

	^ c2r2
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a22: anObject [

	c2r2 := anObject.
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> a23 [

	^ c3r2
]

{
	#category : #'accessing-compat',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> a23: anObject [

	c3r2 := anObject.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> asMatrix2x3 [

	^ self
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> asMatrix4x4 [

	| m |
	m := Matrix4x4 identity.
	m a11: c1r1.
	m a12: c2r1.
	m a21: c1r2.
	m a22: c2r2.
	m a14: c3r1.
	m a24: c3r2.
	^ m
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> asMatrixTransform2x3 [

	^ MatrixTransform2x3 new
		a11: c1r1;
		a12: c2r1;
		a13: c3r1;
		a21: c1r2;
		a22: c2r2;
		a23: c3r2;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c1r1 [

	^ c1r1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c1r1: anObject [

	c1r1 := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c1r2 [

	^ c1r2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c1r2: anObject [

	c1r2 := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c2r1 [

	^ c2r1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c2r1: anObject [

	c2r1 := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c2r2 [

	^ c2r2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c2r2: anObject [

	c2r2 := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c3r1 [

	^ c3r1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c3r1: anObject [

	c3r1 := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c3r2 [

	^ c3r2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> c3r2: anObject [

	c3r2 := anObject.
]

{
	#category : #composing,
	#'squeak_changestamp' : 'stlu 5/20/2022 14:03'
}
Matrix2x3 >> composeWithLocal: rightMatrix [
	"Compose the receiver with the local transformation passed in."
	| rc1r1 rc2r1 rc3r1 rc1r2 rc2r2 rc3r2 tmp |
	rc1r1 := rightMatrix c1r1.
	rc2r1 := rightMatrix c2r1.
	rc3r1 := rightMatrix c3r1.
	rc1r2 := rightMatrix c1r2.
	rc2r2 := rightMatrix c2r2.
	rc3r2 := rightMatrix c3r2.
	c3r1 := c3r1 + (c1r1 * rc3r1) + (c2r1 * rc3r2).
	c3r2 := c3r2 + (c1r2 * rc3r1) + (c2r2 * rc3r2).
	tmp := c1r1.
	c1r1 := (tmp * rc1r1) + (c2r1 * rc1r2).
	c2r1 := (tmp * rc2r1) + (c2r1 * rc2r2).
	tmp := c1r2.
	c1r2 := (tmp * rc1r1) + (c2r2 * rc1r2).
	c2r2 := (tmp * rc2r1) + (c2r2 * rc2r2).
]

{
	#category : #composing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> composedWithLocal: aTransformation [
	"Return the composition of the receiver and the local transformation passed in"
	^ self shallowCopy composeWithLocal: aTransformation asMatrix2x3
]

{
	#category : #'transforming rects',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:45'
}
Matrix2x3 >> globalBounds: globalRect toLocal: localRect [
	"not the prettiest method, but quite a bit faster than super"
	| minX minY maxX maxY pt |
	self isPureTranslation ifTrue: [
		"atm most transforms in use are pure translations, making this fast path well worth it"
		^ localRect
			setOrigin: (self globalPointToLocal: globalRect topLeft)
			corner: (self globalPointToLocal: globalRect bottomRight)].
	
	pt := self globalPointToLocal: globalRect topLeft.
	minX := maxX := pt x.
	minY := maxY := pt y.
	
	pt := self globalPointToLocal: globalRect topRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self globalPointToLocal: globalRect bottomRight.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	pt := self globalPointToLocal: globalRect bottomLeft.
	minX := minX min: pt x.
	maxX := maxX max: pt x.
	minY := minY min: pt y.
	maxY := maxY max: pt y.
	
	^ localRect left: minX right: maxX top: minY bottom: maxY
]

{
	#category : #'transforming rects',
	#'squeak_changestamp' : 'stlu 5/13/2022 13:18'
}
Matrix2x3 >> globalBoundsToLocal: aRectangle [

	^ self globalBounds: aRectangle toLocal: Rectangle new
]

{
	#category : #'transforming points',
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> globalPointToLocal: aPoint [
	"Transform aPoint from global coordinates into local coordinates"
	| x y det |
	det := (c1r1 * c2r2) - (c2r1 * c1r2).
	det = 0.0 ifTrue: [^ 0.0@0.0]. "So we have at least a valid result"
	x := aPoint x asFloat - c3r1.
	y := aPoint y asFloat - c3r2.
	^ (((x * c2r2) - (c2r1 * y)) / det)
		@ (((c1r1 * y) - (x * c1r2)) / det)
]

{
	#category : #'transforming points',
	#'squeak_changestamp' : 'stlu 5/20/2022 14:09'
}
Matrix2x3 >> globalToLocalX: x y: y [
	"Transform the point x@y from global coordinates into local coordinates"
	| fx fy det |
	det := (c1r1 * c2r2) - (c2r1 * c1r2).
	det = 0.0 ifTrue: [^ 0.0@0.0]. "So we have at least a valid result"
	fx := x asFloat - c3r1.
	fy := y asFloat - c3r2.
	^ (((fx * c2r2) - (c2r1 * fy)) / det)
		@ (((c1r1 * fy) - (fx * c1r2)) / det)
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> hash [

	^ (((((self species hash
		bitXor: c1r1 hash)
			bitXor: c2r1 hash)
				bitXor: c3r1 hash)
					bitXor: c1r2 hash)
						bitXor: c2r2 hash)
							bitXor: c3r2 hash
]

{
	#category : #transforming,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> inverseTransformation [
	"Answers the inverse transformation of the receiver."
	^ self shallowCopy invert
]

{
	#category : #transforming,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> invert [
	"The inverse transformation is computed by first calculating
	the inverse offset and then computing transformations
	for the two identity vectors (1@0) and (0@1)"
	| r1 r2 r3 |
	r3 := self globalPointToLocal: 0.0 @ 0.0.
	r1 := (self globalPointToLocal: 1.0 @ 0.0) - r3.
	r2 := (self globalPointToLocal: 0.0 @ 1.0) - r3.
	c1r1 := r1 x. c2r1 := r2 x. c3r1 := r3 x.
	c1r2 := r1 y. c2r2 := r2 y. c3r2 := r3 y
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> isIdentity [

	0.0 = c3r1 ifFalse: [^ false].
	0.0 = c3r2 ifFalse: [^ false].
	1.0 = c1r1 ifFalse: [^ false].
	1.0 = c2r2 ifFalse: [^ false].
	0.0 = c2r1 ifFalse: [^ false].
	^ 0.0 = c1r2
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Matrix2x3 >> isMatrix2x3 [

	^ true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> isPureTranslation [

	1.0 = c1r1 ifFalse: [^ false].
	1.0 = c2r2 ifFalse: [^ false].
	0.0 = c2r1 ifFalse: [^ false].
	^ 0.0 = c1r2
]

{
	#category : #'transforming rects',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
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
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> localPointToGlobal: aPoint [
	"Transform aPoint from local coordinates into global coordinates"
	| x y |
	x := aPoint x asFloat.
	y := aPoint y asFloat.
	^ (c3r1 + (x * c1r1) + (y * c2r1))
		@ (c3r2 + (x * c1r2) + (y * c2r2))
]

{
	#category : #'transforming points',
	#'squeak_changestamp' : 'stlu 5/20/2022 14:09'
}
Matrix2x3 >> localToGlobalX: x y: y [
	"Transform the point x@y from local coordinates into global coordinates"
	| fx fy |
	fx := x asFloat.
	fy := y asFloat.
	^ (c3r1 + (fx * c1r1) + (fy * c2r1))
		@ (c3r2 + (fx * c1r2) + (fy * c2r2))
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> offset [

	^ c3r1 @ c3r2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:55'
}
Matrix2x3 >> offset: aScalar [

	self setOffset: aScalar asPoint.
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPut: $(;
		print: c1r1; tab; print: c2r1; tab; print: c3r1;
		cr; print: c1r2; tab; print: c2r2; tab; print: c3r2;
		nextPut:$).
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> setAngle: radians [
	"Set the raw rotation angle in the receiver"
	| s c |
	s := radians sin.
	c := radians cos.
	c1r1 := c. c2r1 := s negated.
	c1r2 := s. c2r2 := c.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> setIdentity [

	c1r1 := 1.0. c2r1 := 0.0. c3r1 := 0.0.
	c1r2 := 0.0. c2r2 := 1.0. c3r2 := 0.0
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> setOffset: aPoint [
	"Set the raw offset in the receiver"
	c3r1 := aPoint x asFloat.
	c3r2 := aPoint y asFloat
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:53'
}
Matrix2x3 >> setScale: aPoint [
	"Set the raw scale in the receiver"
	c1r1 := aPoint x asFloat.
	c2r2 := aPoint y asFloat
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 14:03'
}
Matrix2x3 >> setTo: aMatrix2x3 [

	c1r1 := aMatrix2x3 c1r1.
	c2r1 := aMatrix2x3 c2r1.
	c3r1 := aMatrix2x3 c3r1.
	c1r2 := aMatrix2x3 c1r2.
	c2r2 := aMatrix2x3 c2r2.
	c3r2 := aMatrix2x3 c3r2.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> setToMorphicTransform: aMorphicTransform [

	| radians scale scaleX scaleY sin cos offset |
	radians := aMorphicTransform angle "negated".
	0.0 = radians
		ifTrue: [
			sin := 0.0.
			cos := 1.0]
		ifFalse: [
			sin := radians sin negated.
			cos := radians cos].
	(scale := aMorphicTransform scale) isPoint
		ifTrue: [
			scaleX := scale x asFloat.
			scaleY := scale y asFloat]
		ifFalse: [
			scaleX := scaleY := scale asFloat].
	c1r1 := scaleX * cos.
	c2r1 := scaleY * sin negated.
	c1r2 := scaleX * sin.
	c2r2 := scaleY * cos.
	offset := aMorphicTransform offset.
	c3r1 := offset x negated asFloat.
	c3r2 := offset y negated asFloat.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> setZero [

	c1r1 := 0.0. c2r1 := 0.0. c3r1 := 0.0.
	c1r2 := 0.0. c2r2 := 0.0. c3r2 := 0.0
]

{
	#category : #transforming,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> translateBy: aPoint [

	| x y |
	x := aPoint x asFloat.
	y := aPoint y asFloat.
	c3r1 := c1r1 * x + (c2r1 * y) + c3r1.
	c3r2 := c1r2 * x + (c2r2 * y) + c3r2.
]

{
	#category : #transforming,
	#'squeak_changestamp' : 'stlu 4/22/2022 21:22'
}
Matrix2x3 >> translatedBy: aPoint [

	^ self shallowCopy translateBy: aPoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/20/2022 13:54'
}
Matrix2x3 >> translation [
	"Only accurate if #isPureTranslation returns true."
	^ c3r1 @ c3r2
]
