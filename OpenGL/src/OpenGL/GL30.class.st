Class {
	#name : #GL30,
	#superclass : #GL21,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GL30 class >> major [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GL30 class >> minor [

	^ 0
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:12'
}
GL30 >> getExtensions: aLibrary [

	| extensions |
	extensions := Array new: aLibrary numExtensions.
	1 to: extensions size do: [:i |
		| extensionName |
		extensionName := aLibrary stringStateNamed: GL_EXTENSIONS at: i - 1.
		extensions at: i put: extensionName asSymbol].
	^ extensions
]
