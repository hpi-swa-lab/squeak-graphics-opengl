Class {
	#name : #GLSLImage,
	#superclass : #GLSLType,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #'*OpenGLObjects-Generation',
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLImage class >> generateClasses [

	{ GLSLFloat . GLSLInteger . GLSLUnsignedInteger } do: [:pixelType |
		#(
			('1D')
			('1D' 'Array')
			('2D')
			('2D' 'Array')
			('2D' 'Multisample')
			('2D' 'Multisample' 'Array')
			('2D' 'Rect')
			('3D')
			('Buffer')
			('Cube')
			('Cube' 'Map' 'Array')
		) do: [:type |
			| cls squeakName enumName declarator glslType |
			squeakName := pixelType squeakName , type join , 'Image'.
			cls := self subclass: 'GLSL' , squeakName.
			cls compileAccessor: 'squeakName' value: squeakName storeString.
			glslType := type asOrderedCollection
							replaceAll: 'Multisample' with: 'MS';
							remove: 'Map' ifAbsent: [];
							yourself.
			declarator := pixelType glslInitials , 'image' , glslType join.
			cls compileAccessor: 'declarators' value: { declarator } storeString.
			enumName := (pixelType = GLSLFloat ifTrue: [''] ifFalse: [pixelType enumName , '_'])
							, 'IMAGE_'
							, (type joinSeparatedBy: '_') asUppercase.
			cls compileAccessor: 'enumName' value: enumName storeString.
			cls compileAccessor: 'enum' value: 'GL_' , enumName.
			cls compileAccessor: 'pixelType' value: pixelType name , ' instance']]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:02'
}
GLSLImage class >> pixelType [

	self subclassResponsibility
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 12/14/2020 18:21'
}
GLSLImage >> isImage [

	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:02'
}
GLSLImage >> pixelType [

	^ self class pixelType
]

{
	#category : #'program resources',
	#'squeak_changestamp' : 'stlu 11/23/2020 16:47'
}
GLSLImage >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentIntegerArray: aRawBitsArray count: numElements
]
