Class {
	#name : #GLSC20,
	#superclass : #GLVersion,
	#category : #'OpenGL-Versions',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 14:01'
}
GLSC20 class >> api [

	^ #glsc2
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:02'
}
GLSC20 class >> major [

	^ 2
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/15/2021 18:01'
}
GLSC20 class >> minor [

	^ 0
]

{
	#category : #printing,
	#timestamp : 'stlu 4/17/2021 09:54'
}
GLSC20 >> apiString [

	^ 'OpenGL SC'
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:18'
}
GLSC20 >> getShadingLanguageVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary shadingLanguageVersionString.
	"OpenGL SC GLSL ES <major>.<minor> <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens fifth asInteger . tokens sixth asInteger }
]

{
	#category : #parameters,
	#timestamp : 'stlu 4/15/2021 19:18'
}
GLSC20 >> getVersion: aLibrary [

	| versionString tokens |
	versionString := aLibrary versionString.
	"OpenGL SC <major>.<minor> <vendor-specific information>"
	tokens := versionString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]

{
	#category : #'external functions',
	#timestamp : 'stlu 4/15/2021 19:21'
}
GLSC20 >> moduleName [

	self notYetImplemented
]
