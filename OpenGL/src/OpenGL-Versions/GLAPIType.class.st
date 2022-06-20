Class {
	#name : #GLAPIType,
	#superclass : #Object,
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Versions'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/20/2022 13:46'
}
GLAPIType class >> fromSymbol: aSymbol [

	self subclassesDo: [:cls |
		cls symbol = aSymbol ifTrue: [^ cls]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:48'
}
GLAPIType class >> label [

	self subclassResponsibility.
]

{
	#category : #versions,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:09'
}
GLAPIType class >> major: majorVersion minor: minorVersion [

	^ self major: majorVersion minor: minorVersion profile: nil
]

{
	#category : #versions,
	#'squeak_changestamp' : 'stlu 6/20/2022 15:08'
}
GLAPIType class >> major: majorVersion minor: minorVersion profile: profileSymbol [

	^ GLVersion api: self major: majorVersion minor: minorVersion profile: profileSymbol
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:30'
}
GLAPIType class >> maskToProfile: mask [

	^ nil
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 6/20/2022 13:45'
}
GLAPIType class >> new [

	self shouldNotImplement.
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 18:14'
}
GLAPIType class >> shadingLanguageVersionStringToMajorMinor: aString [

	self subclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:47'
}
GLAPIType class >> symbol [

	self subclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/20/2022 13:53'
}
GLAPIType class >> versionPrefix [
	"Prefix used to specify version objects."
	self subclassResponsibility.
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:40'
}
GLAPIType class >> versionStringToMajorMinor: aString [
	"Returns an array of two elements, the major version and the minor version."
	self subclassResponsibility.
]
