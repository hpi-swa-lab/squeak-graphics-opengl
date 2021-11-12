"
I am similar to an LRU cache.
An unlimited number of objects can be added to me, however, I only remember the newest `n`.
"
Class {
	#name : #RingBuffer,
	#superclass : #SequenceableCollection,
	#instVars : [
		'array',
		'firstIndex',
		'tally'
	],
	#category : #'LearnOpenGL-Core',
	#'squeak_changestamp' : 'stlu 6/17/2021 13:05'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/17/2021 10:45'
}
RingBuffer class >> new [

	^ self new: 120
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/17/2021 10:44'
}
RingBuffer class >> new: sizeRequested [

	^ super new setCollection: (Array new: sizeRequested)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:08'
}
RingBuffer >> add: anObject [

	firstIndex := (firstIndex - 2 \\ array size) + 1.
	tally := tally + 1 min: array size.
	^ array at: firstIndex put: anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/29/2021 13:42'
}
RingBuffer >> at: anInteger [

	(anInteger < 1 or: [anInteger > tally]) ifTrue: [
		self error: 'attempt to index a non-existent element'].
	^ array at: (firstIndex - 2 + anInteger \\ array size) + 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/29/2021 13:42'
}
RingBuffer >> at: anInteger put: anObject [

	(anInteger < 1 or: [anInteger > tally]) ifTrue: [
		self error: 'attempt to index a non-existent element'].
	^ array at: (firstIndex - 2 + anInteger \\ array size) + 1 put: anObject
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'stlu 9/29/2021 13:39'
}
RingBuffer >> do: aBlock [

	-1 to: tally - 2 do: [:offset |
		aBlock value: (array at: (firstIndex + offset \\ array size) + 1)].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/17/2021 10:57'
}
RingBuffer >> setCollection: aCollection [

	array := aCollection.
	firstIndex := 1.
	tally := 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:08'
}
RingBuffer >> size [

	^ tally
]
