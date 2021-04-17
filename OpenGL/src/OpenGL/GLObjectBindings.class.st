Class {
	#name : #GLObjectBindings,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'vertexArray',
		'program',
		'arrayBuffer',
		'readFrameBuffer',
		'drawFrameBuffer',
		'renderBuffer',
		'arrayTexture1D',
		'texture1D',
		'arrayTexture2D',
		'multisampleArrayTexture2D',
		'multisampleTexture2D',
		'texture2D',
		'texture3D',
		'bufferTexture',
		'cubeMapArrayTexture',
		'cubeMapTexture',
		'rectangleTexture'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGL-Core',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 3/15/2021 13:08'
}
GLObjectBindings class >> current [

	^ GL context objectBindings
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> arrayBuffer [

	^ arrayBuffer
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> arrayBuffer: anObject [

	arrayBuffer := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> arrayTexture1D [

	^ arrayTexture1D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> arrayTexture1D: anObject [

	arrayTexture1D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> arrayTexture2D [

	^ arrayTexture2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> arrayTexture2D: anObject [

	arrayTexture2D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> bufferTexture [

	^ bufferTexture
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> bufferTexture: anObject [

	bufferTexture := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> cubeMapArrayTexture [

	^ cubeMapArrayTexture
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> cubeMapArrayTexture: anObject [

	cubeMapArrayTexture := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> cubeMapTexture [

	^ cubeMapTexture
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> cubeMapTexture: anObject [

	cubeMapTexture := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> dictionary [

	^ dictionary
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> dictionary: anObject [

	dictionary := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:28'
}
GLObjectBindings >> drawFrameBuffer [

	^ drawFrameBuffer
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:28'
}
GLObjectBindings >> drawFrameBuffer: anObject [

	drawFrameBuffer := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 3/14/2021 18:13'
}
GLObjectBindings >> initialize [

	dictionary := Dictionary new
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> multisampleArrayTexture2D [

	^ multisampleArrayTexture2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> multisampleArrayTexture2D: anObject [

	multisampleArrayTexture2D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> multisampleTexture2D [

	^ multisampleTexture2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> multisampleTexture2D: anObject [

	multisampleTexture2D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> program [

	^ program
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:28'
}
GLObjectBindings >> readFrameBuffer [

	^ readFrameBuffer
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:28'
}
GLObjectBindings >> readFrameBuffer: anObject [

	readFrameBuffer := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> rectangleTexture [

	^ rectangleTexture
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> rectangleTexture: anObject [

	rectangleTexture := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:21'
}
GLObjectBindings >> renderBuffer [

	^ renderBuffer
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:21'
}
GLObjectBindings >> renderBuffer: anObject [

	renderBuffer := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture1D [

	^ texture1D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture1D: anObject [

	texture1D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture2D [

	^ texture2D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture2D: anObject [

	texture2D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture3D [

	^ texture3D
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 22:29'
}
GLObjectBindings >> texture3D: anObject [

	texture3D := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> vertexArray [

	^ vertexArray
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/14/2021 18:18'
}
GLObjectBindings >> vertexArray: anObject [

	vertexArray := anObject
]
