Class {
	#name : #LOGLBreakoutSpriteRenderer,
	#superclass : #Object,
	#instVars : [
		'program',
		'vao'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #rendering,
	#timestamp : 'stlu 1/7/2021 16:17'
}
LOGLBreakoutSpriteRenderer >> drawSprite: aTexture position: position [

	self
		drawSprite: aTexture
		position: position
		extent: 10@10
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/7/2021 16:17'
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
	#timestamp : 'stlu 1/7/2021 16:17'
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
	#timestamp : 'stlu 3/15/2021 16:19'
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
			model: model;
			spriteColor: color;
			sprite: 0.
		
		GL activeTexture: GL TEXTURE0.
		aTexture bind.
		vao drawArrays: GL TRIANGLES count: 6]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/7/2021 14:00'
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
			program inputs vertex
				stride: 4 * 4
				offset: 0]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 13:54'
}
LOGLBreakoutSpriteRenderer >> projection: aMatrix4x4 [

	program uniforms projection: aMatrix4x4
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/6/2021 13:33'
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
