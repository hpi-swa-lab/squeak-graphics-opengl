"
I represent simple 2D coordinates in Croquet. I may be used to represent both, 2D points and 2D texture coordinates. 
"
Class {
	#name : #Vector2,
	#superclass : #Vector,
	#type : #words,
	#category : #'3DTransform-Vectors'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 class >> from: anArray [

	^ self x: (anArray at:1) y: (anArray at:2) .
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 class >> numElements [
	^2
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 class >> u: uValue v: vValue [
	^self new u: uValue v: vValue
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 class >> x: uValue y: vValue [
	^self new x: uValue y: vValue
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 >> asPoint [
	^self x @ self y
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
Vector2 >> u [

	^ self componentAt: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
Vector2 >> u: aFloat [

	self componentAt: 1 put: aFloat.
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 >> u: uValue v: vValue [
	self u: uValue.
	self v: vValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:11'
}
Vector2 >> v [

	^ self componentAt: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
Vector2 >> v: aFloat [

	self componentAt: 2 put: aFloat.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 >> x [
	^self at: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
Vector2 >> x: aFloat [

	self componentAt: 1 put: aFloat.
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 >> x: uValue y: vValue [
	self x: uValue.
	self y: vValue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector2 >> y [
	^self at: 2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:16'
}
Vector2 >> y: aFloat [

	self componentAt: 2 put: aFloat.
]
