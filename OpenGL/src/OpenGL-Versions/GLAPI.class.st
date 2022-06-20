Class {
	#name : #GLAPI,
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
GLAPI class >> label [

	^ 'OpenGL'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:30'
}
GLAPI class >> maskToProfile: mask [

	(mask bitAnd: GL_CONTEXT_COMPATIBILITY_PROFILE_BIT) ~= 0 ifTrue: [^ #compatibility].
	(mask bitAnd: GL_CONTEXT_CORE_PROFILE_BIT) ~= 0 ifTrue: [^ #core].
	^ nil
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:39'
}
GLAPI class >> moduleName [

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
	self error: 'Cannot identify platform'.
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 18:11'
}
GLAPI class >> shadingLanguageVersionStringToMajorMinor: aString [

	| tokens |
	"<major>.<minor>[.<release>] <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens first asInteger . tokens second asInteger }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:32'
}
GLAPI class >> symbol [

	^ #gl
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:51'
}
GLAPI class >> versionPrefix [

	^ 'GL'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:39'
}
GLAPI class >> versionStringToMajorMinor: aString [

	| tokens |
	"<major>.<minor>[.<release>] <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens first asInteger . tokens second asInteger }
]
