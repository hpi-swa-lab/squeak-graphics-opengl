Class {
	#name : #VectorView,
	#superclass : #ArrayedCollection,
	#instVars : [
		'store',
		'size',
		'start',
		'stride'
	],
	#category : #'3DTransform-Views',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/22/2021 11:34'
}
VectorView class >> new: sizeRequested [

	^ self
		store: (self storeClass new: sizeRequested)
		size: sizeRequested
		start: 1
		stride: 1
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/25/2021 20:22'
}
VectorView class >> packedStore: aCollection [

	^ self
		store: aCollection
		size: aCollection size
		start: 1
		stride: 1
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/18/2021 23:10'
}
VectorView class >> store: aCollection size: size start: start stride: stride [

	^ self basicNew setStore: aCollection size: size start: start stride: stride
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/21/2021 18:21'
}
VectorView class >> storeClass [

	^ Array
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/25/2021 20:23'
}
VectorView >> * numberOrVector [
	"Component-wise multiplication."
	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		^ self species packedStore: store * numberOrVector store].
	
	^ self
		with: numberOrVector
		collect: [:left :right | left * right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> ** scalarOrVector [

	^ self raisedTo: scalarOrVector
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/25/2021 20:40'
}
VectorView >> *= numberOrVector [
	"Component-wise multiplication."
	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		store *= numberOrVector store.
		^ self].
	
	self
		with: numberOrVector
		collect: [:left :right | left * right]
		into: self
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:04'
}
VectorView >> + numberOrVector [

	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		^ self species packedStore: store + numberOrVector store].

	^ self
		with: numberOrVector
		collect: [:left :right | left + right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/25/2021 23:59'
}
VectorView >> += numberOrVector [
	"Component-wise addition."
	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		store += numberOrVector store.
		^ self].
	
	self
		with: numberOrVector
		collect: [:left :right | left + right]
		into: self
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:04'
}
VectorView >> - numberOrVector [

	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		^ self species packedStore: store - numberOrVector store].

	^ self
		with: numberOrVector
		collect: [:left :right | left - right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:01'
}
VectorView >> -= numberOrVector [
	"Component-wise substraction."
	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		store -= numberOrVector store.
		^ self].
	
	self
		with: numberOrVector
		collect: [:left :right | left - right]
		into: self
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:04'
}
VectorView >> / numberOrVector [

	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		^ self species packedStore: store / numberOrVector store].

	^ self
		with: numberOrVector
		collect: [:left :right | left / right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:01'
}
VectorView >> /= numberOrVector [
	"Component-wise division."
	(self isPacked and: [numberOrVector isPacked]) ifTrue: [
		store /= numberOrVector store.
		^ self].
	
	self
		with: numberOrVector
		collect: [:left :right | left / right]
		into: self
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:03'
}
VectorView >> \\ scalarOrVector [
	"Component-wise modulo."
	^ self
		with: scalarOrVector
		collect: [:left :right | left \\ right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/26/2021 00:03'
}
VectorView >> \\= numberOrVector [
	"Component-wise modulo."
	self
		with: numberOrVector
		collect: [:left :right | left \\ right]
		into: self
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> abs [

	^ self collect: [:each | each abs]
]

{
	#category : #adapting,
	#timestamp : 'stlu 1/22/2021 16:32'
}
VectorView >> adaptToNumber: aNumber andSend: selector [

	^ self perform: selector with: aNumber
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arCosh [

	^ self collect: [:each | each arCosh]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arSinh [

	^ self collect: [:each | each arSinh]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arTanh [

	^ self collect: [:each | each arTanh]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arcCos [

	^ self collect: [:each | each arcCos]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arcSin [

	^ self collect: [:each | each arcSin]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> arcTan [

	^ self collect: [:each | each arcTan]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 21:54'
}
VectorView >> at: anIndex [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 21:54'
}
VectorView >> at: anIndex put: anObject [

	self subclassResponsibility
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:56'
}
VectorView >> ceiling [

	^ self collect: [:each | each ceiling]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:09'
}
VectorView >> clampHigh: max [

	^ self min: max
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:09'
}
VectorView >> clampLow: min [

	^ self max: min
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:07'
}
VectorView >> clampLow: min high: max [

	^ self min: max max: min
]

{
	#category : #copying,
	#timestamp : 'stlu 1/19/2021 00:04'
}
VectorView >> copyWithOffset: offset [

	^ self shallowCopy start: start + offset
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> cos [

	^ self collect: [:each | each cos]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> cosh [

	^ self collect: [:each | each cosh]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> degreesToRadians [

	^ self collect: [:each | each degreesToRadians]
]

{
	#category : #geometry,
	#timestamp : 'stlu 1/25/2021 17:59'
}
VectorView >> dot: aVector [

	| result |
	(self isPacked and: [aVector isPacked]) ifTrue: [
		^ store dot: aVector store].
	
	self isOfSameSizeCheck: aVector.
	result := 0.
	1 to: self size do: [:i |
		result := result + ((self at: i) * (aVector at: i))].
	^ result
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> exp [

	^ self collect: [:each | each exp]
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:52'
}
VectorView >> exp2 [

	^ self collect: [:each | each exp2]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:49'
}
VectorView >> floor [

	^ self collect: [:each | each floor]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:56'
}
VectorView >> fractionPart [

	^ self collect: [:each | each fractionPart]
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:55'
}
VectorView >> inverseSqrt [

	^ self collect: [:each | each inverseSqrt]
]

{
	#category : #testing,
	#timestamp : 'stlu 1/25/2021 17:57'
}
VectorView >> isPacked [

	stride ~= 1 ifTrue: [^ false].
	start ~= 1 ifTrue: [^ false].
	size ~= store size ifTrue: [^ false].
	^ true
]

{
	#category : #testing,
	#timestamp : 'stlu 1/19/2021 13:07'
}
VectorView >> isVector [

	^ true
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> log [

	^ self collect: [:each | each log]
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> log2 [

	^ self collect: [:each | each log2]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:40'
}
VectorView >> max: scalarOrVector [

	^ self
		with: scalarOrVector
		collect: [:left :right | left max: right]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:39'
}
VectorView >> min: scalarOrVector [

	^ self
		with: scalarOrVector
		collect: [:left :right | left min: right]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:50'
}
VectorView >> min: aMin max: aMax [

	^ self
		with: aMin
		with: aMax
		collect: [:each :min :max|
			each min: min max: max]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 15:51'
}
VectorView >> mix: scalarOrVector alpha: blendFactor [

	^ self
		with: scalarOrVector
		with: blendFactor
		collect: [:left :right :alpha |
			left mix: right alpha: alpha]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/22/2021 16:40'
}
VectorView >> negated [

	^ self collect: [:each | each negated]
]

{
	#category : #copying,
	#timestamp : 'stlu 1/21/2021 17:34'
}
VectorView >> postCopy [

	store := store copyFrom: start to: start + (stride * size) - 1
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> radiansToDegrees [

	^ self collect: [:each | each radiansToDegrees]
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 15:40'
}
VectorView >> raisedTo: scalarOrVector [

	^ self
		with: scalarOrVector
		collect: [:left :right | left raisedTo: right]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/22/2021 16:41'
}
VectorView >> reciprocal [

	^ self collect: [:each | each reciprocal]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:51'
}
VectorView >> roundEven [

	^ self collect: [:each | each roundEven]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:50'
}
VectorView >> rounded [

	^ self collect: [:each | each rounded]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/18/2021 23:10'
}
VectorView >> setStore: aCollection size: numComponents start: startIndex stride: theStride [

	store := aCollection.
	size := numComponents.
	start := startIndex.
	stride := theStride
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:48'
}
VectorView >> sign [

	^ self collect: [:each | each sign]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> sin [

	^ self collect: [:each | each sin]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> sinh [

	^ self collect: [:each | each sinh]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:58'
}
VectorView >> size [

	^ size
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:53'
}
VectorView >> size: anObject [

	size := anObject
]

{
	#category : #exponential,
	#timestamp : 'stlu 1/22/2021 13:33'
}
VectorView >> sqrt [

	^ self collect: [:each | each sqrt]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 23:09'
}
VectorView >> start [

	^ start
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 23:09'
}
VectorView >> start: anObject [

	start := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:53'
}
VectorView >> store [

	^ store
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:53'
}
VectorView >> store: anObject [

	store := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:53'
}
VectorView >> stride [

	^ stride
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/18/2021 22:53'
}
VectorView >> stride: anObject [

	stride := anObject
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> tan [

	^ self collect: [:each | each tan]
]

{
	#category : #trigonometric,
	#timestamp : 'stlu 1/22/2021 13:20'
}
VectorView >> tanh [

	^ self collect: [:each | each tanh]
]

{
	#category : #common,
	#timestamp : 'stlu 1/22/2021 13:49'
}
VectorView >> truncated [

	^ self collect: [:each | each truncated]
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 22:37'
}
VectorView >> w [

	^ self at: 4
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 23:03'
}
VectorView >> w: value [

	^ self at: 4 put: value
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/25/2021 20:29'
}
VectorView >> with: vectorOrNumber collect: twoArgBlock [ 

	^ self
		with: vectorOrNumber
		collect: twoArgBlock
		into: (self species new: self size)
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/25/2021 20:28'
}
VectorView >> with: vectorOrNumber collect: twoArgBlock into: resultCollection [

	vectorOrNumber isNumber ifFalse: [
		self isOfSameSizeCheck: vectorOrNumber].
	
	1 to: self size do: [:index |
		| rightComponent |
		rightComponent := vectorOrNumber isNumber
								ifTrue: [vectorOrNumber]
								ifFalse: [(vectorOrNumber at: index)].
		resultCollection
			at: index
			put: (twoArgBlock
					value: (self at: index)
					value: rightComponent)].
	
	^ resultCollection
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/25/2021 20:35'
}
VectorView >> with: vectorOrNumber1 with: vectorOrNumber2 collect: threeArgBlock [ 

	self
		with: vectorOrNumber1
		with: vectorOrNumber2
		collect: threeArgBlock
		into: (self species new: self size)
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/25/2021 20:34'
}
VectorView >> with: vectorOrNumber1 with: vectorOrNumber2 collect: threeArgBlock into: resultCollection [

	vectorOrNumber1 isNumber ifFalse: [self isOfSameSizeCheck: vectorOrNumber1].
	vectorOrNumber2 isNumber ifFalse: [self isOfSameSizeCheck: vectorOrNumber2].
	
	1 to: self size do: [:index |
		| component1 component2 |
		component1 := vectorOrNumber1 isNumber
								ifTrue: [vectorOrNumber1]
								ifFalse: [(vectorOrNumber1 at: index)].
		component2 := vectorOrNumber2 isNumber
								ifTrue: [vectorOrNumber2]
								ifFalse: [(vectorOrNumber2 at: index)].
		resultCollection
			at: index
			put: (threeArgBlock
					value: (self at: index)
					value: component1
					value: component2)].
	^ resultCollection
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/25/2021 20:08'
}
VectorView >> with: vectorOrNumber withIndexDo: threeArgBlock [

	vectorOrNumber isNumber ifFalse: [
		self isOfSameSizeCheck: vectorOrNumber].
	
	1 to: self size do: [:index |
		threeArgBlock
			value: (self at: index)
			value: (vectorOrNumber isNumber
					ifTrue: [vectorOrNumber]
					ifFalse: [(vectorOrNumber at: index)])
			value: index]
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 21:52'
}
VectorView >> x [

	^ self at: 1
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 23:04'
}
VectorView >> x: value [

	^ self at: 1 put: value
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 22:36'
}
VectorView >> y [

	^ self at: 2
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 23:04'
}
VectorView >> y: value [

	^ self at: 2 put: value
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 22:37'
}
VectorView >> z [

	^ self at: 3
]

{
	#category : #swizzling,
	#timestamp : 'stlu 1/18/2021 23:04'
}
VectorView >> z: value [

	^ self at: 3 put: value
]
