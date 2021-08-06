Class {
	#name : #LOGLBreakoutSpriteRenderer,
	#superclass : #Object,
	#instVars : [
		'program',
		'vao'
	],
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 1/7/2021 16:17'
}
LOGLBreakoutSpriteRenderer >> drawSprite: aTexture position: position [

	self
		drawSprite: aTexture
		position: position
		extent: 10@10
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 1/7/2021 16:17'
}
LOGLBreakoutSpriteRenderer >> drawSprite: aTexture position: position extent: extent [

	self
		drawSprite: aTexture
		position: position
		extent: extent
		rotation: 0
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 1/7/2021 16:17'
}
LOGLBreakoutSpriteRenderer >> drawSprite: aTexture position: position extent: extent rotation: degrees [

	self
		drawSprite: aTexture
		position: position
		extent: extent
		rotation: degrees
		color: Color white
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:17'
}
LOGLBreakoutSpriteRenderer >> drawSprite: aTexture position: position extent: extent rotation: degrees color: color [

	program useDuring: [
		| model |
		model := Matrix4x4 identity.
		model := model scaledBy: extent @ 1.0.
		model := model translatedBy: -0.5 * extent.
		model := model rotatedBy: degrees around: 0.0@0.0@1.0.
		model := model translatedBy: 0.5 * extent.
		model := model translatedBy: position.
		
		program uniforms
			uModel: model;
			uSpriteColor: color;
			sSprite: 0.
		
		aTexture bind.
		vao drawArrays: GL TRIANGLES count: 6]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:10'
}
LOGLBreakoutSpriteRenderer >> initialize [

	| vbo |
	super initialize.
	vbo := GLBuffer create.
	vao := GLVertexArray create.
	program := LOGLBreakoutSpriteProgram create.
	
	vbo
		usage: GL STATIC_DRAW
		data: self vertices.
	
	vao boundDuring: [
		vbo boundDuring: [
			program inputs aVertex
				stride: 4 * 4
				offset: 0]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:21'
}
LOGLBreakoutSpriteRenderer >> projection: aMatrix4x4 [

	program uniforms uProjection: aMatrix4x4.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 13:33'
}
LOGLBreakoutSpriteRenderer >> vertices [

	^ #(
		0.0 1.0 0.0 1.0
		1.0 0.0 1.0 0.0
		0.0 0.0 0.0 0.0 
		
		0.0 1.0 0.0 1.0
		1.0 1.0 1.0 1.0
		1.0 0.0 1.0 0.0
	) asFloat32Array
]
