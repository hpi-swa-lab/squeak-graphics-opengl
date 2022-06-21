Class {
	#name : #GLSC2API,
	#superclass : #GLAPIType,
	#category : #'OpenGL-Constants'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:49'
}
GLSC2API class >> label [

	^ 'OpenGL SC'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:10'
}
GLSC2API class >> moduleName [

	self notYetImplemented
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 18:13'
}
GLSC2API class >> shadingLanguageVersionStringToMajorMinor: aString [

	| tokens |
	"OpenGL SC GLSL ES <major>.<minor> <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens fifth asInteger . tokens sixth asInteger }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:33'
}
GLSC2API class >> symbol [

	^ #glsc2
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:52'
}
GLSC2API class >> versionPrefix [

	^ 'GLSC'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:41'
}
GLSC2API class >> versionStringToMajorMinor: aString [

	| tokens |
	"OpenGL SC <major>.<minor> <vendor-specific information>"
	tokens := aString findTokens: '. '.
	^ { tokens third asInteger . tokens fourth asInteger }
]
