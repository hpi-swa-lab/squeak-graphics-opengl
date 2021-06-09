"
I hold context-specific state required by OpenGLObjects
"
Class {
	#name : #GLObjectState,
	#superclass : #Object,
	#instVars : [
		'textureManager',
		'bufferManager',
		'shaderManager',
		'programManager',
		'vertexArrayManager',
		'frameBufferManager',
		'renderBufferManager',
		'queryManager'
	],
	#category : #'OpenGLObjects-Core',
	#'squeak_changestamp' : 'stlu 4/25/2021 14:07'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/11/2021 12:07'
}
GLObjectState class >> context: aContext [

	^ self basicNew
		initializeForContext: aContext;
		yourself
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> bufferManager [

	^ bufferManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> frameBufferManager [

	^ frameBufferManager
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/24/2021 15:33'
}
GLObjectState >> initializeForContext: aContext [

	bufferManager := GLBufferManager context: aContext.
	frameBufferManager := GLFrameBufferManager context: aContext.
	programManager := GLProgramManager context: aContext.
	renderBufferManager := GLRenderBufferManager context: aContext.
	shaderManager := GLShaderManager context: aContext.
	textureManager := GLTextureManager context: aContext.
	vertexArrayManager := GLVertexArrayManager context: aContext.
	queryManager := GLQueryManager context: aContext.
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> programManager [

	^ programManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 5/24/2021 15:33'
}
GLObjectState >> queryManager [

	^ queryManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> renderBufferManager [

	^ renderBufferManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 14:07'
}
GLObjectState >> shaderManager [

	^ shaderManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> textureManager [

	^ textureManager
]

{
	#category : #managers,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:54'
}
GLObjectState >> vertexArrayManager [

	^ vertexArrayManager
]
