"
I generate the FFI language bindings for OpenGL.
To do so, I require the API sepecification in the Khronos XML API Registry schema.
It can be found [here](https://github.com/KhronosGroup/OpenGL-Registry/blob/master/xml/gl.xml).

To (re-)generate the interface, do the following:
```smalltalk
GLRegistry fromWeb generate.
```

The registry object is not modified to generate code and can hence be used multiple times to do so.
"
Class {
	#name : #GLRegistry,
	#superclass : #Object,
	#instVars : [
		'commands',
		'enums',
		'types',
		'extensions'
	],
	#classVars : [
		'ClearCurrentOnSave',
		'Current',
		'DefaultUrlToRetrieveXML'
	],
	#category : #'OpenGL-Generation'
}

{
	#category : #cache,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:37'
}
GLRegistry class >> clearCurrent [

	Current := nil.
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:36'
}
GLRegistry class >> clearCurrentOnSave [

	<preference: 'Clear cached OpenGL registry when saving'
		category: 'OpenGL' 
		description: 'Clear the currently cached OpenGL registry whenever Squeak is saved. Doing so reduces the saved .image file size by ~5MB. The registry will have to be retrieved again when loading new registry elements.' 
		type: #Boolean>
	^ ClearCurrentOnSave ifNil: [true]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:36'
}
GLRegistry class >> clearCurrentOnSave: aBoolean [

	ClearCurrentOnSave := aBoolean.
]

{
	#category : #cache,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:18'
}
GLRegistry class >> current [

	^ Current ifNil: [
		Current := self fromUrl: self defaultUrlToRetrieveXML]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:18'
}
GLRegistry class >> defaultUrlToRetrieveXML [

	<preference: 'Default url to retrieve registry XML'
		category: 'OpenGL' 
		description: 'When the current OpenGL registry is needed, the given url will be used to retrieve the XML specification of the OpenGL registry. Also allows local file paths (file://).'
		type: #String>
	^ DefaultUrlToRetrieveXML ifNil: [self urlOfCanonicalXML]
]

{
	#category : #preferences,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:32'
}
GLRegistry class >> defaultUrlToRetrieveXML: aString [

	^ DefaultUrlToRetrieveXML := aString
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 10/31/2020 23:18'
}
GLRegistry class >> fromFile: filePath [

	^ self fromXML: (XMLDOMParser parseDocumentFrom: filePath asURI contentStream)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 9/22/2021 14:09'
}
GLRegistry class >> fromUrl: aString [

	UIManager default
		informUser: 'Retrieving OpenGL registry XML'
		during: [
			aString asUrl retrieveContents ifNotNil: [:mimeDoc |
				[
					| xml |
					xml := XMLDOMParser parseDocumentFrom: mimeDoc contentStream.
					^ self fromXML: xml
				] on: SAXException do: [
					self error: 'Failed to parse registry xml']]].
	self error: 'Could not retreive registry xml from given Url'.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/11/2021 13:32'
}
GLRegistry class >> fromXML: xml [

	^ self fromXMLTag: (xml firstTagNamed: #registry)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/11/2021 13:32'
}
GLRegistry class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 9/21/2021 16:24'
}
GLRegistry class >> initialize [

	Smalltalk addToShutDownList: self.
]

