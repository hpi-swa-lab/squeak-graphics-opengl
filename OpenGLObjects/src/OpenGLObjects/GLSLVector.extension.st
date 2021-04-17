Extension { #name : #GLSLVector }

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
