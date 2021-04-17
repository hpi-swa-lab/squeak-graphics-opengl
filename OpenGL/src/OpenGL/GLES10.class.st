Class {
	#name : #GLES10,
	#superclass : #GLVersion,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 13:58'
}
GLES10 class >> api [

	^ #gles1
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GLES10 class >> major [

	^ 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GLES10 class >> minor [

	^ 0
]

{
	#category : #printing,
	#timestamp : 'stlu 4/17/2021 09:54'
}
GLES10 >> apiString [

	^ 'OpenGL ES'
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:16'
}
GLES10 >> getVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary getVersionString.
	"OpenGL ES-XX N.M" "XX={CM,CL}"
	tokens := versionString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]

{
	#category : #'external functions',
	#timestamp : 'stlu 4/15/2021 13:58'
}
GLES10 >> moduleName [

	| platform version |
	platform := Smalltalk platformName.
	version := Smalltalk osVersion.
	platform = 'unix' ifTrue: [
		version = 'linux-gnu' ifTrue: [^ 'libGLESv1_CM.so'].
		^ self notYetImplemented].
	self notYetImplemented
]
