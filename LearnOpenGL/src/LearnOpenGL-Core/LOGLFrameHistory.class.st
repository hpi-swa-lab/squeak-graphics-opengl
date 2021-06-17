"
I am similar to an LRU cache.
An unlimited number of objects can be added to me, however, I only remember the newest `n`.
"
Class {
	#name : #LOGLFrameHistory,
	#superclass : #Collection,
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
LOGLFrameHistory class >> new [

	^ self new: 120
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/17/2021 10:44'
}
LOGLFrameHistory class >> new: sizeRequested [

	^ super new setCollection: (Array new: sizeRequested)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:08'
}
LOGLFrameHistory >> add: anObject [

	firstIndex := (firstIndex - 2 \\ array size) + 1.
	tally := tally + 1 min: array size.
	^ array at: firstIndex put: anObject
]

{
	#category : #enumerating,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:03'
}
LOGLFrameHistory >> do: aBlock [

	-1 to: tally - 2 do: [:offset |
		aBlock value: (array at: (firstIndex + offset \\ array size) + 1)]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:09'
}
LOGLFrameHistory >> remove: oldObject ifAbsent: anExceptionBlock [

	self shouldNotImplement.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/17/2021 10:57'
}
LOGLFrameHistory >> setCollection: aCollection [

	array := aCollection.
	firstIndex := 1.
	tally := 0.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/17/2021 11:08'
}
LOGLFrameHistory >> size [

	^ tally
]
