Class {
	#name : #GL32,
	#superclass : #GL31,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GL32 class >> major [

	^ 3
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GL32 class >> minor [

	^ 2
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/16/2021 14:11'
}
GL32 >> getProfile: aLibrary [

	| mask |
	mask := aLibrary integerStateNamed: GL_CONTEXT_PROFILE_MASK.
	(mask bitAnd: GL_CONTEXT_COMPATIBILITY_PROFILE_BIT) ~= 0 ifTrue: [^ #compatibility].
	(mask bitAnd: GL_CONTEXT_CORE_PROFILE_BIT) ~= 0 ifTrue: [^ #core].
	^ nil
]
