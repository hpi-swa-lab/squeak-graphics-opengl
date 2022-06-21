Class {
	#name : #GLES1API,
	#superclass : #GLAPIType,
	#category : #'OpenGL-Constants'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:49'
}
GLES1API class >> label [

	^ 'OpenGL ES'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:08'
}
GLES1API class >> moduleName [

	| platform version |
	platform := Smalltalk platformName.
	version := Smalltalk osVersion.
	platform = 'unix' ifTrue: [
		version = 'linux-gnu' ifTrue: [^ 'libGLESv1_CM.so'].
		^ self notYetImplemented].
	self notYetImplemented
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:32'
}
GLES1API class >> symbol [

	^ #gles1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:52'
}
GLES1API class >> versionPrefix [

	^ 'GLES'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:40'
}
GLES1API class >> versionStringToMajorMinor: aString [

	| tokens |
	"OpenGL ES-XX N.M" "XX={CM,CL}"
	tokens := aString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]
