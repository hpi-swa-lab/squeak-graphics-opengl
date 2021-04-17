Class {
	#name : #GL10,
	#superclass : #GLVersion,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 13:56'
}
GL10 class >> api [

	^ #gl
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GL10 class >> major [

	^ 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GL10 class >> minor [

	^ 0
]

{
	#category : #printing,
	#timestamp : 'stlu 4/17/2021 09:54'
}
GL10 >> apiString [

	^ 'OpenGL'
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:14'
}
GL10 >> getShadingLanguageVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary shadingLanguageVersionString.
	"<major>.<minor>[.<release>] <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens first asInteger . tokens second asInteger }
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:15'
}
GL10 >> getVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary versionString.
	"<major>.<minor>[.<release>] <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens first asInteger . tokens second asInteger }
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 13:56'
}
GL10 >> moduleName [

	| platform version |
	platform := Smalltalk platformName.
	version := Smalltalk osVersion.
	platform = 'Win32' ifTrue: [^ 'opengl32.dll'].
	platform = 'Mac OS' ifTrue:[
		version asNumber >= 1000 ifTrue: [^ 'OpenGL.framework'].
		^ self notYetImplemented].
	platform = 'unix' ifTrue: [
		"default to X11 window system"
		^ version = 'linux-gnu'
			ifTrue: ['libGL.so']
			ifFalse: ['GL']].
	self error: 'Cannot identify platform'
]
