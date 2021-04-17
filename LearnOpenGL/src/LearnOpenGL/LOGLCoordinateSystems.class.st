"
1.6.1
"
Class {
	#name : #LOGLCoordinateSystems,
	#superclass : #LOGLTransformations,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 1/29/2021 15:17'
}

{
	#category : #running,
	#timestamp : 'stlu 3/15/2021 16:26'
}
LOGLCoordinateSystems >> draw [

	| model |
	model := Matrix4x4 withRotation: -55.0 around: 1.0 @ 0.0 @ 0.0.
	program uniforms
		model: model;
		view: self viewMatrix;
		projection: self projectionMatrix.
	vao drawElements: GL_TRIANGLES count: 6 startingAt: 0 type: GL_UNSIGNED_INT
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/29/2021 17:36'
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
	#timestamp : 'stlu 1/29/2021 14:13'
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
	#timestamp : 'stlu 1/29/2021 17:36'
}
LOGLCoordinateSystems >> viewMatrix [

	^ Matrix4x4 withOffset: 0.0 @ 0.0 @ -3.0
]
