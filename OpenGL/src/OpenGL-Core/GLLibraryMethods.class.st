"
I am the definitive collection of all commands (functions) and enums (constants) available in `GLLibrary`.
Users are responsible for loading the commands and enums they require (see the class-side `loading` protocol).

---
Note: There is exactly 1 conflicting enum definition which is currently not properly reflected in the generated code: GL_ACTIVE_PROGRAM_EXT
Note: There are 3 commands defined in the registry that can currently not be generated, since they have more than 15 arguments: glLGPUCopyImageSubDataNVX, glMulticastCopyImageSubDataNV, glAsyncCopyImageSubDataNVX
"
Class {
	#name : #GLLibraryMethods,
	#superclass : #ExternalLibrary,
	#classVars : [
		'DefinitionPragmasEnabled',
		'DescriptionPragmasEnabled',
		'Registry',
		'SilentCompilationEnabled'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 9/24/2021 12:36'
}

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 11:59'
}
GLLibraryMethods class >> definitionPragmasEnabled [

	<preference: 'Compile OpenGL FFI methods with definition pragmas'
		category: 'OpenGL' 
		description: 'When loading elements from the OpenGL registry into Squeak, add pragmas to the resulting methods that define which OpenGL API / version / profile / extension the respective element is available in.' 
		type: #Boolean>
	^ DefinitionPragmasEnabled ifNil: [true]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:36'
}
GLLibraryMethods class >> definitionPragmasEnabled: aBoolean [

	DefinitionPragmasEnabled := aBoolean.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:40'
}
GLLibraryMethods class >> descriptionPragmasEnabled [

	<preference: 'Compile OpenGL FFI methods with description pragmas'
		category: 'OpenGL' 
		description: 'When loading elements from the OpenGL registry into Squeak, add pragmas to the resulting methods that more closely describe the respective element.' 
		type: #Boolean>
	^ DescriptionPragmasEnabled ifNil: [true]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:40'
}
GLLibraryMethods class >> descriptionPragmasEnabled: aBoolean [

	DescriptionPragmasEnabled := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:28'
}
GLLibraryMethods class >> getCommandName: aCompiledMethod [

	^ aCompiledMethod externalLibraryFunction ifNotNil: [:func | func name]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:44'
}
GLLibraryMethods class >> getEnumName: aCompiledMethod [

	aCompiledMethod literalsDo: [:literal |
		literal isVariableBinding ifTrue: [
			| value |
			value := literal value.
			value class == GLConstant ifTrue: [
				^ value name]]].
	^ nil
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:05'
}
GLLibraryMethods class >> loadAPI: apiSymbol [

	self loadElementsSatisfying: [:each |
		each isDefinedInAPI: apiSymbol].
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:54'
}
GLLibraryMethods class >> loadAll [
	"
	self loadAll.
	"
	self loadAllCommands.
	self loadAllEnums.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:05'
}
GLLibraryMethods class >> loadAllCommands [

	self newGenerator generateCommands: GLRegistry current commands.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:08'
}
GLLibraryMethods class >> loadAllEnums [

	self newGenerator generateEnums: GLRegistry current enums.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:00'
}
GLLibraryMethods class >> loadCommand: commandName [

	self loadCommands: { commandName }.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:59'
}
GLLibraryMethods class >> loadCommands: collectionOfCommandNames [

	| registry commands |
	registry := GLRegistry current.
	commands := collectionOfCommandNames collect: [:commandName |
		registry commandNamed: commandName].
	self newGenerator generateCommands: commands.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:48'
}
GLLibraryMethods class >> loadElementsSatisfying: aBlock [

	| registry commands enums generator |
	registry := GLRegistry current.
	
	commands := registry commands asArray select: aBlock.
	enums := registry enums asArray select: aBlock.
	
	generator := self newGenerator.
	commands ifNotEmpty: [
		generator generateCommands: commands].
	enums ifNotEmpty: [
		generator generateEnums: enums].
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:01'
}
GLLibraryMethods class >> loadEnum: enumName [

	self loadEnums: { enumName }.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:01'
}
GLLibraryMethods class >> loadEnums: collectionOfEnumNames [

	| registry enums |
	registry := GLRegistry current.
	enums := collectionOfEnumNames collect: [:enumName |
		registry enumNamed: enumName].
	self newGenerator generateEnums: enums.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:56'
}
GLLibraryMethods class >> loadExtension: extensionName [

	self loadExtensions: { extensionName }.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 13:59'
}
GLLibraryMethods class >> loadExtensions: collectionOfExtensionNames [

	| extensions |
	extensions := collectionOfExtensionNames asSet.
	self loadElementsSatisfying: [:each |
		each isDefinedInExtensions: extensions].
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:01'
}
GLLibraryMethods class >> loadVersion: glVersion [

	self loadElementsSatisfying: [:each |
		each isDefinedInVersion: glVersion].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:50'
}
GLLibraryMethods class >> loadedCommands [

	^ Array streamContents: [:stream |
		self methodDict values do: [:method |
			(self getCommandName: method) ifNotNil: [:commandName |
				stream nextPut: commandName]]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:51'
}
GLLibraryMethods class >> loadedEnums [

	^ Array streamContents: [:stream |
		self methodDict values do: [:method |
			(self getEnumName: method) ifNotNil: [:enumName |
				stream nextPut: enumName]]]
]

{
	#category : #'code generation',
	#'squeak_changestamp' : 'stlu 9/21/2021 13:06'
}
GLLibraryMethods class >> newGenerator [

	^ GLLibraryMethodGenerator new
		targetClass: self;
		shouldCompileSilently: self silentCompilationEnabled;
		shouldCompileDefinitionPragmas: self definitionPragmasEnabled;
		shouldCompileDescriptionPragmas: self descriptionPragmasEnabled;
		yourself
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:53'
}
GLLibraryMethods class >> reload [
	"
	self reload.
	"
	self loadCommands: self loadedCommands.
	self loadEnums: self loadedEnums.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:42'
}
GLLibraryMethods class >> silentCompilationEnabled [

	<preference: 'Compile OpenGL FFI methods silently'
		category: 'OpenGL' 
		description: 'When loading elements from the OpenGL registry into Squeak, compile the resulting methods silently.' 
		type: #Boolean>
	^ SilentCompilationEnabled ifNil: [false]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 12:41'
}
GLLibraryMethods class >> silentCompilationEnabled: aBoolean [

	SilentCompilationEnabled := aBoolean.
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 9/21/2021 14:53'
}
GLLibraryMethods class >> unloadAll [
	"
	self unloadAll.
	"
	self selectors do: [:sel |
		self silentCompilationEnabled
			ifTrue: [	self removeSelectorSilently: sel]
			ifFalse: [self removeSelector: sel]].
]
