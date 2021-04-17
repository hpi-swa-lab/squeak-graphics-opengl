"
I represent a standard 4x4 transformation matrix used throughout 3D graphics.
"
Class {
	#name : #Matrix4x4,
	#superclass : #Vector,
	#type : #words,
	#classVars : [
		'IdentityMatrix',
		'ZeroMatrix'
	],
	#category : #'3DTransform-Vectors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> at: at up: up [

" construct and orthonormal matrix from the up and at vectors."
	^ self new at: at up: up.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> identity [
	^self new setIdentity
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> initialize [
	"Matrix4x4 initialize"
	ZeroMatrix := self new.
	IdentityMatrix := self new.
	IdentityMatrix a11: 1.0; a22: 1.0; a33: 1.0; a44: 1.0.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/1/2021 13:39'
}
Matrix4x4 class >> lookAt: center from: eye up: up [
	"Build a right-handed look at view matrix. The camera is positioned at eye, looks at center, and is positioned in a world where up points upwards in world space. Up is expected to be normalized already."
	| forward sideward upward |
	forward := (eye - center) normalized.
	sideward := (forward cross: up) normalized.
	upward := sideward cross: forward.
	^ self identity
		a11: sideward x;
		a12: sideward y;
		a13: sideward z;
		a21: upward x;
		a22: upward y;
		a23: upward z;
		a31: forward x negated;
		a32: forward y negated;
		a33: forward z negated;
		a14: (sideward dot: eye) negated;
		a24: (upward dot: eye) negated;
		a34: (forward dot: eye) negated;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> numElements [
	^16
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/7/2021 13:34'
}
Matrix4x4 class >> ortho: aRectangle near: zNear far: zFar [

	| left right bottom top width height |
	left := aRectangle left.
	right := aRectangle right.
	bottom := aRectangle bottom.
	top := aRectangle top.
	width := right - left.
	height := top - bottom.
	^ self identity
		a11: 2.0 / width;
		a22: 2.0 / height;
    		a33: -2.0 / (zFar - zNear);
		a14: (right + left) negated / width;
		a24: (top + bottom) negated / height;
		a34: (zFar + zNear) negated / (zFar - zNear);
		yourself
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/16/2020 13:32'
}
Matrix4x4 class >> perspective: fovy aspectRatio: ratio near: zNear far: zFar [

	| tanHalfFovy |
	tanHalfFovy := (fovy / 2) tan.
	^ self identity
		a11: 1.0 / (ratio * tanHalfFovy);
		a22: 1.0 / tanHalfFovy;
		a33: zFar / (zNear - zFar);
		a43: -1.0;
		a34: (zFar * zNear) negated / (zFar - zNear);
		yourself
]

{
	#category : #'instance creation',
	#timestamp : 'zagto 12/15/2020 15:47'
}
Matrix4x4 class >> perspective: bounds near: near far: far [
	
	"https://www.scratchapixel.com/lessons/3d-basic-rendering/perspective-and-orthographic-projection-matrix/opengl-perspective-projection-matrix"
	^ self identity
		a11: 2 * near / bounds width;
		a22: 2 * near / bounds height;
		
		a13: (bounds right + bounds left) / bounds width;
		a23: (bounds top + bounds bottom) / bounds height;
		a33: (far + near) / (far - near) negated;
		a43: -1;
		
		a34: -2 * far * near / (far - near).
		
]

{
	#category : #'instance creation',
	#timestamp : 'zagto 12/15/2020 15:48'
}
Matrix4x4 class >> perspectiveAngleOfView: angleOfView ratio: ratio near: near far: far [
	| scale bounds |
	
	"https://www.scratchapixel.com/lessons/3d-basic-rendering/perspective-and-orthographic-projection-matrix/opengl-perspective-projection-matrix"
	scale := (angleOfView * 0.5 * Float pi / 180.0) tan * near.
	bounds := Rectangle
		left: ratio * scale negated
		right: ratio * scale
		top: scale
		bottom: scale negated.
	
	^ self perspective: bounds near: near far: far
	
	
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/16/2020 12:56'
}
Matrix4x4 class >> position: positionVector target: targetVector up: upVector [
	"Build a right-handed look at view matrix."
	| front side up |
	front := (targetVector - positionVector) normalized.
	side := (front cross: upVector normalized) normalized.
	up := side cross: front.
	^ self identity
		a11: side x;
		a12: side y;
		a13: side z;
		a21: up x;
		a22: up y;
		a23: up z;
		a31: front x negated;
		a32: front y negated;
		a33: front z negated;
		a14: (side dot: positionVector) negated;
		a24: (up dot: positionVector) negated;
		a34: (front dot: positionVector) negated;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> rotatedBy: angle around: axis centeredAt: origin [
	"Create a matrix rotating points around the given origin using the angle/axis pair"
	| xform |
	xform := self withOffset: origin negated.
	xform := xform composedWithGlobal:(Quaternion angle: angle axis: axis) asMatrix4x4.
	xform := xform composedWithGlobal: (self withOffset: origin).
	^xform
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> skew: vector [

	^ self new skew: vector.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> up: up at: at [

" construct and orthonormal matrix from the up and at vectors."
	^ self new up: up at: at.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> withOffset: aVector [

	^ self identity setTranslation: aVector asVector3
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> withRotation: angle [
	^ self withRotation: angle around: (0@0@1)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> withRotation: angle around: axis [
	^self new rotation: angle around: axis
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> withScale: amount [
	^self identity setScale: amount
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 class >> zero [
	^self new
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> * m2 [
	"Perform a 4x4 matrix multiplication."
	| result |
	result := self class new.
	self privateTransformMatrix: self with: m2 into: result.
	^result
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> *= m2 [
	"Perform a 4x4 matrix multiplication with result into self."
	| result |
	result := self * m2.
	self replaceFrom: 1 to: 16 with: result startingAt: 1.

]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> + aMatrix [

	| res |
	res := self copy.
	res += aMatrix.
	^ res.
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> += aMatrix [
	"Optimized for Matrix/Matrix operations"
	<primitive: 'primitiveAddFloatArray' module: 'FloatArrayPlugin'>
	^super + aMatrix
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> - aMatrix [

	| res |
	res := self copy.
	res -= aMatrix.
	^ res.
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> -= aMatrix [
	"Optimized for Matrix/Matrix operations"
	<primitive: 'primitiveSubFloatArray' module: 'FloatArrayPlugin'>
	^super - aMatrix
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a11 [
	"Return the element a11"
	^self at: 1
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a11: aNumber [
	"Store the element a11"
	self at: 1 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a12 [
	"Return the element a12"
	^self at: 2
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a12: aNumber [
	"Store the element a12"
	self at: 2 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a13 [
	"Return the element a13"
	^self at: 3
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a13: aNumber [
	"Store the element a13"
	self at: 3 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a14 [
	"Return the element a14"
	^self at: 4
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a14: aNumber [
	"Store the element a14"
	self at: 4 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a21 [
	"Return the element a21"
	^self at: 5
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a21: aNumber [
	"Store the element a21"
	self at: 5 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a22 [
	"Return the element a22"
	^self at: 6
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a22: aNumber [
	"Store the element a22"
	self at: 6 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a23 [
	"Return the element a23"
	^self at: 7
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a23: aNumber [
	"Store the element a23"
	self at: 7 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a24 [
	"Return the element a24"
	^self at: 8
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a24: aNumber [
	"Store the element a24"
	self at: 8 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a31 [
	"Return the element a31"
	^self at: 9
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a31: aNumber [
	"Store the element a31"
	self at: 9 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a32 [
	"Return the element a32"
	^self at: 10
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a32: aNumber [
	"Store the element a32"
	self at: 10 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a33 [
	"Return the element a33"
	^self at: 11
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a33: aNumber [
	"Store the element a33"
	self at: 11 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a34 [
	"Return the element a34"
	^self at: 12
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a34: aNumber [
	"Store the element a34"
	self at: 12 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a41 [
	"Return the element a41"
	^self at: 13
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a41: aNumber [
	"Store the element a41"
	self at: 13 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a42 [
	"Return the element a42"
	^self at: 14
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a42: aNumber [
	"Store the element a42"
	self at: 14 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a43 [
	"Return the element a43"
	^self at: 15
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a43: aNumber [
	"Store the element a43"
	self at: 15 put: aNumber
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a44 [
	"Return the element a44"
	^self at: 16
]

{
	#category : #'element-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> a44: aNumber [
	"Store the element a44"
	self at: 16 put: aNumber
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> addRotationAroundX: anAngle [

	| rtrans res |
	rtrans := Matrix4x4 identity.
	rtrans rotationAroundX: anAngle.
	res := Matrix4x4 new.
	self privateTransformMatrix: self with: rtrans into: res.
	self replaceFrom: 1 to: 16 with: res startingAt: 1.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> addRotationAroundY: anAngle [

	| rtrans res |
	rtrans := Matrix4x4 identity.
	rtrans rotationAroundY: anAngle.
	res := Matrix4x4 new.
	self privateTransformMatrix: self with: rtrans into: res.
	self replaceFrom: 1 to: 16 with: res startingAt: 1.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> addRotationAroundZ: anAngle [

	| rtrans res |
	rtrans := Matrix4x4 identity.
	rtrans rotationAroundZ: anAngle.
	res := Matrix4x4 new.
	self privateTransformMatrix: self with: rtrans into: res.
	self replaceFrom: 1 to: 16 with: res startingAt: 1.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> alternateRotation [
	"Return the angular rotation around each axis of the matrix"

	| cp sp cy sy cr sr vAngles |

	vAngles := Vector3 new.

	((self a13) = 0) ifTrue: [ ((self a33) >= 0)  ifTrue: [ vAngles at: 2 put: 0.
													  cr := (self a11).
													  sr := (self a12).
													  cp := (self a33). ]
											 ifFalse: [ vAngles at: 2 put: (Float pi).
														cr := (self a11) negated.
														sr := (self a12) negated.
														cp := (self a33) negated. ]
							]
					ifFalse: [
								vAngles at: 2 put: (((self a13) negated) arcTan: (self a33)).
								cy := (vAngles at: 3) cos.
								sy := (vAngles at: 3) sin.
								cr := (cy * (self a11)) + (sy * (self a31)).
								sr := (cy* (self a12)) + (sy * (self a32)).
								cp := (cy * (self a33)) - (sy * (self a13)).
							].

	sp := (self a23).
 
	vAngles at: 1 put: (sp arcTan: cp).
	vAngles at: 3 put: (sr arcTan: cr).

	vAngles at: 1 put: ((vAngles at: 1) radiansToDegrees).
	vAngles at: 2 put: ((vAngles at: 2) radiansToDegrees).
	vAngles at: 3 put: ((vAngles at: 3) radiansToDegrees).

	^ vAngles.

]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> asMatrix2x3 [

	^ Matrix2x3 identity
		a11: self a11;
		a12: self a12;
		a21: self a21;
		a22: self a22;
		a13: self a14;
		a23: self a24;
		yourself
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> asMatrix4x4 [
	^self
]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> asQuaternion [
	"Convert the matrix to a quaternion"

	| x y z a a2 x2 y2 a4 |

	a2 := 0.25 * (1.0 + (self a11) + (self a22) + (self a33)).

	(a2 > 0) ifTrue: [
						a := a2 sqrt.
						a4 := 4.0 * a.
						x := ((self a32) - (self a23)) / a4.
						y := ((self a13) - (self a31)) / a4.
						z := ((self a21) - (self a12)) / a4.
					]
			ifFalse: [
						a := 0.
						x2 := -0.5 * ((self a22) + (self a33)).
						(x2 > 0) ifTrue: [
											x := x2 sqrt.
											x2 := 2 * x.
											y := (self a21) / x2.
											z := (self a31) / x2.
										]
								ifFalse: [
											x := 0.
											y2 := 0.5 * (1.0 - (self a33)).
											(y2 > 0) ifTrue: [
																y := y2 sqrt.
																y2 := 2 * y.
																z := (self a32) / y2.
															]
													ifFalse: [
																y := 0.0.
																z := 1.0.
															]
										]
					].

	^ (Quaternion a: a b: x c: y d: z).

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> at: i at: j [
	^ self at: ((i - 1) * 4 + j).

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> at: i at: j put: aValue [
	^ self at: ((i - 1) * 4 + j) put: aValue.

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> at: a up: u [
" dominant at vector - up can change. See #up:at:."

	| side up at |
	side := (a cross: u) normalized negated.
	up := (side cross: a) normalized negated.
	at := a normalized.
	self a11: side x.
	self a21: side y.
	self a31: side z.
	self a12: up x.
	self a22: up y.
	self a32: up z.
	self a13: at x.
	self a23: at y.
	self a33: at z.
	self a44: 1.0.

]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:54'
}
Matrix4x4 >> column1 [
	"Return column 1"
	^ Vector3 x: self a11 y: self a21 z: self a31
]

{
	#category : #'row-access',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> column1: col [
	"Set column 1"
	self a11: col x.
	self a21: col y.
	self a31: col z.

]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:54'
}
Matrix4x4 >> column2 [
	"Return column 2"
	^ Vector3 x: self a12 y: self a22 z: self a32
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:55'
}
Matrix4x4 >> column2: col [
	"Set column 2"
	self a12: col x.
	self a22: col y.
	self a32: col z
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:54'
}
Matrix4x4 >> column3 [
	"Return column 3"
	^ Vector3 x: self a13 y: self a23 z: self a33
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:55'
}
Matrix4x4 >> column3: col [
	"Set column 3"
	self a13: col x.
	self a23: col y.
	self a33: col z
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> composeWith: m2 [
	"Perform a 4x4 matrix multiplication."
	^self composedWithLocal: m2.
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> composeWith: m2 times: nTimes [

	"Perform a 4x4 matrix exponentiation and multiplication."

	| result |
	result := self.
	nTimes negative ifTrue: [ self halt ].
	nTimes >= 2 ifTrue: [ 
			result := result composeWith: (m2 composedWithLocal: m2) times: nTimes // 2 ].
	(nTimes \\ 2) = 1 ifTrue: [ result := result composedWithLocal: m2].
	^ result
	

]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> composedWithGlobal: aMatrix4x4 [
	| result |
	result := self class new.
	self privateTransformMatrix: aMatrix4x4 with: self into: result.
	^result
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> composedWithLocal: aMatrix4x4 [
	| result |
	result := self class new.
	self privateTransformMatrix: self with: aMatrix4x4 into: result.
	^result
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> counterTransposed [
	"flip across the other diagonal from normal transpose. Just the 3x3 part. Do not use this unless you really know what you are doing."

	| matrix |
	matrix := self class new.
	matrix 
		a11: self a33; a12: self a23; a13: self a13; 	a14: self a14;
		a21: self a32; a22: self a22; a23: self a12; 	a24: self a24;
		a31: self a31; a32: self a21; a33: self a11; 	a34: self a34;

		a41: self a41; a42: self a42; a43: self a43; 	a44: self a44.
	^matrix
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> getFrom: m2 [

	1 to: 16 do:[:i | self at: i put: (m2 at: i)].
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> globalBoundsToLocal: aRectangle [

	^ Rectangle encompassing: (self globalPointsToLocal: aRectangle corners)
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> globalDirToLocal: aPoint [

	^ self inverseTransformation localDirToGlobal: aPoint
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> globalPointToLocal: aPoint [
	"Convenience method for inverse of localPointToGlobal."
	^ self inverseTransformation localPointToGlobal: aPoint
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> globalPointsToLocal: inArray [
	"Transform all the points of inArray from global into local coordinates"
	^ self inverseTransformation localPointsToGlobal: inArray
]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> inplaceDecomposeLU [
	"Decompose the receiver in place by using gaussian elimination w/o pivot search"
	| x |
	1 to: 4 do:[:j|
		"i-th equation (row)"
		j+1 to: 4 do:[:i|
			x := (self at: i at: j) / (self at: j at: j).
			j to: 4 do:[:k|
				self at: i at: k put: (self at: i at: k) - ((self at: j at: k) * x)].
			self at: i at: j put: x]].

]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> inplaceHouseHolderInvert [
	"Solve the linear equation self * aVector = x by using HouseHolder's transformation.
	Note: This scheme is numerically better than using gaussian elimination even though it takes
	somewhat longer"
	| d x sigma beta sum s|
	<primitive:'primitiveInplaceHouseHolderInvert' module:'CroquetPlugin'>
	x := Matrix4x4 identity.
	d := Matrix4x4 new.
	1 to: 4 do:[:j|
		sigma := 0.0.
		j to: 4 do:[:i| sigma := sigma + ((self at: i at: j) squared)].
		sigma isZero ifTrue:[^nil]. "matrix is singular"
		((self at: j at: j) < 0.0) 
			ifTrue:[ s:= sigma sqrt]
			ifFalse:[ s:= sigma sqrt negated].
		1 to: 4 do:[:r| d at: j at: r put: s].
		beta := 1.0 / ( s * (self at: j at: j) - sigma).
		self at: j at: j put: ((self at: j at: j) - s).
		"update remaining columns"
		j+1 to: 4 do:[:k|
			sum := 0.0.
			j to: 4 do:[:i| sum := sum + ((self at: i at: j) * (self at: i at: k))].
			sum := sum * beta.
			j to: 4 do:[:i| 
				self at: i at: k put: ((self at: i at: k) + ((self at: i at: j) * sum))]].
		"update vector"
		1 to: 4 do:[:r|
			sum := nil.
			j to: 4 do:[:i| 
				sum := sum isNil 
					ifTrue:[(x at: i at: r) * (self at: i at: j)] 
					ifFalse:[sum + ((x at: i at: r) * (self at: i at: j))]].
			sum := sum * beta.
			j to: 4 do:[:i| 
				x at: i at: r put:((x at: i at: r) + (sum * (self at: i at: j)))].
		].
	].
	"Now calculate result"
	1 to: 4 do:[:r|
		4 to: 1 by: -1 do:[:i|
			i+1 to: 4 do:[:j|
				x at: i at: r put: ((x at: i at: r) - ((x at: j at: r) * (self at: i at: j))) ].
			x at: i at: r put: ((x at: i at: r) / (d at: i at: r))].
	].
	self loadFrom: x.
	"Return receiver"
]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> inplaceHouseHolderTransform: aVector [
	"Solve the linear equation self * aVector = x by using HouseHolder's transformation.
	Note: This scheme is numerically better than using gaussian elimination even though it takes
	somewhat longer"
	| d x sigma beta sum s|
	x := Array with: aVector x with: aVector y with: aVector z with: aVector w.
	d := Array new: 4.
	1 to: 4 do:[:j|
		sigma := 0.0.
		j to: 4 do:[:i| sigma := sigma + ((self at: i at: j) squared)].
		sigma isZero ifTrue:[^nil]. "matrix is singular"
		((self at: j at: j) < 0.0) 
			ifTrue:[ s:= d at: j put: (sigma sqrt)]
			ifFalse:[ s:= d at: j put: (sigma sqrt negated)].
		beta := 1.0 / ( s * (self at: j at: j) - sigma).
		self at: j at: j put: ((self at: j at: j) - s).
		"update remaining columns"
		j+1 to: 4 do:[:k|
			sum := 0.0.
			j to: 4 do:[:i| sum := sum + ((self at: i at: j) * (self at: i at: k))].
			sum := sum * beta.
			j to: 4 do:[:i| 
				self at: i at: k put: ((self at: i at: k) + ((self at: i at: j) * sum))]].
		"update vector"
		sum := nil.
		j to: 4 do:[:i| 
			sum := sum isNil 
				ifTrue:[(x at: i) * (self at: i at: j)] 
				ifFalse:[sum + ((x at: i) * (self at: i at: j))]].
		sum := sum * beta.
		j to: 4 do:[:i| 
			x at: i put:((x at: i) + (sum * (self at: i at: j)))].
	].
	"Now calculate result"
	4 to: 1 by: -1 do:[:i|
		i+1 to: 4 do:[:j|
			x at: i put: ((x at: i) - ((x at: j) * (self at: i at: j))) ].
		x at: i put: ((x at: i) / (d at: i))].
	^Vector4 x: (x at: 1) y: (x at: 2) z: (x at: 3) w: (x at: 4)

]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> inverseTransformation [
	"Return the inverse matrix of the receiver."
	^self copy inplaceHouseHolderInvert.
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> isIdentity [
	^self = IdentityMatrix
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> isPureTranslation [

	"
	1 0 0
	0 1 0
	0 0 1"
	^ self a11 = 1 and: [self a12 = 0 and: [self a13 = 0 and: [self a21 = 0 and: [self a22 = 1 and: [self a23 = 0 and: [self a31 = 0 and: [self a32 = 0 and: [self a33 = 1]]]]]]]]
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> isZero [
	^self = ZeroMatrix
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> localBoundsToGlobal: aRectangle [

	^ Rectangle encompassing: (self localPointsToGlobal: aRectangle corners)
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> localDirToGlobal: aVector [
	"Multiply direction vector with the receiver"
	| x y z rx ry rz |
	<primitive: 'primitiveTransformDirection' module: 'CroquetPlugin'>
	x := aVector x.
	y := aVector y.
	z := aVector z.

	rx := (x * self a11) + (y * self a12) + (z * self a13).
	ry := (x * self a21) + (y * self a22) + (z * self a23).
	rz := (x * self a31) + (y * self a32) + (z * self a33).

	^Vector3 x: rx y: ry z: rz
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> localPointToGlobal: aVector [
	"Multiply aVector (temporarily converted to 4D) with the receiver"
	| x y z rx ry rz rw |
	<primitive: 'primitiveTransformVector3' module: 'CroquetPlugin'>

	x := aVector x.
	y := aVector y.
	z := aVector z.

	rx := (x * self a11) + (y * self a12) + (z * self a13) + self a14.
	ry := (x * self a21) + (y * self a22) + (z * self a23) + self a24.
	rz := (x * self a31) + (y * self a32) + (z * self a33) + self a34.
	rw := (x * self a41) + (y * self a42) + (z * self a43) + self a44.

	^Vector3 x:(rx/rw) y: (ry/rw) z: (rz/rw)
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> localPointsToGlobal: inArray [
	"Transform all the points of inArray from local into global coordinates"
	^ inArray collect: [:pt | (self localPointToGlobal: pt asVector3) asPoint]
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:55'
}
Matrix4x4 >> lookAt [
	"Return column 3"
	^ Vector3 x: self a13 y: self a23 z: self a33
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:55'
}
Matrix4x4 >> lookSide [
	"Return column 1"
	^ Vector3 x: self a11 y: self a21 z: self a31
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:55'
}
Matrix4x4 >> lookUp [
	"Return column 2"
	^ Vector3 x: self a12 y: self a22 z: self a32
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> normalize [

	self column1: (self column2 cross: self column3) normalized.
	self column2: (self column3 cross: self column1) normalized.
	self column3: (self column1 cross: self column2) normalized.
]

{
	#category : #'compat-display transform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> offset [

	^ self translation asPoint
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> orientation [
"This is used to return just the orientation part of the matrix.The translation part is 0.0."
	| mat |

	mat := self shallowCopy.
	mat translationX: 0.0 y: 0.0 z: 0.0.
	^ mat.
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> orthoNormInverse [
	| m x y z rx ry rz |
	<primitive: 'primitiveOrthoNormInverseMatrix' module: 'CroquetPlugin'>
	m := self shallowCopy.
	"transpose upper 3x3 matrix"
	m a11: self a11; a12: self a21; a13: self a31.
	m a21: self a12; a22: self a22; a23: self a32.
	m a31: self a13; a32: self a23; a33: self a33.
	"Compute inverse translation vector"
	x := self a14.
	y := self a24.
	z := self a34.
	rx := (x * m a11) + (y * m a12) + (z * m a13).
	ry := (x * m a21) + (y * m a22) + (z * m a23).
	rz := (x * m a31) + (y * m a32) + (z * m a33).

	m a14: 0.0-rx; a24: 0.0-ry; a34: 0.0-rz.
	^m
" Used to be:
	m := self shallowCopy.
	v := m translation.
	m translation: Vector3 zero.
	m := m transposed.
	v := (m localPointToGlobal: v) negated.
	m translation: v.
	^ m.
"
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> pitchYawRoll [
	"Assume the receiver describes an orthonormal 3x3 matrix"
	| pitch yaw roll |
	pitch := self a23 negated arcSin.
	yaw := self a13 arcTan: self a33.
	roll := self a21 arcTan: self a22.
	^pitch radiansToDegrees@yaw radiansToDegrees@roll radiansToDegrees
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> pitchYawRoll: ypr [
	"Assume the receiver describes an orthonormal 3x3 matrix"
	| offset mx my mz |
	offset := self translation.
	mx := self class identity rotationAroundX: ypr x.
	my := self class identity rotationAroundY: ypr y.
	mz := self class identity rotationAroundZ: ypr z.
	self loadFrom: mz * my * mx.
	self translation: offset

]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> preservesAxisAlignment [
	"
	x 0 0
	0 y 0
	0 0 z"
	self a12 = 0.0 ifFalse: [^ false].
	self a13 = 0.0 ifFalse: [^ false].
	self a21 = 0.0 ifFalse: [^ false].
	self a23 = 0.0 ifFalse: [^ false].
	self a31 = 0.0 ifFalse: [^ false].
	^ self a32 = 0.0
]

{
	#category : #'double dispatching',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> printOn: aStream [
	"Print the receiver on aStream"
	1 to: 4 do:[:r|
		1 to: 4 do:[:c| 
			(self at: r-1*4+c) printOn: aStream.
			aStream nextPut: Character space].
		(r < 4) ifTrue:[aStream nextPut: Character cr]].
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> privateTransformMatrix: m1 with: m2 into: m3 [
	"Perform a 4x4 matrix multiplication
		m2 * m1 = m3
	being equal to first transforming points by m2 and then by m1.
	Note that m1 may be identical to m3.
	NOTE: The primitive implementation does NOT return m3 - and so don't we!"
	| c1 c2 c3 c4 |
	<primitive: 'primitiveTransformMatrixWithInto' module:'CroquetPlugin'>
	m2 == m3 ifTrue:[^self error:'Argument and result matrix identical'].
	c1 := ((m1 a11 * m2 a11) + (m1 a12 * m2 a21) + 
				(m1 a13 * m2 a31) + (m1 a14 * m2 a41)).
	c2 := ((m1 a11 * m2 a12) + (m1 a12 * m2 a22) + 
				(m1 a13 * m2 a32) + (m1 a14 * m2 a42)).
	c3 := ((m1 a11 * m2 a13) + (m1 a12 * m2 a23) + 
				(m1 a13 * m2 a33) + (m1 a14 * m2 a43)).
	c4 := ((m1 a11 * m2 a14) + (m1 a12 * m2 a24) + 
				(m1 a13 * m2 a34) + (m1 a14 * m2 a44)).

	m3 a11: c1; a12: c2; a13: c3; a14: c4.

	c1 := ((m1 a21 * m2 a11) + (m1 a22 * m2 a21) + 
				(m1 a23 * m2 a31) + (m1 a24 * m2 a41)).
	c2 := ((m1 a21 * m2 a12) + (m1 a22 * m2 a22) + 
				(m1 a23 * m2 a32) + (m1 a24 * m2 a42)).
	c3 := ((m1 a21 * m2 a13) + (m1 a22 * m2 a23) + 
				(m1 a23 * m2 a33) + (m1 a24 * m2 a43)).
	c4 := ((m1 a21 * m2 a14) + (m1 a22 * m2 a24) + 
				(m1 a23 * m2 a34) + (m1 a24 * m2 a44)).

	m3 a21: c1; a22: c2; a23: c3; a24: c4.

	c1 := ((m1 a31 * m2 a11) + (m1 a32 * m2 a21) + 
				(m1 a33 * m2 a31) + (m1 a34 * m2 a41)).
	c2 := ((m1 a31 * m2 a12) + (m1 a32 * m2 a22) + 
				(m1 a33 * m2 a32) + (m1 a34 * m2 a42)).
	c3 := ((m1 a31 * m2 a13) + (m1 a32 * m2 a23) + 
				(m1 a33 * m2 a33) + (m1 a34 * m2 a43)).
	c4 := ((m1 a31 * m2 a14) + (m1 a32 * m2 a24) + 
				(m1 a33 * m2 a34) + (m1 a34 * m2 a44)).

	m3 a31: c1; a32: c2; a33: c3; a34: c4.

	c1 := ((m1 a41 * m2 a11) + (m1 a42 * m2 a21) + 
				(m1 a43 * m2 a31) + (m1 a44 * m2 a41)).
	c2 := ((m1 a41 * m2 a12) + (m1 a42 * m2 a22) + 
				(m1 a43 * m2 a32) + (m1 a44 * m2 a42)).
	c3 := ((m1 a41 * m2 a13) + (m1 a42 * m2 a23) + 
				(m1 a43 * m2 a33) + (m1 a44 * m2 a43)).
	c4 := ((m1 a41 * m2 a14) + (m1 a42 * m2 a24) + 
				(m1 a43 * m2 a34) + (m1 a44 * m2 a44)).

	m3 a41: c1; a42: c2; a43: c3; a44: c4.
]

{
	#category : #'double dispatching',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> productFromMatrix4x4: matrix [
	"Multiply a 4x4 matrix with the receiver."
	| result |
	result := self class new.
	result a11: ((matrix a11 * self a11) + (matrix a12 * self a21) + 
				(matrix a13 * self a31) + (matrix a14 * self a41)).
	result a12: ((matrix a11 * self a12) + (matrix a12 * self a22) + 
				(matrix a13 * self a32) + (matrix a14 * self a42)).
	result a13: ((matrix a11 * self a13) + (matrix a12 * self a23) + 
				(matrix a13 * self a33) + (matrix a14 * self a43)).
	result a14: ((matrix a11 * self a14) + (matrix a12 * self a24) + 
				(matrix a13 * self a34) + (matrix a14 * self a44)).

	result a21: ((matrix a21 * self a11) + (matrix a22 * self a21) + 
				(matrix a23 * self a31) + (matrix a24 * self a41)).
	result a22: ((matrix a21 * self a12) + (matrix a22 * self a22) + 
				(matrix a23 * self a32) + (matrix a24 * self a42)).
	result a23: ((matrix a21 * self a13) + (matrix a22 * self a23) + 
				(matrix a23 * self a33) + (matrix a24 * self a43)).
	result a24: ((matrix a21 * self a14) + (matrix a22 * self a24) + 
				(matrix a23 * self a34) + (matrix a24 * self a44)).

	result a31: ((matrix a31 * self a11) + (matrix a32 * self a21) + 
				(matrix a33 * self a31) + (matrix a34 * self a41)).
	result a32: ((matrix a31 * self a12) + (matrix a32 * self a22) + 
				(matrix a33 * self a32) + (matrix a34 * self a42)).
	result a33: ((matrix a31 * self a13) + (matrix a32 * self a23) + 
				(matrix a33 * self a33) + (matrix a34 * self a43)).
	result a34: ((matrix a31 * self a14) + (matrix a32 * self a24) + 
				(matrix a33 * self a34) + (matrix a34 * self a44)).

	result a41: ((matrix a41 * self a11) + (matrix a42 * self a21) + 
				(matrix a43 * self a31) + (matrix a44 * self a41)).
	result a42: ((matrix a41 * self a12) + (matrix a42 * self a22) + 
				(matrix a43 * self a32) + (matrix a44 * self a42)).
	result a43: ((matrix a41 * self a13) + (matrix a42 * self a23) + 
				(matrix a43 * self a33) + (matrix a44 * self a43)).
	result a44: ((matrix a41 * self a14) + (matrix a42 * self a24) + 
				(matrix a43 * self a34) + (matrix a44 * self a44)).

	^result
]

{
	#category : #'double dispatching',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> productFromVector3: aVector3 [
	"Multiply aVector (temporarily converted to 4D) with the receiver"
	| x y z rx ry rz rw |
	x := aVector3 x.
	y := aVector3 y.
	z := aVector3 z.

	rx := (x * self a11) + (y * self a21) + (z * self a31) + self a41.
	ry := (x * self a12) + (y * self a22) + (z * self a32) + self a42.
	rz := (x * self a13) + (y * self a23) + (z * self a33) + self a43.
	rw := (x * self a14) + (y * self a24) + (z * self a34) + self a44.

	^Vector3 x:(rx/rw) y: (ry/rw) z: (rz/rw)
]

{
	#category : #'double dispatching',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> productFromVector4: aVector4 [
	"Multiply aVector with the receiver"
	| x y z w rx ry rz rw |
	x := aVector4 x.
	y := aVector4 y.
	z := aVector4 z.
	w := aVector4 w.

	rx := (x * self a11) + (y * self a21) + (z * self a31) + (w * self a41).
	ry := (x * self a12) + (y * self a22) + (z * self a32) + (w * self a42).
	rz := (x * self a13) + (y * self a23) + (z * self a33) + (w * self a43).
	rw := (x * self a14) + (y * self a24) + (z * self a34) + (w * self a44).

	^Vector4 x:rx y: ry z: rz w: rw
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> ptm: m1 with: m2 into: m3 [
	"Perform a 4x4 matrix multiplication
		m2 * m1 = m3
	being equal to first transforming points by m2 and then by m1.
	Note that m1 may be identical to m3.
	NOTE: The primitive implementation does NOT return m3 - and so don't we!"
	| c1 c2 c3 c4 |

	m2 == m3 ifTrue:[^self error:'Argument and result matrix identical'].
	c1 := ((m1 a11 * m2 a11) + (m1 a12 * m2 a21) + 
				(m1 a13 * m2 a31) + (m1 a14 * m2 a41)).
	c2 := ((m1 a11 * m2 a12) + (m1 a12 * m2 a22) + 
				(m1 a13 * m2 a32) + (m1 a14 * m2 a42)).
	c3 := ((m1 a11 * m2 a13) + (m1 a12 * m2 a23) + 
				(m1 a13 * m2 a33) + (m1 a14 * m2 a43)).
	c4 := ((m1 a11 * m2 a14) + (m1 a12 * m2 a24) + 
				(m1 a13 * m2 a34) + (m1 a14 * m2 a44)).

	m3 a11: c1; a12: c2; a13: c3; a14: c4.

	c1 := ((m1 a21 * m2 a11) + (m1 a22 * m2 a21) + 
				(m1 a23 * m2 a31) + (m1 a24 * m2 a41)).
	c2 := ((m1 a21 * m2 a12) + (m1 a22 * m2 a22) + 
				(m1 a23 * m2 a32) + (m1 a24 * m2 a42)).
	c3 := ((m1 a21 * m2 a13) + (m1 a22 * m2 a23) + 
				(m1 a23 * m2 a33) + (m1 a24 * m2 a43)).
	c4 := ((m1 a21 * m2 a14) + (m1 a22 * m2 a24) + 
				(m1 a23 * m2 a34) + (m1 a24 * m2 a44)).

	m3 a21: c1; a22: c2; a23: c3; a24: c4.

	c1 := ((m1 a31 * m2 a11) + (m1 a32 * m2 a21) + 
				(m1 a33 * m2 a31) + (m1 a34 * m2 a41)).
	c2 := ((m1 a31 * m2 a12) + (m1 a32 * m2 a22) + 
				(m1 a33 * m2 a32) + (m1 a34 * m2 a42)).
	c3 := ((m1 a31 * m2 a13) + (m1 a32 * m2 a23) + 
				(m1 a33 * m2 a33) + (m1 a34 * m2 a43)).
	c4 := ((m1 a31 * m2 a14) + (m1 a32 * m2 a24) + 
				(m1 a33 * m2 a34) + (m1 a34 * m2 a44)).

	m3 a31: c1; a32: c2; a33: c3; a34: c4.

	c1 := ((m1 a41 * m2 a11) + (m1 a42 * m2 a21) + 
				(m1 a43 * m2 a31) + (m1 a44 * m2 a41)).
	c2 := ((m1 a41 * m2 a12) + (m1 a42 * m2 a22) + 
				(m1 a43 * m2 a32) + (m1 a44 * m2 a42)).
	c3 := ((m1 a41 * m2 a13) + (m1 a42 * m2 a23) + 
				(m1 a43 * m2 a33) + (m1 a44 * m2 a43)).
	c4 := ((m1 a41 * m2 a14) + (m1 a42 * m2 a24) + 
				(m1 a43 * m2 a34) + (m1 a44 * m2 a44)).

	m3 a41: c1; a42: c2; a43: c3; a44: c4.
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> quickTransformV3ArrayFrom: srcArray to: dstArray [
	"Transform the 3 element vertices from srcArray to dstArray.
	ASSUMPTION: a41 = a42 = a43 = 0.0 and a44 = 1.0"
	| a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34 x y z index |
	self flag: #b3dPrimitive.
	a11 := self a11.	a12 := self a12.	a13 := self a13.	a14 := self a14.
	a21 := self a21.	a22 := self a22.	a23 := self a23.	a24 := self a24.
	a31 := self a31.	a32 := self a32.	a33 := self a33.	a34 := self a34.
	1 to: srcArray size do:[:i|
		index := i-1*3.
		x := srcArray floatAt: index+1.
		y := srcArray floatAt: index+2.
		z := srcArray floatAt: index+3.
		dstArray floatAt: index+1 put: (a11*x) + (a12*y) + (a13*z) + a14.
		dstArray floatAt: index+2 put: (a21*x) + (a22*y) + (a23*z) + a24.
		dstArray floatAt: index+3 put: (a31*x) + (a32*y) + (a33*z) + a34.
	].
	^dstArray
]

{
	#category : #private,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> replaceFrom: start to: stop with: replacement startingAt: repStart [ 
	"Primitive. This destructively replaces elements from start to stop in the receiver starting at index, repStart, in the collection, replacement. Answer the receiver. Range checks are performed in the primitive only. Optional. See Object documentation whatIsAPrimitive."
	| index repOff |
	<primitive: 105>
	repOff := repStart - start.
	index := start - 1.
	[(index := index + 1) <= stop]
		whileTrue: [self basicAt: index put: (replacement basicAt: repOff + index)]
]

{
	#category : #transforming,
	#timestamp : 'stlu 1/7/2021 12:42'
}
Matrix4x4 >> rotatedBy: angleInDegrees around: axis [

	^ (self class withRotation: angleInDegrees around: axis) * self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotation [
	"Return the angular rotation around each axis of the matrix"

	| vRow1 vRow2 vRow3 vScale vShear vAngles vRowCross determinate |

	vRow1 := self row1.
	vRow2 := self row2.
	vRow3 := self row3.

	vScale := Vector3 new.
	vShear := Vector3 new.
	vAngles := Vector3 new.

	vScale at: 1 put: (vRow1 length).
	vRow1 normalize.
	vShear at: 1 put: (vRow1 dot: vRow2).
	vRow2 := vRow2 + (vRow1 * ((vShear at: 1) negated)).

	vScale at: 2 put: (vRow2 length).
	vRow2 normalize.
	vShear at: 1 put: ((vShear at: 1) / (vScale at: 2)).

	vShear at: 2 put: (vRow1 dot: vRow3).
	vRow3 := vRow3 + (vRow1 * ((vShear at: 2) negated)).

	vShear at: 3 put: (vRow2 dot: vRow3).
	vRow3 := vRow3 + (vRow2 * ((vShear at: 3) negated)).

	vScale at: 3 put: (vRow3 length).
	vRow3 normalize.

	vShear at: 2 put: ((vShear at: 2) / (vScale at: 3)).
	vShear at: 3 put: ((vShear at: 3) / (vScale at: 3)).

	vRowCross := vRow2 cross: vRow3.
	determinate := vRow1 dot: vRowCross.

	(determinate < 0.0) ifTrue: [ vRow1 := vRow1 negated.
								vRow2 := vRow2 negated.
								vRow3 := vRow3 negated.
								vScale := vScale negated. ].

	vAngles at: 2 put: ((vRow1 at: 3) negated) arcSin.

	(((vAngles at: 2) cos) ~= 0.0) 
								ifTrue: [ vAngles at: 1 put:
												((vRow2 at: 3) arcTan: (vRow3 at: 3)).
										  vAngles at: 3 put:
												((vRow1 at: 2) arcTan: (vRow1 at: 1)). ]
								ifFalse: [ vAngles at: 1 put:
												((vRow2 at: 1) arcTan: (vRow2 at: 2)).
										  vAngles at: 3 put: 0.0 ].


	vAngles at: 1 put: ((vAngles at: 1) radiansToDegrees).
	vAngles at: 2 put: ((vAngles at: 2) radiansToDegrees).
	vAngles at: 3 put: ((vAngles at: 3) radiansToDegrees).

	^ vAngles.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotation: aVector [
	| xRot yRot zRot cosPitch sinPitch cosYaw sinYaw cosRoll sinRoll |

	xRot := (aVector x) degreesToRadians.
	yRot := (aVector y) degreesToRadians.
	zRot := (aVector z) degreesToRadians.

	cosPitch := xRot cos.
	sinPitch := xRot sin.
	cosYaw := yRot cos.
	sinYaw := yRot sin.
	cosRoll := zRot cos.
	sinRoll := zRot sin.

	self a11: (cosRoll*cosYaw).
	self a12: (sinRoll*cosYaw).
	self a13: (sinYaw negated).

	self a21: ((cosRoll*sinYaw*sinPitch) - (sinRoll*cosPitch)).
	self a22: ((cosRoll*cosPitch) + (sinRoll*sinYaw*sinPitch)).
	self a23: (cosYaw*sinPitch).
	self a31: ((cosRoll*sinYaw*cosPitch) + (sinRoll*sinPitch)).
	self a32: ((sinRoll*sinYaw*cosPitch) - (cosRoll*sinPitch)).
	self a33: (cosYaw*cosPitch).

	^ self.

]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotation: anAngle around: aVector3 [
	"set up a rotation matrix around the direction aVector3"

	self loadFrom: (Quaternion angle: anAngle axis: aVector3) asMatrix4x4
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotation: anAngle aroundX: xValue y: yValue z: zValue [
	"set up a rotation matrix around the direction x/y/z"
	^self rotation: anAngle around:(Vector3 with: xValue with: yValue with: zValue)
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotationAroundX: anAngle [
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a22: c.
	self a23: s negated.
	self a33: c.
	self a32: s.
	^self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotationAroundY: anAngle [
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a11: c.
	self a13: s.
	self a33: c.
	self a31: s negated.
	^self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> rotationAroundZ: anAngle [
	| rad s c |
	rad := anAngle degreesToRadians.
	s := rad sin.
	c := rad cos.
	self a11: c.
	self a12: s negated.
	self a22: c.
	self a21: s.
	^self
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row1 [
	"Return row 1"
	^ Vector3 x: self a11 y: self a12 z: self a13
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row1: row [
	"Set row 1"
	self a11: row x.
	self a12: row y.
	self a13: row z
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row2 [
	"Return row 2"
	^ Vector3 x: self a21 y: self a22 z: self a23
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row2: row [
	"Set row 2"
	self a21: row x.
	self a22: row y.
	self a23: row z
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row3 [
	"Return row 3"
	^ Vector3 x: self a31 y: self a32 z: self a33
]

{
	#category : #'row-access',
	#timestamp : 'stlu 1/7/2021 10:56'
}
Matrix4x4 >> row3: row [
	"Set row 3"
	self a31: row x.
	self a32: row y.
	self a33: row z
]

{
	#category : #transforming,
	#timestamp : 'stlu 1/7/2021 12:42'
}
Matrix4x4 >> scaledBy: aVector3 [

	^ (self class withScale: aVector3) * self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> scaling: aVector [

	^self scalingX: aVector x y: aVector y z: aVector z
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> scalingX: xValue y: yValue z: zValue [

	self a11: self a11 * xValue.
	self a22: self a22 * yValue.
	self a33: self a33 * zValue.
	^self
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setBSplineBase [
	"Set the receiver to the BSpline base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0 / 6.0;	a12: 3.0 / 6.0;	a13: -3.0 / 6.0;	a14: 1.0 / 6.0;
		a21: 3.0 / 6.0;	a22: -6.0 / 6.0;	a23: 3.0 / 6.0;	a24: 0.0 / 6.0;
		a31: -3.0 / 6.0;	a32: 0.0 / 6.0;	a33: 3.0 / 6.0;	a34: 0.0 / 6.0;
		a41: 1.0 / 6.0;	a42: 4.0 / 6.0;	a43: 1.0 / 6.0;	a44: 0.0 / 6.0

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setBetaSplineBaseBias: beta1 tension: beta2 [
	"Set the receiver to the betaSpline base matrix 
	if beta1=1 and beta2=0 then the bSpline base matrix will be returned"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	| b12 b13 delta |
	b12 := beta1 * beta1.
	b13 := beta1 * b12.
	delta := 1.0 / (beta2 + (2.0 * b13) + 4.0 * (b12 + beta1) +2.0).
	
	self
		a11: delta * -2.0 * b13;
		a12: delta * 2.0 * (beta2 + b13 + b12 + beta1);
		a13: delta * -2.0 * (beta2 + b12 + beta1 + 1.0);
		a14: delta * 2.0;
		a21: delta * 6.0 * b13;
		a22: delta * -3.0 * (beta2 + (2.0 * (b13 + b12)));
		a23: delta * 3.0 * (beta2 + (2.0 * b12));
		a24: 0.0;
		a31: delta * -6.0 * b13;
		a32: delta * 6.0 * (b13 - beta1);
		a33: delta * 6.0 * beta1;
		a34: 0.0;
		a41: delta * 2.0 * b13;
		a42: delta * (beta2 + 4.0 * (b12 + beta1));
		a43: delta * 2.0;
		a44: 0.0

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setBezierBase [
	"Set the receiver to the bezier base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0;		a12: 3.0;		a13: -3.0;	a14: 1.0;
		a21: 3.0;		a22: -6.0;	a23: 3.0;	a24: 0.0;
		a31: -3.0;	a32: 3.0;	a33: 0.0;	a34: 0.0;
		a41: 1.0;		a42: 0.0;	a43: 0.0;	a44: 0.0
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setCardinalBase [
	"Set the receiver to the cardinal spline base matrix - just catmull * 2"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -1.0;		a12: 3.0;		a13: -3.0;	a14: 1.0;
		a21: 2.0;		a22: -5.0;	a23: 4.0;	a24: -1.0;
		a31: -1.0;	a32: 0.0;	a33: 1.0;		a34: 0.0;
		a41: 0.0;		a42: 2.0;	a43: 0.0;	a44: 0.0

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setCatmullBase [
	"Set the receiver to the Catmull-Rom base matrix"
	"for further information see:
		Foley, van Dam, Feiner, Hughes
		'Computer Graphics: Principles and Practice'
		Addison-Wesley Publishing Company
		Second Edition, pp. 505"
	self
		a11: -0.5;	a12: 1.5;		a13: -1.5;	a14: 0.5;
		a21: 1.0;		a22: -2.5;	a23: 2.0;	a24: -0.5;
		a31: -0.5;	a32: 0.0;	a33: 0.5;	a34: 0.0;
		a41: 0.0;		a42: 1.0;		a43: 0.0;	a44: 0.0

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setIdentity [
	"Set the receiver to the identity matrix"
	self loadFrom: IdentityMatrix
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setPolylineBase [
	"Set the receiver to the polyline base matrix :)"
	self
		a11: 0.0;		a12: 0.0;		a13: 0.0;		a14: 0.0;
		a21: 0.0;		a22: 0.0;	a23: 0.0;	a24: 0.0;
		a31: 0.0;		a32: -1.0;	a33: 1.0;		a34: 0.0;
		a41: 0.0;		a42: 1.0;		a43: 0.0;	a44: 0.0

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setScale: aVector [
	self 
		a11: aVector x;
		a22: aVector y;
		a33: aVector z
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setTranslation: aVector [
	self 
		a14: aVector x;
		a24: aVector y;
		a34: aVector z
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> setZero [
	"Set the receiver to the zero matrix"
	self loadFrom: ZeroMatrix
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> skew: vector [
	"Set the skew-symetric matrix up"
	self a21: vector z.
	self a12: vector z negated.
	self a31: vector y negated.
	self a13: vector y.
	self a32: vector x.
	self a23: vector x negated.

]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> solve3x3: aVector [
	"Solve a 3x3 system of linear equations. Assume that all the a[4,x] and a[x,4] are zero.
	NOTE: This is a hack, but it's the fastest way for now."
	| m |
	m := self shallowCopy.
	m a44: 1. "need this for inversion"
	m := m inplaceHouseHolderInvert.
	m ifNil:[^nil].
	^m localDirToGlobal: aVector.
]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> solve: aVector [

	^self shallowCopy inplaceHouseHolderTransform: aVector
	"or:
	^self shallowCopy inplaceDecomposeLU solveLU: aVector
	"
]

{
	#category : #solving,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> solveLU: aVector [
	"Given a decomposed matrix using gaussian elimination solve the linear equations."
	| x v |
	v := Array with: aVector x with: aVector y with: aVector z with: aVector w.
	"L first"
	1 to: 4 do:[:i| "Top to bottom"
		x := 0.0.
		1 to: i-1 do:[:j|
			"From left to right w/o diagonal element"
			x := x + ((v at: j) * (self at: i at: j))].
		"No need to divide by the diagonal element - this is always 1.0 in L"
		v at: i put: (v at: i) - x].
	"Now U"
	4 to: 1 by: -1 do:[:i| "Bottom to top"
		x := 0.0.
		4 to: i+1 by: -1 do:[:j|
			"From right to left w/o diagonal element"
			x := x + ((v at: j) * (self at: i at: j))].
		"Divide by diagonal element"
		v at: i put: (v at: i) - x / (self at: i at: i)].
	^Vector4 x: (v at: 1) y: (v at: 2) z: (v at: 3) w: (v at: 4)

]

{
	#category : #converting,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> sourceQuadFor: aRectangle [
	^ aRectangle innerCorners collect: 
		[:p | self globalPointToLocal: p]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> squaredDistanceFrom: aMatrix [
	| sum |
	sum := 0.0.
	1 to: 4 do:[:i|
		1 to: 4 do:[:j|
			sum := sum + ((self at: i at: j) - (aMatrix at: i at: j)) squared]].
	^sum
]

{
	#category : #comparing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> squaredErrorDistanceTo: anotherMatrix [
	| result temp |
	result := self - anotherMatrix.
	temp := 0.
	1 to: 4 do: [:i | 1 to: 4 do: [:j| temp := temp + ((result at: i-1*4+j) squared)]].
	^temp sqrt.
]

{
	#category : #transforming,
	#timestamp : 'stlu 1/7/2021 12:42'
}
Matrix4x4 >> translatedBy: aVector3 [

	^ (self class withOffset: aVector3) * self
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> translation [

	^(Vector3 x: self a14 y: self a24 z: self a34)
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> translation: aVector [

	^self translationX: aVector x y: aVector y z: aVector z
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> translationMatrix [

	^ Matrix4x4 identity translation: self translation.
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> translationX: xValue y: yValue z: zValue [

	self a14: xValue.
	self a24: yValue.
	self a34: zValue.
	^self
]

{
	#category : #transforming,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> transposed [
	"Return a transposed copy of the receiver"
	| matrix |
	<primitive: 'primitiveTransposeMatrix' module: 'CroquetPlugin'>
	matrix := self class new.
	matrix 
		a11: self a11; a12: self a21; a13: self a31; a14: self a41;
		a21: self a12; a22: self a22; a23: self a32; a24: self a42;
		a31: self a13; a32: self a23; a33: self a33; a34: self a43;
		a41: self a14; a42: self a24; a43: self a34; a44: self a44.
	^matrix
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> trotation [
	"Return the angular rotation around each axis of the matrix"

	| cp sp cy sy cr sr vAngles |

	vAngles := Vector3 new.

	((self a13) = 0) ifTrue: [ ((self a33) >= 0)  ifTrue: [ vAngles at: 2 put: 0.
													  cr := (self a11).
													  sr := (self a12).
													  cp := (self a33). ]
											 ifFalse: [ vAngles at: 2 put: (Float pi).
														cr := (self a11) negated.
														sr := (self a12) negated.
														cp := (self a33) negated. ]
							]
					ifFalse: [
								vAngles at: 2 put: (((self a13) negated) arcTan: (self a33)).
								cy := (vAngles at: 3) cos.
								sy := (vAngles at: 3) sin.
								cr := (cy * (self a11)) + (sy * (self a31)).
								sr := (cy* (self a12)) + (sy * (self a32)).
								cp := (cy * (self a33)) - (sy * (self a13)).
							].

	sp := (self a23).
 
	vAngles at: 1 put: (sp arcTan: cp).
	vAngles at: 3 put: (sr arcTan: cr).

	vAngles at: 1 put: ((vAngles at: 1) radiansToDegrees).
	vAngles at: 2 put: ((vAngles at: 2) radiansToDegrees).
	vAngles at: 3 put: ((vAngles at: 3) radiansToDegrees).

	^ vAngles.

]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
Matrix4x4 >> up: u at: a [

" dominant up vector - at can change. See #at:up."

	| side up at |
	side := (a cross: u) normalized negated.
	at := (u cross: side) normalized negated.
	up := u normalized.
	self a11: side x.
	self a21: side y.
	self a31: side z.
	self a12: up x.
	self a22: up y.
	self a32: up z.
	self a13: at x.
	self a23: at y.
	self a33: at z.
	self a44: 1.0.

]
