Class {
	#name : #GLSLVector,
	#superclass : #GLSLType,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:06'
}
GLSLVector class >> componentType [

	self subclassResponsibility
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/15/2020 13:13'
}
GLSLVector class >> componentType: type numComponents: size [
	size = 1 ifTrue: [ ^ type ].
	
	self allSubclassesDo: [ :cls |
		(cls componentType = type and: [ cls numComponents = size ]) ifTrue: [
			^ cls instance]].
	
	self error: 'no such vector type'
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLVector class >> generateClasses [

	{ GLSLBoolean . GLSLFloat . GLSLDouble . GLSLInteger . GLSLUnsignedInteger} do: [:type |
		2 to: 4 do: [:components |
			| cls squeakName enumName declarator |
			squeakName := type squeakName , 'Vector' , components.
			cls := self subclass: 'GLSL' , squeakName.
			cls compileAccessor: 'squeakName' value: squeakName storeString.
			declarator := type glslInitials , 'vec' , components.
			cls compileAccessor: 'declarators' value: { declarator } storeString.
			enumName := type enumName , '_VEC' , components.
			cls compileAccessor: 'enumName' value: enumName storeString.
			cls compileAccessor: 'enum' value: 'GL_' , enumName.
			
			cls compileAccessor: 'numComponents' value: components.
			cls compileAccessor: 'componentType' value: type name , ' instance']]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:21'
}
GLSLVector class >> numComponents [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:15'
}
GLSLVector >> componentType [

	^ self class componentType
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 18:23'
}
GLSLVector >> isVector [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/23/2020 13:23'
}
GLSLVector >> numComponents [

	^ self class numComponents
]
