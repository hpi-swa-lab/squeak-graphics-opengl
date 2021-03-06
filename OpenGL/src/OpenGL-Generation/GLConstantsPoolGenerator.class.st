Class {
	#name : #GLConstantsPoolGenerator,
	#superclass : #GLRegistryGenerator,
	#instVars : [
		'targetClass'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #'constants pool',
	#'squeak_changestamp' : 'stlu 7/22/2021 15:28'
}
GLConstantsPoolGenerator >> generate: aRegistry [

	self targetClass ifNil: [^ self error: 'Please specify a target class'].
	self generate: aRegistry into: self targetClass
]

{
	#category : #'constants pool',
	#'squeak_changestamp' : 'stlu 4/12/2021 18:09'
}
GLConstantsPoolGenerator >> generate: aRegistry into: aClass [

	self generateVariables: aRegistry into: aClass.
	self generateInitializers: aRegistry into: aClass theMetaClass.
	self removeNonGeneratedMethodsIn: aClass theMetaClass.
	aClass initialize
]

{
	#category : #'constants pool',
	#'squeak_changestamp' : 'stlu 9/20/2021 14:05'
}
GLConstantsPoolGenerator >> generateInitializers: aRegistry into: aClass [

	| enums mainSource padding groupSize groupIndex numInitializers |
	enums := aRegistry enums values.
	groupIndex := 0.
	groupSize := 100.
	numInitializers := (enums size / groupSize) ceiling.
	padding := numInitializers numberOfDigitsInBase: 10.
	'Compiling initializers for ' , aClass name
		displayProgressFrom: 0 to: numInitializers
		during: [:bar |
			mainSource := String streamContents: [:mainStream |
				mainStream nextPutAll: 'initialize'; cr.
				1 to: enums size by: groupSize do: [:groupStart |
					| source index groupEnd |
					groupEnd := (groupStart + groupSize - 1) min: enums size.
					groupIndex := groupIndex + 1.
					bar value: groupIndex.
					index := groupIndex asString padded: #left to: padding with: $0.
					mainStream
						cr; tab;
						nextPutAll: 'self initialize';
						nextPutAll: index;
						nextPut: $..
					source := String streamContents: [:stream |
						stream
							nextPutAll: 'initialize';
							nextPutAll: index; cr.
						enums from: groupStart to: groupEnd do: [:enum |
							stream
								cr; tab;
								nextPutAll: enum name;
								nextPutAll: ' := GLConstant value: ';
								nextPutAll: enum valueString;
								nextPutAll: ' name: ';
								nextPutAll: enum name storeString;
								nextPut: $.]].
					self compile: source classified: #'class initialization' into: aClass]].
			self compile: mainSource classified: #'class initialization' into: aClass]
]

{
	#category : #'constants pool',
	#'squeak_changestamp' : 'stlu 4/12/2021 18:04'
}
GLConstantsPoolGenerator >> generateVariables: aRegistry into: aClass [

	| haves shoulds toAdd toRemove |
	haves := aClass classVarNames asSet.
	shoulds := aRegistry enums collect: [:enum | enum name] as: Set.
	toAdd := haves copyWithoutAll: shoulds.
	toRemove := shoulds copyWithoutAll: haves.
	
	'Adding variables to ' , aClass name
		displayProgressFrom: 0 to: toAdd size
		during: [:bar |
			toAdd withIndexDo: [:each :index |
				bar value: index.
				aClass removeClassVarName: each]].
	
	'Removing variables from ' , aClass name
		displayProgressFrom: 0 to: toRemove size
		during: [:bar |
			toRemove doWithIndex: [:each :index |
				bar value: index.
				aClass addClassVarName: each]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:06'
}
GLConstantsPoolGenerator >> initialize [

	super initialize.
	targetClass := self environment at: #GLConstants ifAbsent: []
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:05'
}
GLConstantsPoolGenerator >> targetClass [

	^ targetClass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 18:05'
}
GLConstantsPoolGenerator >> targetClass: anObject [

	targetClass := anObject
]
