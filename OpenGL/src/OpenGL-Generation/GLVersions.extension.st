Extension { #name : #GLVersions }

{
	#category : #'*OpenGL-Generation',
	#'squeak_changestamp' : 'stlu 6/20/2022 14:53'
}
GLVersions class >> generateInitialization [
"
self generateInitialization.
"
	| classVars source |
	classVars := self classVarNames asSet.
	source := String streamContents: [:stream |
		stream nextPutAll: 'initialize
"
self initialize.
"'.
		self versionList do: [:tuple || api major minor profiles |
			api := tuple first.
			major := tuple second.
			minor := tuple third.
			profiles := tuple fourth.
			(profiles copyWith: nil) do: [:profile || varName |
					varName := String streamContents: [:s |
						s
							nextPutAll: api versionPrefix;
							store: major;
							store: minor.
						profile ifNotNil: [
							s nextPutAll: profile capitalized]].
					(classVars ifAbsentAdd: varName) ifTrue: [
						self addClassVarName: varName].
					stream
						cr; tab;
						nextPutAll: ('{1} := GLVersion api: {2} major: {3} minor: {4} profile: {5}.'
							format: {varName. api name. major. minor. profile storeString})]]].
	
	self theMetaClass compile: source classified: #'class initialization'.
]

{
	#category : #'*OpenGL-Generation',
	#'squeak_changestamp' : 'stlu 6/20/2022 14:30'
}
GLVersions class >> versionList [

	^ {
		{GLAPI. 1. 0. #()}.
		{GLAPI. 1. 1. #()}.
		{GLAPI. 1. 2. #()}.
		{GLAPI. 1. 3. #()}.
		{GLAPI. 1. 4. #()}.
		{GLAPI. 1. 5. #()}.
		{GLAPI. 2. 0. #()}.
		{GLAPI. 2. 1. #()}.
		{GLAPI. 3. 0. #()}.
		{GLAPI. 3. 1. #()}.
		{GLAPI. 3. 2. #(core compatibility)}.
		{GLAPI. 3. 3. #(core compatibility)}.
		{GLAPI. 4. 0. #(core compatibility)}.
		{GLAPI. 4. 1. #(core compatibility)}.
		{GLAPI. 4. 2. #(core compatibility)}.
		{GLAPI. 4. 3. #(core compatibility)}.
		{GLAPI. 4. 4. #(core compatibility)}.
		{GLAPI. 4. 5. #(core compatibility)}.
		{GLAPI. 4. 6. #(core compatibility)}.

		{GLES1API. 1. 0. #(common)}.
		{GLES1API. 1. 1. #(common)}.
		
		{GLES2API. 2. 0. #()}.
		{GLES2API. 3. 0. #()}.
		{GLES2API. 3. 1. #()}.
		{GLES2API. 3. 2. #()}.
		
		{GLSC2API. 2. 0. #()}.
	}
]
