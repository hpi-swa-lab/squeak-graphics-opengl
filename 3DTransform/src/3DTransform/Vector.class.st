"
I am the superclass for all floating point vector objects in Croquet.
"
Class {
	#name : #Vector,
	#superclass : #Float32Array,
	#type : #words,
	#category : #'3DTransform-Vectors'
}

{
	#category : #island,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector class >> howToPassAsArgument [
	"We clone all vectors, even the array ones to point out that manipulation of those vectors outside of some context is not a goof idea. We may reassess this later."
	^#passByClone:
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector class >> initialize [
	"Vector initialize"
	DataStream initialize. "register with DataStream"
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector class >> new [
	^super new: self numElements
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector class >> numElements [
	^0
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:04'
}
Vector >> componentAt: index [
	"Answer the Float at index in the receiver.  This method converts from either a 32-bit IEEE representation,
	 or a 64-bit IEEE representation to a Squeak Float object.  Primitive. Optional."
	<primitive: 238 error: ec>
	^ Float fromIEEE32Bit: (self basicAt: index)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/12/2021 18:15'
}
Vector >> componentAt: index put: value [
	"Store the Float value at index in the receiver.  This method converts from a Squeak Float object,
	 or an Integer, into either a 32-bit IEEE representation, or a 64-bit IEEE representation. Primitive. Optional."
	<primitive: 239 error: ec>
	value isFloat 
		ifTrue: [self basicAt: index put: value asIEEE32BitWord]
		ifFalse: [self componentAt: index put: value asFloat].
	^ value
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> copyFrom: array [

	| sz |
	sz := self size min: array size.
	1 to: sz do:[:index | self at:index put: (array at: index)].
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> loadFrom: srcObject [
	self == srcObject ifTrue:[^self].
	self class == srcObject class
		ifTrue:[self replaceFrom: 1 to: self size with: srcObject startingAt: 1]
		ifFalse:[self privateLoadFrom: srcObject]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> numElements [
	^self class numElements
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> privateLoadFrom: srcObject [
	"Load the receiver from the given source object."
	self error:'Cannot load a ', srcObject class name,' into a ', self class name.
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> replaceFrom: start to: stop with: replacement startingAt: repStart [ 
	"Primitive. This destructively replaces elements from start to stop in the receiver starting at index, repStart, in the collection, replacement. Answer the receiver. Range checks are performed in the primitive only. Optional. See Object documentation whatIsAPrimitive."
	| index repOff |
	<primitive: 105>
	repOff := repStart - start.
	index := start - 1.
	[(index := index + 1) <= stop]
		whileTrue: [self basicAt: index put: (replacement basicAt: repOff + index)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> wordAt: index [
	<primitive: 60>
	^self primitiveFailed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Vector >> wordAt: index put: value [
	<primitive: 61>
	^self primitiveFailed
]