{
	#category : #cache,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:41'
}
GLRegistry class >> setupLocalXML [

	self notYetImplemented.
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 9/21/2021 16:37'
}
GLRegistry class >> shutDown: quitting [

	self clearCurrent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/21/2021 16:09'
}
GLRegistry class >> urlOfCanonicalXML [

	^ 'https://raw.githubusercontent.com/KhronosGroup/OpenGL-Registry/main/xml/gl.xml'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/2/2020 13:20'
}
GLRegistry >> addCommand: command [

	^ commands
		at: command name
		ifPresent: [:x | x]
		ifAbsentPut: [command]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/2/2020 13:20'
}
GLRegistry >> addEnum: enum [

	^ enums
		at: enum name
		ifPresent: [:x | x "there's exactly 1 Enum that's api-specific (GL_ACTIVE_PROGRAM_EXT)"]
		ifAbsentPut: [enum]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/17/2021 17:45'
}
GLRegistry >> addExtension: extension [

	^ extensions
		at: extension name
		ifAbsentPut: [extension]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:36'
}
GLRegistry >> addType: aType [

	^ types
		at: aType name
		ifAbsentPut: [aType]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:41'
}
GLRegistry >> commandNamed: aString [

	^ commands at: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLRegistry >> commands [

	^ commands
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:41'
}
GLRegistry >> enumNamed: aString [

	^ enums at: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/31/2020 22:19'
}
GLRegistry >> enums [

	^ enums
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:25'
}
GLRegistry >> gatherCommands: registryTag [

	registryTag tagsNamed: #commands do: [:commandsTag |
		commandsTag tagsNamed: #command do: [:commandTag |
			| command |
			command := GLCommand fromXMLTag: commandTag.
			self addCommand: command]].
	
	self commands values do: [:command |
		command aliases copy do: [:alias |
			(self commandNamed: alias) aliases do: [:transitiveAlias |
				command addAlias: transitiveAlias]].
		command aliases do: [:alias |
			(self commandNamed: alias) addAlias: command name]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:25'
}
GLRegistry >> gatherEnums: registryTag [

	registryTag tagsNamed: #enums do: [:enumsTag |
		| vendor type namespace group |
		vendor := enumsTag attributes at: #vendor ifAbsent: [].
		type := enumsTag attributes at: #type ifAbsent: [].
		namespace := enumsTag attributes at: #namespace ifAbsent: [].
		group := enumsTag attributes at: #group ifAbsent: [].
		enumsTag tagsNamed: #enum do: [:enumTag |
			| enum |
			enum := GLEnum fromXMLTag: enumTag.
			enum vendor: vendor.
			enum type: type.
			enum namespace: namespace.
			group ifNotNil: [enum addGroup: group].
			self addEnum: enum]].
	
	self enums values do: [:enum |
		enum aliases copy do: [:alias |
			(self enumNamed: alias) aliases do: [:transitiveAlias |
				enum addAlias: transitiveAlias]].
		enum aliases do: [:alias |
			(self enumNamed: alias) addAlias: enum name]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/12/2021 13:18'
}
GLRegistry >> gatherExtensions: registryTag [

	registryTag tagsNamed: #extensions do: [:extensionsTag |
		extensionsTag tagsNamed: #extension do: [:extensionTag |
			| extensionName supported |
			extensionName := extensionTag attributes at: #name.
			supported := (extensionTag attributes at: #supported) findTokens: '|'.
			supported do: [:token |
				| api profile |
				api := token caseOf: {
							[#glcore] -> [#gl]
						} otherwise: [token].
				profile := token caseOf: {
							[#glcore] -> [#core].
							[#gl] -> [#compatibility]
						} otherwise: [nil].
				extensionTag elementsDo: [:requireTag |
					| actionAPI actionProfile |
					self assert: requireTag tag = #require. "only require"
					actionAPI := requireTag attributes at: #api ifAbsent: [api].
					actionProfile := requireTag attributes at: #profile ifAbsent: [profile].
					(actionAPI = api and: [actionProfile = profile]) ifTrue: [
						requireTag elementsDo: [:targetTag |
							| targetName target |
							targetName := targetTag attributes at: #name.
							target := targetTag tag caseOf: {
								[#enum] -> [self enums at: targetName].
								[#command] -> [self commands at: targetName].
								[#type] -> [self types at: targetName]}.
							target requireIn: api profile: profile extension: extensionName]]]]]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:42'
}
GLRegistry >> gatherFeatures: registryTag [

	registryTag tagsNamed: #feature do: [:featureTag |
		| api version |
		api := featureTag attributes at: #api.
		version := featureTag attributes at: #number.
		featureTag elementsDo: [:actionTag | "require / remove"
			| action profile |
			action := actionTag tag.
			profile := actionTag attributes at: #profile ifAbsent: [].
			actionTag elementsDo: [:targetTag |
				| name type target |
				name := targetTag attributes at: #name.
				type := targetTag tag.
				target := type caseOf: {
					[#enum] -> [self enumNamed: name].
					[#command] -> [self commandNamed: name].
					[#type] -> [self typeNamed: name]}.
				action caseOf: {
					[#require] -> [target requireIn: api profile: profile version: version].
					[#remove] -> [target removeIn: api profile: profile version: version]}]]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 14:26'
}
GLRegistry >> gatherTypes: registryTag [

	registryTag tagsNamed: #types do: [:typesTag |
		typesTag elementsDo: [:typeTag |
			self addType: (GLType fromXMLTag: typeTag)]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:35'
}
GLRegistry >> initialize [

	super initialize.
	enums := Dictionary new: 7000.
	commands := Dictionary new: 4000.
	extensions := Dictionary new: 500.
	types := Dictionary new: 50
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 9/20/2021 15:00'
}
GLRegistry >> initializeWithXMLTag: registryTag [

	self gatherTypes: registryTag.
	self gatherEnums: registryTag.
	self gatherCommands: registryTag.
	self gatherFeatures: registryTag.
	self gatherExtensions: registryTag.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/12/2021 19:41'
}
GLRegistry >> typeNamed: aString [

	^ types at: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/11/2021 13:41'
}
GLRegistry >> types [

	^ types
]
