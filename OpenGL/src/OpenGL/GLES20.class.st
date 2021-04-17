Class {
	#name : #GLES20,
	#superclass : #GLVersion,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 14:00'
}
GLES20 class >> api [

	^ #gles2
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GLES20 class >> major [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GLES20 class >> minor [

	^ 0
]

{
	#category : #printing,
	#timestamp : 'stlu 4/17/2021 09:54'
}
GLES20 >> apiString [

	^ 'OpenGL ES'
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:17'
}
GLES20 >> getShadingLanguageVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary shadingLanguageVersionString.
	"OpenGL ES GLSL ES <major>.<minor> <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens fifth asInteger . tokens sixth asInteger }
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:17'
}
GLES20 >> getVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary versionString.
	"OpenGL ES <major>.<minor> <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]

{
	#category : #'external functions',
	#timestamp : 'stlu 4/15/2021 14:00'
}
GLES20 >> moduleName [

	| platform version |
	platform := Smalltalk platformName.
	version := Smalltalk osVersion.
	platform = 'unix' ifTrue: [
		version = 'linux-gnu' ifTrue: [^ 'libGLESv2.so']].
	self notYetImplemented.
]
