"
I am, for most intents and purposes, a named integer.
"
Class {
	#name : #GLEnum,
	#superclass : #Magnitude,
	#instVars : [
		'value',
		'name'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 7/22/2021 19:23'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/22/2021 15:32'
}
GLEnum class >> value: anInteger [

	^ self value: anInteger name: ''
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/22/2021 15:31'
}
GLEnum class >> value: anInteger name: aString [

	^ self basicNew
		initializeValue: anInteger name: aString;
		yourself
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:44'
}
GLEnum >> * aNumber [

	^ value * aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:43'
}
GLEnum >> + aNumber [

	^ value + aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:43'
}
GLEnum >> - aNumber [

	^ value - aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLEnum >> / aNumber [

	^ value / aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLEnum >> // aNumber [

	^ value // aNumber
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLEnum >> << shiftAmount [

	^ value << shiftAmount
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:56'
}
GLEnum >> = anObject [

	^ value = anObject
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLEnum >> >> shiftAmount [

	^ value >> shiftAmount
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLEnum >> \\ aNumber [

	^ value \\ aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLEnum >> abs [

	^ value abs
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:31'
}
GLEnum >> adaptToFloat: rcvr andSend: selector [

	^ rcvr perform: selector with: value asFloat
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:33'
}
GLEnum >> adaptToFraction: rcvr andSend: selector [

	^ rcvr perform: selector with: value asFraction
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:32'
}
GLEnum >> adaptToInteger: rcvr andSend: selector [

	^ rcvr perform: selector with: value
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLEnum >> allMask: mask [

	^ value allMask: mask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLEnum >> anyMask: mask [

	^ value anyMask: mask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLEnum >> bitAnd: anInteger [

	^ value bitAnd: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLEnum >> bitAt: anInteger [

	^ value bitAt: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLEnum >> bitAt: anInteger put: value [

	^ value bitAt: anInteger put: value
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLEnum >> bitClear: aMask [

	^ value bitClear: aMask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLEnum >> bitCount [

	^ value bitCount
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLEnum >> bitInvert [

	^ value bitInvert
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLEnum >> bitOr: anInteger [

	^ value bitOr: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLEnum >> bitReverse: highBit [

	^ value bitReverse: highBit
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLEnum >> bitShift: shiftCount [

	^ value bitShift: shiftCount
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLEnum >> bitXor: anInteger [

	^ value bitXor: anInteger
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:56'
}
GLEnum >> hash [

	^ value hash
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLEnum >> highBit [

	^ value highBit
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLEnum >> initializeValue: anInteger name: aString [

	value := anInteger.
	name := aString.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/22/2021 17:52'
}
GLEnum >> isNumber [

	^ true
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:52'
}
GLEnum >> lowBit [

	^ value lowBit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLEnum >> name [

	^ name
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLEnum >> negated [

	^ value negated
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:52'
}
GLEnum >> noMask: mask [

	^ value noMask: mask
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:42'
}
GLEnum >> printOn: aStream [

	aStream nextPut: $<.
	name
		ifEmpty: [value storeOn: aStream base: 16]
		ifNotEmpty: [aStream nextPutAll: name].
	aStream nextPut: $>.
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLEnum >> quo: aNumber [

	^ value quo: aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLEnum >> reciprocal [

	^ value reciprocal
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLEnum >> rem: aNumber [

	^ value rem: aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLEnum >> value [

	^ value
]
