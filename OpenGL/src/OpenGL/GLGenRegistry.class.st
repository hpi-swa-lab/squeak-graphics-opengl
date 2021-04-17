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
	#name : #GLGenRegistry,
	#superclass : #Object,
	#instVars : [
		'commands',
		'enums',
		'types',
		'extensions'
	],
	#category : #'OpenGL-Generation',
	#commentStamp : 'stlu 11/6/2020 17:57'
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 10/31/2020 23:18'
}
GLGenRegistry class >> fromFile: filePath [

	^ self fromXML: (XMLDOMParser parseDocumentFrom: filePath asURI contentStream)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/6/2020 17:49'
}
GLGenRegistry class >> fromUrl: urlString [

	| response |
	response := WebClient httpGet: urlString.
	response isSuccess ifFalse: [^ self error: 'Failed to fetch XML'].
	^ self fromXML: (XMLDOMParser parseDocumentFrom: response content readStream)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/6/2020 17:52'
}
GLGenRegistry class >> fromWeb [

	^ self fromUrl: 'https://raw.githubusercontent.com/KhronosGroup/OpenGL-Registry/master/xml/gl.xml'
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/11/2021 13:32'
}
GLGenRegistry class >> fromXML: xml [

	^ self fromXMLTag: (xml firstTagNamed: #registry)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/11/2021 13:32'
}
GLGenRegistry class >> fromXMLTag: tag [

	^ self new
		initializeWithXMLTag: tag;
		yourself
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/2/2020 13:20'
}
GLGenRegistry >> addCommand: command [

	^ commands
		at: command name
		ifPresent: [:x | x]
		ifAbsentPut: [command]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/2/2020 13:20'
}
GLGenRegistry >> addEnum: enum [

	^ enums
		at: enum name
		ifPresent: [:x | x "there's exactly 1 Enum that's api-specific (GL_ACTIVE_PROGRAM_EXT)"]
		ifAbsentPut: [enum]
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/17/2021 17:45'
}
GLGenRegistry >> addExtension: extension [

	^ extensions
		at: extension name
		ifAbsentPut: [extension]
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/11/2021 13:36'
}
GLGenRegistry >> addType: aType [

	^ types
		at: aType name
		ifAbsentPut: [aType]
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 19:41'
}
GLGenRegistry >> commandNamed: aString [

	^ commands at: aString
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenRegistry >> commands [

	^ commands
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 19:41'
}
GLGenRegistry >> enumNamed: aString [

	^ enums at: aString
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/31/2020 22:19'
}
GLGenRegistry >> enums [

	^ enums
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/12/2021 19:51'
}
GLGenRegistry >> gatherCommands: registryTag [

	registryTag tagsNamed: #commands do: [:commandsTag |
		commandsTag tagsNamed: #command do: [:commandTag |
			| command |
			command := GLGenCommand fromXMLTag: commandTag.
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
	#timestamp : 'stlu 4/12/2021 19:42'
}
GLGenRegistry >> gatherEnums: registryTag [

	registryTag tagsNamed: #enums do: [:enumsTag |
		| vendor type namespace group |
		vendor := enumsTag attributes at: #vendor ifAbsent: [].
		type := enumsTag attributes at: #type ifAbsent: [].
		namespace := enumsTag attributes at: #namespace ifAbsent: [].
		group := enumsTag attributes at: #group ifAbsent: [].
		enumsTag tagsNamed: #enum do: [:enumTag |
			| enum |
			enum := GLGenEnum fromXMLTag: enumTag.
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
	#timestamp : 'stlu 4/12/2021 13:18'
}
GLGenRegistry >> gatherExtensions: registryTag [

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
	#timestamp : 'stlu 4/12/2021 19:42'
}
GLGenRegistry >> gatherFeatures: registryTag [

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
	#timestamp : 'stlu 4/12/2021 16:59'
}
GLGenRegistry >> gatherTypes: registryTag [

	registryTag tagsNamed: #types do: [:typesTag |
		typesTag elementsDo: [:typeTag |
			self addType: (GLGenType fromXMLTag: typeTag)]].
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/11/2021 13:35'
}
GLGenRegistry >> initialize [

	super initialize.
	enums := Dictionary new: 7000.
	commands := Dictionary new: 4000.
	extensions := Dictionary new: 500.
	types := Dictionary new: 50
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/11/2021 13:59'
}
GLGenRegistry >> initializeWithXMLTag: registryTag [

	name := 'gl.xml'.
	
	self gatherTypes: registryTag.
	self gatherEnums: registryTag.
	self gatherCommands: registryTag.
	self gatherFeatures: registryTag.
	self gatherExtensions: registryTag.
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/12/2021 19:41'
}
GLGenRegistry >> typeNamed: aString [

	^ types at: aString
]

{
	#category : #accessing,
	#timestamp : 'stlu 4/11/2021 13:41'
}
GLGenRegistry >> types [

	^ types
]
