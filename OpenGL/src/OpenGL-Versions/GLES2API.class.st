Class {
	#name : #GLES2API,
	#superclass : #GLAPIType,
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Versions'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:49'
}
GLES2API class >> label [

	^ 'OpenGL ES'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:09'
}
GLES2API class >> moduleName [

	| platform version |
	platform := Smalltalk platformName.
	version := Smalltalk osVersion.
	platform = 'unix' ifTrue: [
		version = 'linux-gnu' ifTrue: [^ 'libGLESv2.so']].
	self notYetImplemented.
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 18:13'
}
GLES2API class >> shadingLanguageVersionStringToMajorMinor: aString [

	| tokens |
	"OpenGL ES GLSL ES <major>.<minor> <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens fifth asInteger . tokens sixth asInteger }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:33'
}
GLES2API class >> symbol [

	^ #gles2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:52'
}
GLES2API class >> versionPrefix [

	^ 'GLES'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:41'
}
GLES2API class >> versionStringToMajorMinor: aString [

	| tokens |
	"OpenGL ES <major>.<minor> <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]
