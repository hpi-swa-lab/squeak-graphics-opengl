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
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 1/8/2021 15:41'
}
LOGLBreakoutPostProcessor class >> extent: aPoint [

	^ self basicNew
		extent: aPoint;
		initialize;
		yourself
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 4/15/2021 12:10'
}
LOGLBreakoutPostProcessor >> beginRender [

	msfbo bind.
	GL clearColor: Color black.
	GL clear: GL COLOR_BUFFER_BIT
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 1/8/2021 16:25'
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
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> chaos [

	^ chaos
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> chaos: anObject [

	chaos := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> confusion [

	^ confusion
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> confusion: anObject [

	confusion := anObject
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 1/8/2021 16:23'
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
	#'squeak_changestamp' : 'stlu 1/9/2021 14:44'
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
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> extent [

	^ extent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> extent: anObject [

	extent := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:43'
}
LOGLBreakoutPostProcessor >> initialize [

	super initialize.
	confusion := false.
	shake := false.
	chaos := false.
	
	texture := GLTexture2D create.
	msfbo := GLFramebuffer create.
	fbo := GLFramebuffer create.
	rbo := GLRenderbuffer create.
	
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
	#'squeak_changestamp' : 'stlu 8/6/2021 16:09'
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
			program inputs aVertex
				stride: 4 * 4
				offset: 0]].
	
	program uniforms
		sScene: 0;
		uOffsets: self offsets;
		uEdgeKernel: self edgeKernel;
		uBlurKernel: self blurKernel
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 1/8/2021 17:56'
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
	#'squeak_changestamp' : 'stlu 8/6/2021 16:35'
}
LOGLBreakoutPostProcessor >> render: secs [

	program useDuring: [
		program uniforms
			uTime: secs asFloat;
			uConfusionIsActive: confusion;
			uChaosIsActive: chaos;
			uShakeIsActive: shake.
		texture boundDuring: [
			vao drawArrays: GL TRIANGLES count: 6]]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> shake [

	^ shake
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> shake: anObject [

	shake := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> texture [

	^ texture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/8/2021 15:34'
}
LOGLBreakoutPostProcessor >> texture: anObject [

	texture := anObject
]

{
	#category : #data,
	#'squeak_changestamp' : 'stlu 1/8/2021 16:13'
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
