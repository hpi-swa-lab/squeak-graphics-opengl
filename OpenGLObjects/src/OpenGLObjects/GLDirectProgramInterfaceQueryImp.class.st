Class {
	#name : #GLDirectProgramInterfaceQueryImp,
	#superclass : #GLProgramInterfaceQueryImp,
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #inputs,
	#timestamp : 'stlu 12/13/2020 15:52'
}
GLDirectProgramInterfaceQueryImp >> getInputs: aProgram [

	^ self getResources: GLProgramInput program: aProgram
]

{
	#category : #'resource querying',
	#timestamp : 'stlu 12/16/2020 18:54'
}
GLDirectProgramInterfaceQueryImp >> getResource: aResourceClass program: aProgram at: index [

	| properties name |
	properties := self
					queryResourceProperties: aResourceClass propertiesToQuery
					program: aProgram
					interface: aResourceClass interfaceEnum
					at: index.
	name := self
				queryResourceName: properties first
				program: aProgram
				interface:aResourceClass interfaceEnum
				at: index.
	^ aResourceClass
		program: aProgram
		name: name
		properties: properties
]

{
	#category : #'resource querying',
	#timestamp : 'stlu 12/16/2020 18:54'
}
GLDirectProgramInterfaceQueryImp >> getResources: aResourceClass program: aProgram [

	| numResources resources |
	numResources := self
						queryInterface: aResourceClass interfaceEnum
						program: aProgram
						property: GL_ACTIVE_RESOURCES.
	resources := Array new: numResources.
	1 to: numResources do: [:i |
		| resource |
		resource := self getResource: aResourceClass program: aProgram at: i - 1.
		resources at: i put: resource].
	^ resources
]

{
	#category : #uniforms,
	#timestamp : 'stlu 12/13/2020 14:55'
}
GLDirectProgramInterfaceQueryImp >> getUniforms: aProgram [

	^ self getResources: GLUniform program: aProgram
]

{
	#category : #'resource querying',
	#timestamp : 'stlu 12/13/2020 14:47'
}
GLDirectProgramInterfaceQueryImp >> queryInterface: interfaceEnum program: aProgram property: propertyEnum [

	| result |
	result := WordArray new: 1.
	GL
		getProgramInterfaceiv: aProgram id
		with: interfaceEnum
		with: propertyEnum
		with: result.
	^ result first
]

{
	#category : #'resource querying',
	#timestamp : 'stlu 12/13/2020 14:42'
}
GLDirectProgramInterfaceQueryImp >> queryResourceName: nameLength program: aProgram interface: interfaceEnum at: index [

	| result |
	result := ByteArray new: nameLength "includes null-terminator".
	GL
		getProgramResourceName: aProgram id
		with: interfaceEnum
		with: index
		with: result size
		with: nil
		with: result.
	^ result allButLast utf8Decoded
]

{
	#category : #'resource querying',
	#timestamp : 'stlu 12/13/2020 14:42'
}
GLDirectProgramInterfaceQueryImp >> queryResourceProperties: aWordArray program: aProgram interface: interfaceEnum at: index [

	| result |
	result := WordArray new: aWordArray size.
	GL
		getProgramResourceiv: aProgram id
		with: interfaceEnum
		with: index
		with: aWordArray size
		with: aWordArray
		with: result size
		with: nil
		with: result.
	^ result
]
