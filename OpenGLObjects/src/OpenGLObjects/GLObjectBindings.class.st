Class {
	#name : #GLObjectBindings,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'vertexArray',
		'program',
		'arrayBuffer',
		'readFrameBuffer',
		'drawFrameBuffer',
		'renderBuffer'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-Core'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/15/2021 13:08'
}
GLObjectBindings class >> current [

	^ GL context objectBindings
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> arrayBuffer [

	^ arrayBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> arrayBuffer: anObject [

	arrayBuffer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> dictionary [

	^ dictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> dictionary: anObject [

	dictionary := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> drawFrameBuffer [

	^ drawFrameBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> drawFrameBuffer: anObject [

	drawFrameBuffer := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 3/14/2021 18:13'
}
GLObjectBindings >> initialize [

	dictionary := Dictionary new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> program [

	^ program
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> readFrameBuffer [

	^ readFrameBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> readFrameBuffer: anObject [

	readFrameBuffer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> renderBuffer [

	^ renderBuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> renderBuffer: anObject [

	renderBuffer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> vertexArray [

	^ vertexArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 13:12'
}
GLObjectBindings >> vertexArray: anObject [

	vertexArray := anObject
]
