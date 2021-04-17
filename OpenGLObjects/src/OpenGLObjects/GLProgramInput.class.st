Class {
	#name : #GLProgramInput,
	#superclass : #GLProgramResource,
	#instVars : [
		'location',
		'type'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/16/2020 20:45'
}
GLProgramInput class >> allInProgram: aProgram [

	^ self queryImp getInputs: aProgram
]

{
	#category : #querying,
	#timestamp : 'stlu 12/13/2020 16:08'
}
GLProgramInput class >> getPropertiesToQuery [

	^ {
		GL_NAME_LENGTH .
		GL_LOCATION .
		GL_TYPE .
		GL_ARRAY_SIZE .
	}
]

{
	#category : #querying,
	#timestamp : 'stlu 12/16/2020 18:57'
}
GLProgramInput class >> interfaceEnum [

	^ GL_PROGRAM_INPUT
]

{
	#category : #configuration,
	#timestamp : 'stlu 12/27/2020 15:54'
}
GLProgramInput >> buffer: aBuffer offset: byteOffset stride: byteStride components: numComponents [

	GLVertexArray bound
		bind: self
		to: aBuffer
		offset: byteOffset
		stride: byteStride
		components: numComponents
]

{
	#category : #configuration,
	#timestamp : 'stlu 12/22/2020 14:42'
}
GLProgramInput >> components: numComponents stride: byteStride offset: byteOffset [

	self flag: #todo. "Not the interface of choice. Should receiver buffer object."
	self flag: #todo. "Move actual implementation to VertexArray."
	GL enableVertexAttribArray: location.
	GL vertexAttribPointer: location
		with: numComponents
		with: type componentType enum
		with: false "normalized? -> how to make this configurable?"
		with: byteStride
		with: (ExternalAddress new fromInteger: byteOffset)
]

{
	#category : #initialization,
	#timestamp : 'stlu 12/14/2020 16:17'
}
GLProgramInput >> initializeProperties: aWordArray [

	location := aWordArray second.
	type := GLSLType numElements: aWordArray fourth enum: aWordArray third
]

{
	#category : #testing,
	#timestamp : 'stlu 12/16/2020 18:46'
}
GLProgramInput >> isInput [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/16/2020 18:46'
}
GLProgramInput >> location [

	^ location
]

{
	#category : #printing,
	#timestamp : 'stlu 1/10/2021 12:44'
}
GLProgramInput >> printOn: aStream [

	aStream
		print: location;
		nextPutAll: ': in '.
	type printDeclarationNamed: name on: aStream
]

{
	#category : #configuration,
	#timestamp : 'stlu 3/17/2021 23:29'
}
GLProgramInput >> stride: byteStride offset: byteOffset [

	self flag: #todo. "adjust to new vertex array implementation"
	self components: type numComponents stride: byteStride offset: byteOffset
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/16/2020 18:46'
}
GLProgramInput >> type [

	^ type
]
