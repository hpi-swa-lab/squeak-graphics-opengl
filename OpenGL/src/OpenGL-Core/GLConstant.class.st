"
I am, for all intents and purposes, a named integer.
"
Class {
	#name : #GLConstant,
	#superclass : #Magnitude,
	#instVars : [
		'value',
		'name'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 9/20/2021 14:07'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/22/2021 15:32'
}
GLConstant class >> value: anInteger [

	^ self value: anInteger name: ''
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/22/2021 15:31'
}
GLConstant class >> value: anInteger name: aString [

	^ self basicNew
		initializeValue: anInteger name: aString;
		yourself
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:44'
}
GLConstant >> * aNumber [

	^ value * aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:43'
}
GLConstant >> + aNumber [

	^ value + aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:43'
}
GLConstant >> - aNumber [

	^ value - aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLConstant >> / aNumber [

	^ value / aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLConstant >> // aNumber [

	^ value // aNumber
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLConstant >> << shiftAmount [

	^ value << shiftAmount
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:56'
}
GLConstant >> = anObject [

	^ value = anObject
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLConstant >> >> shiftAmount [

	^ value >> shiftAmount
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:53'
}
GLConstant >> \\ aNumber [

	^ value \\ aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLConstant >> abs [

	^ value abs
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:31'
}
GLConstant >> adaptToFloat: rcvr andSend: selector [

	^ rcvr perform: selector with: value asFloat
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:33'
}
GLConstant >> adaptToFraction: rcvr andSend: selector [

	^ rcvr perform: selector with: value asFraction
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:32'
}
GLConstant >> adaptToInteger: rcvr andSend: selector [

	^ rcvr perform: selector with: value
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:48'
}
GLConstant >> allMask: mask [

	^ value allMask: mask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLConstant >> anyMask: mask [

	^ value anyMask: mask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLConstant >> bitAnd: anInteger [

	^ value bitAnd: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLConstant >> bitAt: anInteger [

	^ value bitAt: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLConstant >> bitAt: anInteger put: value [

	^ value bitAt: anInteger put: value
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLConstant >> bitClear: aMask [

	^ value bitClear: aMask
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLConstant >> bitCount [

	^ value bitCount
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:50'
}
GLConstant >> bitInvert [

	^ value bitInvert
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLConstant >> bitOr: anInteger [

	^ value bitOr: anInteger
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLConstant >> bitReverse: highBit [

	^ value bitReverse: highBit
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLConstant >> bitShift: shiftCount [

	^ value bitShift: shiftCount
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:49'
}
GLConstant >> bitXor: anInteger [

	^ value bitXor: anInteger
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:56'
}
GLConstant >> hash [

	^ value hash
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:51'
}
GLConstant >> highBit [

	^ value highBit
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLConstant >> initializeValue: anInteger name: aString [

	value := anInteger.
	name := aString.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/22/2021 17:52'
}
GLConstant >> isNumber [

	^ true
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:52'
}
GLConstant >> lowBit [

	^ value lowBit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLConstant >> name [

	^ name
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLConstant >> negated [

	^ value negated
]

{
	#category : #'bit manipulation',
	#'squeak_changestamp' : 'stlu 7/22/2021 18:52'
}
GLConstant >> noMask: mask [

	^ value noMask: mask
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:42'
}
GLConstant >> printOn: aStream [

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
GLConstant >> quo: aNumber [

	^ value quo: aNumber
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLConstant >> reciprocal [

	^ value reciprocal
]

{
	#category : #arithmetic,
	#'squeak_changestamp' : 'stlu 7/22/2021 18:54'
}
GLConstant >> rem: aNumber [

	^ value rem: aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/22/2021 15:30'
}
GLConstant >> value [

	^ value
]
