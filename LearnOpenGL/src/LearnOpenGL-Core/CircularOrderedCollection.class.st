Class {
	#name : #CircularOrderedCollection,
	#superclass : #SequenceableCollection,
	#instVars : [
		'array',
		'tally',
		'firstIndex',
		'lastIndex'
	],
	#category : #'LearnOpenGL-Core',
	#'squeak_changestamp' : 'stlu 9/30/2021 17:53'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/17/2021 10:45'
}
CircularOrderedCollection class >> new [

	^ self new: 120
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 9/30/2021 16:27'
}
CircularOrderedCollection class >> new: sizeRequested [

	| instance |
	^ (instance := self basicNew) setCollection: (instance arrayType new: sizeRequested)
]

{
	#category : #adding,
	#'squeak_changestamp' : 'stlu 9/30/2021 15:50'
}
CircularOrderedCollection >> add: anObject [

	self addLast: anObject.
]

{
	#category : #adding,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:03'
}
CircularOrderedCollection >> addFirst: anObject [

	tally + 1 = array size ifTrue: [self grow].
	tally := tally + 1.
	firstIndex := firstIndex = 1
		ifTrue: [array size]
		ifFalse: [firstIndex - 1].
	^ array at: firstIndex put: anObject
]

{
	#category : #adding,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:03'
}
CircularOrderedCollection >> addLast: anObject [

	tally + 1 = array size ifTrue: [self grow].
	tally := tally + 1.
	lastIndex := lastIndex = array size
		ifTrue: [1]
		ifFalse: [lastIndex + 1].
	^ array at: lastIndex put: anObject
]

{
	#category : #growing,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:07'
}
CircularOrderedCollection >> arrayType [

	^ Array
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 18:10'
}
CircularOrderedCollection >> at: anInteger [

	(anInteger < 1 or: [anInteger > tally]) ifTrue: [self errorNoSuchElement].
	(firstIndex <= lastIndex
		or: [tally - lastIndex >= anInteger]) ifTrue: [
			^ array at: firstIndex + anInteger - 1].
	^ array at: lastIndex - tally + anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 18:11'
}
CircularOrderedCollection >> at: anInteger put: anObject [

	(anInteger < 1 or: [anInteger > tally]) ifTrue: [self errorNoSuchElement].
	(firstIndex <= lastIndex
		or: [tally - lastIndex >= anInteger]) ifTrue: [
			^ array at: firstIndex + anInteger - 1 put: anObject].
	^ array at: lastIndex - tally + anInteger put: anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:28'
}
CircularOrderedCollection >> capacity [

	^ array size
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'stlu 9/30/2021 18:22'
}
CircularOrderedCollection >> collect: aBlock [

	| newCollection |
	newCollection := self species new: tally.
	tally = 0 ifTrue: [^ newCollection].
	firstIndex <= lastIndex
		ifTrue: [
			firstIndex to: lastIndex do: [:i |
				newCollection addLast: (aBlock value: (array at: i))]]
		ifFalse: [
			firstIndex to: array size do: [:i |
				newCollection addLast: (aBlock value: (array at: i))].
			1 to: lastIndex do: [:i |
				newCollection addLast: (aBlock value: (array at: i))]].
	^ newCollection
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'stlu 9/30/2021 18:29'
}
CircularOrderedCollection >> collect: aBlock  from: fromIndex to: toIndex [

	| newCollection |
	self notYetImplemented.
	(fromIndex < 1 or: [toIndex > tally]) ifTrue: [^ self errorNoSuchElement].
	newCollection := self species new: tally.
	tally = 0 ifTrue: [^ newCollection].
	firstIndex <= lastIndex
		ifTrue: [
			firstIndex + fromIndex - 1 to: firstIndex + toIndex - 1 do: [:i |
				newCollection addLast: (aBlock value: (array at: i))]]
		ifFalse: [
			firstIndex + fromIndex - 1
				to: (firstIndex + toIndex - 1 min: array size)
				do: [:i | newCollection addLast: (aBlock value: (array at: i))].
			1 to: lastIndex do: [:i |
				newCollection addLast: (aBlock value: (array at: i))]].
	^ newCollection
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:16'
}
CircularOrderedCollection >> do: aBlock [

	tally = 0 ifTrue: [^ self].
	firstIndex <= lastIndex
		ifTrue: [
			firstIndex to: lastIndex do: [:i |
				aBlock value: (array at: i)]]
		ifFalse: [
			firstIndex to: array size do: [:i |
				aBlock value: (array at: i)].
			1 to: lastIndex do: [:i |
				aBlock value: (array at: i)]].
]

{
	#category : #errors,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:23'
}
CircularOrderedCollection >> errorNoSuchElement [

	self error: 'attempt to index a non-existent element'.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:29'
}
CircularOrderedCollection >> first [

	tally = 0 ifTrue: [^ self errorNoSuchElement].
	^ array at: firstIndex
]

{
	#category : #growing,
	#'squeak_changestamp' : 'stlu 9/30/2021 17:23'
}
CircularOrderedCollection >> grow [

	self growTo: (array size * 2 max: 1).
]

{
	#category : #growing,
	#'squeak_changestamp' : 'stlu 9/30/2021 17:25'
}
CircularOrderedCollection >> growTo: newSize [

	| newArray |
	newSize < array size ifTrue: [
		^ self error: 'cannot shrink'].
	newArray := self arrayType new: newSize.
	firstIndex <= lastIndex
		ifTrue: [
			newArray
				replaceFrom: 1
				to: tally
				with: array
				startingAt: firstIndex]
		ifFalse: [
			| rightSize |
			rightSize := array size - firstIndex + 1.
			newArray
				replaceFrom: 1
				to: rightSize
				with: array
				startingAt: firstIndex.
			newArray
				replaceFrom: rightSize + 1
				to: tally
				with: array
				startingAt: 1].
	firstIndex := 1.
	lastIndex := tally.
	array := newArray.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:29'
}
CircularOrderedCollection >> last [

	tally = 0 ifTrue: [^ self errorNoSuchElement].
	^ array at: lastIndex
]

{
	#category : #removing,
	#'squeak_changestamp' : 'stlu 9/30/2021 18:01'
}
CircularOrderedCollection >> removeFirst: n [

	(n < 0 or: [n > tally]) ifTrue: [self errorNoSuchElement].
	firstIndex := array size - firstIndex >= n
		ifTrue: [firstIndex + n]
		ifFalse: [lastIndex + n - tally + 1].
	tally := tally - n.
]

{
	#category : #removing,
	#'squeak_changestamp' : 'stlu 9/30/2021 17:56'
}
CircularOrderedCollection >> removeLast: n [

	(n < 0 or: [n > tally]) ifTrue: [self errorNoSuchElement].
	lastIndex := lastIndex > n
		ifTrue: [lastIndex - n]
		ifFalse: [firstIndex + tally - n - 1].
	tally := tally - n.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:01'
}
CircularOrderedCollection >> setCollection: aCollection [

	array := aCollection.
	firstIndex := 1.
	lastIndex := array size.
	tally := 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/30/2021 16:01'
}
CircularOrderedCollection >> size [

	^ tally
]
