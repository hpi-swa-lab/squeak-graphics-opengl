"
I decorate a GLLibrary to automatically check API calls against a specified version.
If the API call is not available in the given version, an error is raised.
"
Class {
	#name : #GLVersionCheckingLibrary,
	#superclass : #GLLibrary,
	#instVars : [
		'library',
		'targetVersion',
		'targetExtensions'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 4/14/2021 15:19'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/16/2021 17:56'
}
GLVersionCheckingLibrary class >> around: aLibrary [

	^ self
		around: aLibrary
		targetVersion: aLibrary context version
		targetExtensions: aLibrary context extensions
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:27'
}
GLVersionCheckingLibrary class >> around: aLibrary targetExtensions: collectionOfSymbols [

	^ self
		around: aLibrary
		targetVersion: nil "allow all versions by default"
		targetExtensions: collectionOfSymbols
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:26'
}
GLVersionCheckingLibrary class >> around: aLibrary targetVersion: aVersion [

	^ self
		around: aLibrary
		targetVersion: aVersion
		targetExtensions: nil "allow all extensions by default"
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:20'
}
GLVersionCheckingLibrary class >> around: aLibrary targetVersion: aVersionOrNil targetExtensions: collectionOfSymbolsOrNil [

	^ self new
		library: aLibrary;
		context: aLibrary context;
		targetVersion: aVersionOrNil;
		targetExtensions: collectionOfSymbolsOrNil;
		yourself
]

{
	#category : #examples,
	#'squeak_changestamp' : 'stlu 4/19/2021 19:12'
}
GLVersionCheckingLibrary class >> example1 [ "self example1"
	"An OpenGL example which uses deprecated fixed-function pipeline api calls.
	Uses the automatic version checking to define OpenGL 3.3 Core Profile as the target version.
	Throws an error when it reaches the deprecated api calls."
	| window context library |
	window := GLFWWindow
					extent: 400 @ 400
					title: self name , ' example1'.
	window ifNil: [^ self error: 'GLFW Error'].
	context := window context.
	
	library := context library withVersionChecking: (GL33 profile: #core). "wraps version checking library around default library"
	[library makeCurrentDuring: [
		GL disable: GL_DEPTH_TEST.
		GL clearColor: 1.0 with: 1.0 with: 1.0 with: 1.0.
		[window shouldClose] whileFalse: [
			GL clear: GL_COLOR_BUFFER_BIT.
			
			GL rotatef: 5.0 with: 0.0 with: 0.0 with: 1.0. "removed in OpenGL 3.2 Core Profile"
			GL color3f: 1.0 with: 0.0 with: 0.0. "removed in OpenGL 3.2 Core Profile"
			
			GL begin: GL_POLYGON. "removed in OpenGL 3.2 Core Profile"
				GL vertex2f: -0.7 with: -0.7. "removed in OpenGL 3.2 Core Profile"
				GL vertex2f:  0.7 with: -0.7.
				GL vertex2f:  0.7 with:  0.7.
				GL vertex2f: -0.7 with:  0.7.
			GL end. "removed in OpenGL 3.2 Core Profile"
			
			context swapBuffers.
			GLFW pollEvents]]
	] ensure: [context destroy]
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/16/2021 17:29'
}
GLVersionCheckingLibrary class >> new [

	^ self newSubclass basicNew initialize; yourself
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 17:32'
}
GLVersionCheckingLibrary >> doesNotUnderstand: aMessage [

	(self install: aMessage selector) ifNotNil: [
		^ aMessage sendTo: self].
	
	^ super doesNotUnderstand: aMessage
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:27'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol extension: extensionSymbol [

	^ self glAPI: apiSymbol profile: nil extension: extensionSymbol
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:22'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol profile: profileSymbol extension: extensionSymbol [

	self targetExtensions ifNil: [^ true].
	(self targetVersion isAPI: apiSymbol) ifFalse: [^ nil].
	(self targetVersion matchesProfile: profileSymbol) ifFalse: [^ nil].
	(self targetExtensions includes: extensionSymbol) ifFalse: [^ nil].
	^ true
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:24'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol profile: profileSymbol since: versionString [

	self targetVersion ifNil: [^ true].
	(self targetVersion isAPI: apiSymbol) ifFalse: [^ nil].
	(self targetVersion matchesProfile: profileSymbol) ifFalse: [^ nil].
	(self targetVersion isBelowVersionString: versionString) ifTrue: [^ nil].
	^ true
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/22/2021 14:22'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol profile: profileSymbol until: versionString [

	self targetVersion ifNil: [^ nil].
	(self targetVersion isAPI: apiSymbol) ifFalse: [^ nil].
	(self targetVersion matchesProfile: profileSymbol) ifFalse: [^ nil].
	(self targetVersion isBelowVersionString: versionString) ifTrue: [^ nil].
	^ false
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:25'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol since: versionString [

	^ self glAPI: apiSymbol profile: nil since: versionString
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:25'
}
GLVersionCheckingLibrary >> glAPI: apiSymbol until: versionString [

	^ self glAPI: apiSymbol profile: nil until: versionString
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:49'
}
GLVersionCheckingLibrary >> install: aSelector [

	| registryMethod signature template source |
	registryMethod := GLRegistry compiledMethodAt: aSelector ifAbsent: [^ nil].
	"assumption: method signature is on a single line ended by a carriage return."
	signature := registryMethod getSource asString copyUpTo: Character cr.
	template := (self isAvailableMethod: registryMethod)
					ifTrue: [self passthroughTemplate]
					ifFalse: [self versionErrorTemplate].
	source := template format: { signature }.
	^ self class compile: source classified: #'*autogenerated'
]

{
	#category : #'version testing',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:26'
}
GLVersionCheckingLibrary >> isAvailableMethod: aRegistryMethod [

	| result |
	result := false.
	aRegistryMethod pragmas do: [:pragma |
		(pragma keyword beginsWith: 'glAPI') ifTrue: [
			(pragma message sendTo: self) ifNotNil: [:newResult |
				result := newResult]]].
	^ result
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/16/2021 17:29'
}
GLVersionCheckingLibrary >> library [

	^ library
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/16/2021 17:29'
}
GLVersionCheckingLibrary >> library: anObject [

	library := anObject
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:50'
}
GLVersionCheckingLibrary >> passthroughTemplate [

	^ '{1}

	^ library {1}'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/16/2021 17:54'
}
GLVersionCheckingLibrary >> targetExtensions [

	^ targetExtensions
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/22/2021 14:21'
}
GLVersionCheckingLibrary >> targetExtensions: collectionOfSymbolsOrNil [

	targetExtensions := collectionOfSymbolsOrNil ifNotNil: [:c | c asSet]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/16/2021 17:30'
}
GLVersionCheckingLibrary >> targetVersion [

	^ targetVersion
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/16/2021 17:30'
}
GLVersionCheckingLibrary >> targetVersion: anObject [

	targetVersion := anObject
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:52'
}
GLVersionCheckingLibrary >> versionError [

	^ self error: 'Not available in the targeted version ' , self targetVersion asString
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:51'
}
GLVersionCheckingLibrary >> versionErrorTemplate [

	^ '{1}

	^ self versionError'
]
