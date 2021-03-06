Class {
	#name : #GLSLType,
	#superclass : #Object,
	#classVars : [
		'EnumTable'
	],
	#pools : [
		'GLConstants'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'OpenGLObjects-Types'
}

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 11/23/2020 11:45'
}
GLSLType class >> compileAccessor: name value: return [

	self compileAccessor: name value: return classified: #accessing
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 11/23/2020 11:44'
}
GLSLType class >> compileAccessor: name value: return classified: category [

	self theMetaClass compile: name asString , '

	^ ' , return classified: category asSymbol
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/19/2020 18:00'
}
GLSLType class >> declarator [

	^ self declarators
		ifEmpty: [nil]
		ifNotEmpty: [:declarators | declarators first]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/19/2020 17:58'
}
GLSLType class >> declarators [

	^ #()
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/23/2020 12:46'
}
GLSLType class >> enum [
	"Returns the type's corresponding OpenGL enum value or nil if there is none."
	^ nil
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/23/2020 12:46'
}
GLSLType class >> enumName [
	"Returns the type's corresponding OpenGL enum name without the 'GL_' prefix"
	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/19/2020 06:44'
}
GLSLType class >> forEnum: anInteger [

	^ EnumTable at: anInteger
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 11/19/2020 06:19'
}
GLSLType class >> initialize [

	self initializeEnumTable
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 11/19/2020 06:16'
}
GLSLType class >> initializeEnumTable [

	EnumTable := Dictionary new: 120.
	self withAllSubclassesDo: [:cls |
		cls enum ifNotNil: [:enumValue |
			EnumTable at: enumValue put: cls instance]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/19/2020 06:30'
}
GLSLType class >> instance [

	^ instance ifNil: [instance := self basicNew initialize]
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/14/2020 16:19'
}
GLSLType class >> numElements: arraySize enum: typeEnum [

	^ arraySize > 1
		ifTrue: [GLSLArray numElements: arraySize enum: typeEnum]
		ifFalse: [self forEnum: typeEnum]
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 11/23/2020 11:14'
}
GLSLType class >> removeAllSubclasses [

	self allSubclassesDo: [:cls | cls removeFromSystem]
]

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 11/19/2020 17:47'
}
GLSLType class >> subclass: symbolOrString [

	^ self subclass: symbolOrString asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self category
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/23/2020 18:09'
}
GLSLType >> actualComponentType [

	^ self componentType
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 1/10/2021 12:35'
}
GLSLType >> declarationNamed: aString [

	^ String streamContents: [:stream |
		self printDeclarationNamed: aString on: stream]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/19/2020 17:58'
}
GLSLType >> declarator [

	^ self class declarator
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/22/2020 13:51'
}
GLSLType >> enum [

	^ self class enum
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:22'
}
GLSLType >> isArray [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:21'
}
GLSLType >> isImage [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:22'
}
GLSLType >> isMatrix [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:22'
}
GLSLType >> isSampler [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:22'
}
GLSLType >> isScalar [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:22'
}
GLSLType >> isVector [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/23/2020 16:15'
}
GLSLType >> numElements [

	^ 1
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 1/10/2021 12:35'
}
GLSLType >> printDeclarationNamed: aString on: aStream [

	aStream
		nextPutAll: self declarator;
		space;
		nextPutAll: aString
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 11/19/2020 17:58'
}
GLSLType >> printOn: aStream [

	self declarator
		ifNil: [super printOn: aStream]
		ifNotNil: [:declarator | aStream nextPutAll: declarator]
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:15'
}
GLSLType >> setUniform: aUniform toArray: aRawBitsArray [

	self setUniform: aUniform toArray: aRawBitsArray count: self numElements
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:08'
}
GLSLType >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	self subclassResponsibility
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:08'
}
GLSLType >> setUniform: aUniform toObject: anObject [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:01'
}
GLSLType >> squeakArrayClass [

	^ self class squeakArrayClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:00'
}
GLSLType >> squeakName [

	^ self class squeakName
]
