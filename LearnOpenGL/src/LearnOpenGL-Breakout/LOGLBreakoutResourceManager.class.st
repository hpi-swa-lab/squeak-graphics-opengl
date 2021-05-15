Class {
	#name : #LOGLBreakoutResourceManager,
	#superclass : #Object,
	#instVars : [
		'textures'
	],
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #retrieval,
	#'squeak_changestamp' : 'stlu 1/7/2021 15:37'
}
LOGLBreakoutResourceManager class >> getTexture: name [

	^ self instance getTexture: name
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 1/7/2021 16:00'
}
LOGLBreakoutResourceManager class >> instance [

	^ GL userData at: self ifAbsentPut: [self new]
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 1/7/2021 15:37'
}
LOGLBreakoutResourceManager class >> loadTexture: aForm as: name [

	^ self instance loadTexture: aForm as: name
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 1/7/2021 15:33'
}
LOGLBreakoutResourceManager >> getTexture: name [

	^ textures at: name
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 1/7/2021 15:23'
}
LOGLBreakoutResourceManager >> initialize [

	super initialize.
	textures := Dictionary new
]

{
	#category : #loading,
	#'squeak_changestamp' : 'stlu 1/7/2021 15:29'
}
LOGLBreakoutResourceManager >> loadTexture: aForm as: name [

	| texture |
	texture := GL2DTexture create.
	texture boundDuring: [
		texture
			imageForm: aForm;
			wrapS: GL REPEAT;
			wrapT: GL REPEAT;
			minificationFilter: GL LINEAR;
			magnificationFilter: GL LINEAR].
	textures at: name put: texture
]
