Class {
	#name : #GLSLSampler,
	#superclass : #GLSLType,
	#category : #'OpenGLObjects-Types',
	#commentStamp : ''
}

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 12/15/2020 13:04'
}
GLSLSampler class >> generateClasses [

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
			squeakName := pixelType squeakName , type join , 'Sampler'.
			cls := self subclass: 'GLSL' , squeakName.
			cls compileAccessor: 'squeakName' value: squeakName storeString.
			glslType := type asOrderedCollection
							replaceAll: 'Multisample' with: 'MS';
							remove: 'Map' ifAbsent: [];
							yourself.
			declarator := pixelType glslInitials , 'sampler' , glslType join.
			cls compileAccessor: 'declarators' value: { declarator } storeString.
			enumName := (pixelType = GLSLFloat ifTrue: [''] ifFalse: [pixelType enumName , '_'])
							, 'SAMPLER_'
							, (type joinSeparatedBy: '_') asUppercase.
			cls compileAccessor: 'enumName' value: enumName storeString.
			cls compileAccessor: 'enum' value: 'GL_' , enumName.
			cls compileAccessor: 'pixelType' value: pixelType name , ' instance']]
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:02'
}
GLSLSampler class >> pixelType [

	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 18:23'
}
GLSLSampler >> isSampler [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/15/2020 13:01'
}
GLSLSampler >> pixelType [

	^ self class pixelType
]

{
	#category : #'program resources',
	#timestamp : 'stlu 11/23/2020 17:05'
}
GLSLSampler >> setUniform: aUniform toArray: aRawBitsArray count: numElements [

	aUniform setTo1ComponentIntegerArray: aRawBitsArray count: numElements
]

{
	#category : #'program resources',
	#timestamp : 'stlu 1/6/2021 14:15'
}
GLSLSampler >> setUniform: aUniform toObject: anObject [

	aUniform setToInteger: anObject
]
