"
1.6.1
"
Class {
	#name : #LOGLCoordinateSystems,
	#superclass : #LOGLTransformations,
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 9/10/2021 13:06'
}
LOGLCoordinateSystems >> draw [

	| model |
	model := Matrix4x4 withRotation: -55.0 around: 1.0 @ 0.0 @ 0.0.
	program uniforms
		model: model;
		view: self viewMatrix;
		projection: self projectionMatrix.
	vao
		drawElements: GL_TRIANGLES
		numVertices: 6
		indexType: GL_UNSIGNED_INT.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/29/2021 17:36'
}
LOGLCoordinateSystems >> projectionMatrix [

	| extent |
	extent := window framebufferExtent.
	^ (Matrix4x4
		perspective: 45.0 degreesToRadians
		aspectRatio: extent x / extent y
		near: 0.1 far: 100.0)
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 1/29/2021 14:13'
}
LOGLCoordinateSystems >> vertexShaderSource [

	^ '#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 TexCoord;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
	gl_Position = projection * view * model * vec4(aPos, 1.0);
	TexCoord = vec2(aTexCoord.x, aTexCoord.y);
}'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/29/2021 17:36'
}
LOGLCoordinateSystems >> viewMatrix [

	^ Matrix4x4 withOffset: 0.0 @ 0.0 @ -3.0
]
