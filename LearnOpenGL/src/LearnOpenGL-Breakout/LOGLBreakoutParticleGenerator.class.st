Class {
	#name : #LOGLBreakoutParticleGenerator,
	#superclass : #Object,
	#instVars : [
		'particles',
		'amount',
		'program',
		'texture',
		'vao',
		'lastUsedParticleIndex'
	],
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 1/8/2021 12:23'
}
LOGLBreakoutParticleGenerator class >> texture: aTexture amount: numParticles [

	^ self basicNew
		texture: aTexture;
		amount: numParticles;
		initialize;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> amount [

	^ amount
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> amount: anObject [

	amount := anObject
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:15'
}
LOGLBreakoutParticleGenerator >> draw [
	"render all particles"
	"use additive blending to give it a 'glow' effect"
	GL blendFunc: GL SRC_ALPHA with: GL ONE.
	
	program useDuring: [
		texture boundDuring: [
			vao boundDuring: [
				particles do: [:particle |
					particle isAlive ifTrue: [
						program uniforms
							uOffset: particle position;
							uColor: particle color.
						vao drawArrays: GL TRIANGLES count: 6]]]]].
	
	"don't forget to reset to default blending mode"
	GL blendFunc: GL SRC_ALPHA with: GL ONE_MINUS_SRC_ALPHA
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 12:03'
}
LOGLBreakoutParticleGenerator >> firstUnusedParticle [

	^ particles at: self firstUnusedParticleIndex
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 12:04'
}
LOGLBreakoutParticleGenerator >> firstUnusedParticleIndex [

	"first search from last used particle, this will usually return almost instantly"
	lastUsedParticleIndex to: amount do: [:i |
		| particle |
		particle := particles at: i.
		particle isAlive ifFalse: [
			^ lastUsedParticleIndex := i]].
	
	"otherwise, do a linear search"
	particles withIndexDo: [:particle :i |
		particle isAlive ifFalse: [
			^ lastUsedParticleIndex := i]].
	
	"all particles are taken, override the first one
	(note that if it repeatedly hits this case, more particles should be reserved)"
	^ lastUsedParticleIndex := 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:16'
}
LOGLBreakoutParticleGenerator >> initialize [

	| vbo |
	super initialize.
	vao := GLVertexArray create.
	vbo := GLBuffer create.
	program := LOGLBreakoutParticleProgram create.
	
	program uniforms sSprite: 0.
	
	vao boundDuring: [
		vbo boundDuring: [
			vbo
				usage: GL STATIC_DRAW
				data: self particleQuad.
			program inputs aVertex
				stride: 4 * 4
				offset: 0]].
	
	particles := Array new: amount.
	1 to: amount do: [:i |
		particles at: i put: LOGLBreakoutParticle new].
	lastUsedParticleIndex := 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 11:01'
}
LOGLBreakoutParticleGenerator >> particleQuad [

	^ #(
		0.0 1.0 0.0 1.0
		1.0 0.0 1.0 0.0
		0.0 0.0 0.0 0.0

		0.0 1.0 0.0 1.0
		1.0 1.0 1.0 1.0
		1.0 0.0 1.0 0.0
	) asFloat32Array
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 11:02'
}
LOGLBreakoutParticleGenerator >> program [

	^ program
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 11:02'
}
LOGLBreakoutParticleGenerator >> program: anObject [

	program := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 8/6/2021 16:16'
}
LOGLBreakoutParticleGenerator >> projection: aMatrix4x4 [

	program uniforms uProjection: aMatrix4x4
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> texture [

	^ texture
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> texture: anObject [

	texture := anObject
]

{
	#category : #updating,
	#'squeak_changestamp' : 'stlu 1/8/2021 13:38'
}
LOGLBreakoutParticleGenerator >> update: elapsedSecs object: aGameObject new: newParticles offset: offset [

	"add new particles"
	newParticles timesRepeat: [
		self firstUnusedParticle respawn: aGameObject offset: offset].
	
	"update all particles"
	particles do: [:particle |
		particle update: elapsedSecs]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> vao [

	^ vao
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/6/2021 10:58'
}
LOGLBreakoutParticleGenerator >> vao: anObject [

	vao := anObject
]
