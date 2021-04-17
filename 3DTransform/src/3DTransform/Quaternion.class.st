"
I represent general 3d rotations by using Unit-Quaternions. Unit-Quaternions are one of the best available representation for rotations in computer graphics because they provide an easy way of doing arithmetic with them and also because they allow us to use spherical linear interpolation (so-called ""slerps"") of rotations.

Indexed Variables:
	a	<Float>	the real part of the quaternion
	b	<Float>	the first imaginary part of the quaternion
	c	<Float>	the second imaginary part of the quaternion
	d	<Float>	the third imaginary part of the quaternion


"
Class {
	#name : #Quaternion,
	#superclass : #Vector,
	#type : #words,
	#classVars : [
		'QuaternionIdentity'
	],
	#category : #'3DTransform-Vectors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> a: aValue b: bValue c: cValue d: dValue [
	^self new a: aValue b: bValue c: cValue d: dValue
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> angle: anAngle axis: aVector3 [
	^self new angle: anAngle axis: aVector3
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> axis: aVector3 angle: anAngle [
	^self angle: anAngle axis: aVector3
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> from: startVector to: endVector [
	^self new from: startVector to: endVector
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> identity [
	^self new setIdentity
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> initialize [
	"Quaternion initialize"
	QuaternionIdentity := self new.
	QuaternionIdentity floatAt: 1 put: 1.0.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> numElements [
	^4
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> radiansAngle: anAngle axis: aVector3 [
	^self new radiansAngle: anAngle axis: aVector3
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion class >> x: xValue y: yValue z: zValue a: anAngle [
	^self new x: xValue y: yValue z: zValue a: anAngle
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> * aRotation [
	"Multiplying two rotations is the same as concatenating the two rotations."
	| v1 v2 v3 vv |
	v1 := self bcd * aRotation a.
	v2 := aRotation bcd * self a.
	v3 := aRotation bcd cross: self bcd.
	vv := v1 + v2 + v3.
	^Quaternion
		a: (self a * aRotation a) - (self bcd dot: aRotation bcd)
		b: vv x
		c: vv y
		d: vv z
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> a [
	^self at: 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> a: aFloat [
	self at: 1 put: aFloat
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> a: aValue b: bValue c: cValue d: dValue [

	self a: aValue.
	self b: bValue.
	self c: cValue.
	self d: dValue.
	(aValue < 0.0) ifTrue:[self *= -1.0].
	self normalize.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> angle [
	^(self a arcCos * 2.0 radiansToDegrees)
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> angle: newAngle [
	self angle: newAngle axis: self axis
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> angle: anAngle axis: aVector3 [

	self radiansAngle: anAngle degreesToRadians axis: aVector3

]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> asMatrix4x4 [
	"Given a quaternion q = (a, [ b, c , d]) the rotation matrix can be calculated as
			|	1 -	2(cc+dd),		2(bc-da),		2(db+ca)	|
		m =	|		2(bc+da),	1 - 	2(bb+dd),		2(cd-ba)		|
			|		2(db-ca),		2(cd+ba),	1 -	2(bb+cc)	|
	"
	| a b c d m bb cc dd bc cd db ba ca da |
	a := self a. b := self b. c := self c. d := self d.
	bb := (b * b).	cc := (c * c).	dd := (d * d).
	bc := (b * c).	cd := (c * d).	db := (d * b).
	ba := (b * a).	ca := (c * a).	da := (d * a).
	m := self matrixClass identity.
	m 
		a11: 1.0 - (cc + dd * 2.0);a12: (bc - da * 2.0); 		a13: (db + ca * 2.0);
		a21: (bc + da * 2.0);		a22: 1.0 - (bb + dd * 2.0);a23: (cd - ba * 2.0);
		a31: (db - ca * 2.0);		a32: (cd + ba * 2.0);		a33: 1.0 - (bb + cc * 2.0).
	^m

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> axis [
	| sinAngle |
	sinAngle := self a arcCos sin.
	sinAngle isZero ifTrue:[^Vector3 zero].
	^Vector3 
		x: (self b / sinAngle)
		y: (self c / sinAngle)
		z: (self d / sinAngle)
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> axis: newAxis [
	self angle: self angle axis: newAxis
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> b [
	^self at: 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> b: aFloat [
	self at: 2 put: aFloat
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> bcd [
	^Vector3 x: self b y: self c z: self d
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> c [
	^self at: 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> c: aFloat [
	self at: 3 put: aFloat
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> d [
	^self at: 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> d: aFloat [
	self at: 4 put: aFloat
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> from: startVector to: endVector [
	"Create a rotation from startVector to endVector.  Vectors should be normalized first.  Note: doesn't work when vectors are 180 degrees to each other."
	| axis cos sin |
	startVector = endVector ifTrue: [^ self setIdentity].

	axis := startVector cross: endVector.
	cos := ((1 + (startVector dot: endVector)) / 2) sqrt.	"half-angle relation"
	sin := cos isZero 
				ifTrue: [
					"180 degree rotation"
					^ self angle: 180 axis: (Vector3 perpendicularTo: startVector)]
				ifFalse: [axis length / 2 / cos].			"double angle relation"
	axis safelyNormalize.
	self a: cos b: axis x * sin c: axis y * sin d: axis z * sin. 
]

{
	#category : #interpolating,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> interpolateTo: aRotation at: t [
	"Spherical linear interpolation (slerp) from the receiver to aQuaternion"
	^self slerpTo: aRotation at: t extraSpins: 0
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> matrixClass [
	^Matrix4x4
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> normalize [
	"Normalize the receiver. Note that the actual angle (a) determining the amount of 
	rotation is fixed, since we do not want to modify angles. This leads to:
		a^2 + b^2 + c^2 + d^2 = 1.
		b^2 + c^2 + d^2 = 1 - a^2.
	Note also that the angle (a) can not exceed 1.0 (due its creation by cosine) and
	if it is 1.0 we have exactly the unit quaternion ( 1, [ 0, 0, 0]).
	"
	| oneMinusASquared length |
	oneMinusASquared := 1.0 - (self a squared).
	(oneMinusASquared < 1.0e-10) ifTrue:[^self setIdentity].
	length := ((self b squared + self c squared + self d squared) / oneMinusASquared) sqrt.
	length = 0.0 ifTrue:[^self setIdentity].
	self b: self b / length.
	self c: self c / length.
	self d: self d / length.

]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> normalized [
	^self copy normalize
]

{
	#category : #printing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> printOn: aStream [

	aStream 
		nextPutAll: self class name;
		nextPut:$(;
		print: self angle;
		nextPut: Character space;
		print: self axis;
		nextPut:$).
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> radiansAngle: anAngle axis: aVector3 [

	| angle sin cos |
	angle := anAngle / 2.0.
	cos := angle cos.
	sin := angle sin.
	self a: cos b: aVector3 x * sin c: aVector3 y * sin d: aVector3 z * sin.
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> reversed [
	"Negating a quaternion is the same as reversing the angle of rotation"
	^Quaternion
		a: self a negated
		b: self b
		c: self c
		d: self d
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> setIdentity [
	^self loadFrom: QuaternionIdentity
]

{
	#category : #interpolating,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> slerpTo: aRotation at: t [
	"Spherical linear interpolation (slerp) from the receiver to aQuaternion"
	^self slerpTo: aRotation at: t extraSpins: 0
]

{
	#category : #interpolating,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> slerpTo: aRotation at: t extraSpins: spin [
	"Sperical Linear Interpolation (slerp).
	Calculate the new quaternion when applying slerp from the receiver (t = 0.0)
	to aRotation (t = 1.0). spin indicates the number of extra rotations to be added.
	The code shown below is from Graphics Gems III"
	| cosT alpha beta flip theta phi sinT |
	alpha := t.
	flip := false.
	"calculate the cosine of the two quaternions on the 4d sphere"
	cosT := self dot: aRotation.
	"if aQuaternion is on the opposite hemisphere reverse the direction
	(note that in quaternion space two points describe the same rotation)"
	cosT < 0.0 ifTrue:[
		flip := true.
		cosT := cosT negated].
	"If the aQuaternion is nearly the same as I am use linear interpolation"
	cosT > 0.99999 ifTrue:[
		"Linear Interpolation"
		beta := 1.0 - alpha
	] ifFalse:[
		"Spherical Interpolation"
		theta := cosT arcCos.
		phi := (spin * Float pi) + theta.
		sinT := theta sin.
		beta := (theta - (alpha * phi)) sin / sinT.
		alpha := (alpha * phi) sin / sinT].

	flip ifTrue:[alpha := alpha negated].
	^Quaternion 
		a: (alpha * aRotation a) + (beta * self a)
		b: (alpha * aRotation b) + (beta * self b)
		c: (alpha * aRotation c) + (beta * self c)
		d: (alpha * aRotation d) + (beta * self d)
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> turns [
	"Answer the number of turns"
	^self angle / 360.0
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Quaternion >> x: xValue y: yValue z: zValue a: anAngle [

	| angle sin cos |
	angle := (anAngle degreesToRadians) / 2.0.
	cos := angle cos.
	sin := angle sin.
	self a: cos b: xValue * sin c: yValue * sin d: zValue * sin
]
