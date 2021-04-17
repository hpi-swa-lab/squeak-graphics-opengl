Class {
	#name : #LOGLBreakoutPostProcessor,
	#superclass : #Object,
	#instVars : [
		'texture',
		'program',
		'extent',
		'confusion',
		'chaos',
		'shake',
		'msfbo',
		'fbo',
		'rbo',
		'vao'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/8/2021 15:41'
}
LOGLBreakoutPostProcessor class >> extent: aPoint [

	^ self basicNew
		extent: aPoint;
		initialize;
		yourself
]

{
	#category : #rendering,
	#timestamp : 'stlu 4/15/2021 12:10'
}
LOGLBreakoutPostProcessor >> beginRender [

	msfbo bind.
	GL clearColor: Color black.
	GL clear: GL COLOR_BUFFER_BIT
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 16:25'
}
LOGLBreakoutPostProcessor >> blurKernel [

	^ #(
		1.0 2.0 1.0
		2.0 4.0 2.0
		1.0 2.0 1.0
	) asFloat32Array / 16.0
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> chaos [

	^ chaos
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> chaos: anObject [

	chaos := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> confusion [

	^ confusion
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> confusion: anObject [

	confusion := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 16:23'
}
LOGLBreakoutPostProcessor >> edgeKernel [

	^ #(
		-1.0 -1.0 -1.0
		-1.0 8.0 -1.0
		-1.0 -1.0 -1.0
	) asFloat32Array
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/9/2021 14:44'
}
LOGLBreakoutPostProcessor >> endRender [

	msfbo
		blit: GL COLOR_BUFFER_BIT
		into: fbo
		from: (0@0 corner: extent)
		to: (0@0 corner: extent)
		filter: GL NEAREST.
	msfbo unbind
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> extent [

	^ extent
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> extent: anObject [

	extent := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 3/15/2021 13:16'
}
LOGLBreakoutPostProcessor >> initialize [

	super initialize.
	confusion := false.
	shake := false.
	chaos := false.
	
	texture := GL2DTexture create.
	msfbo := GLFrameBuffer create.
	fbo := GLFrameBuffer create.
	rbo := GLRenderBuffer create.
	
	msfbo bind.
	rbo bind.
	
	rbo initializeStorage: extent format: GL RGB samples: 4.
	msfbo attachRenderbuffer: rbo to: GL COLOR_ATTACHMENT0.
	msfbo checkCompletionStatus.
	
	fbo bind.
	texture boundDuring: [
		GL
			texImage2D: texture target
			with: 0
			with: GL RGB
			with: extent x
			with: extent y
			with: 0
			with: GL RGB
			with: GL UNSIGNED_BYTE
			with: nil.
		texture
			minificationFilter: GL LINEAR;
			magnificationFilter: GL LINEAR;
			wrapS: GL REPEAT;
			wrapT: GL REPEAT].
	fbo attach2DTexture: texture to: GL COLOR_ATTACHMENT0.
	fbo checkCompletionStatus.
	
	fbo unbind.
	
	self initializeRenderData
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/10/2021 19:11'
}
LOGLBreakoutPostProcessor >> initializeRenderData [

	| vbo |
	program := LOGLBreakoutPostProcessingProgram create.
	vao := GLVertexArray create.
	vbo := GLBuffer create.
	
	vao boundDuring: [
		vbo boundDuring: [
			vbo
				usage: GL STATIC_DRAW
				data: self vertices.
			program inputs vertex
				stride: 4 * 4
				offset: 0]].
	
	program uniforms
		scene: 0;
		offsets: self offsets;
		edgeKernel: self edgeKernel;
		blurKernel: self blurKernel
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 17:56'
}
LOGLBreakoutPostProcessor >> offsets [

	| n o |
	o := 1.0 / 300.0.
	n := o negated.
	^ {
		n. o.		"top-left"
		0.0. o.		"top-center"
		o. o.		"top-right"
		n. 0.0.		"center-left"
		0.0. 0.0.	"center-center"
		o. 0.0.		"center-right"
		n. n.		"bottom-left"
		0.0. n.		"bottom-center"
		o. n			"bottom-right"
	} asFloat32Array
]

{
	#category : #rendering,
	#timestamp : 'stlu 3/15/2021 16:19'
}
LOGLBreakoutPostProcessor >> render: secs [

	program useDuring: [
		program uniforms
			time: secs asFloat;
			confuse: confusion;
			chaos: chaos;
			shake: shake.
		GL activeTexture: GL TEXTURE0.
		texture boundDuring: [
			vao drawArrays: GL TRIANGLES count: 6]]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> shake [

	^ shake
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> shake: anObject [

	shake := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> texture [

	^ texture
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> texture: anObject [

	texture := anObject
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 16:13'
}
LOGLBreakoutPostProcessor >> vertices [

	^ #("pos"		"tex"
		-1.0 -1.0	0.0 0.0
		1.0 1.0		1.0 1.0
		-1.0 1.0	0.0 1.0

		-1.0 -1.0	0.0 0.0
		1.0 -1.0	1.0 0.0
		1.0 1.0		1.0 1.0 
	) asFloat32Array
]
