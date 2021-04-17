"
4.1.1
"
Class {
	#name : #LOGLDepthTesting,
	#superclass : #LOGL3DTemplate,
	#instVars : [
		'program',
		'vao',
		'cubeVAO',
		'planeVAO',
		'cubeVBO',
		'planeVBO',
		'cubeTexture',
		'planeTexture'
	],
	#category : #'LearnOpenGL-Advanced',
	#commentStamp : 'stlu 3/13/2021 00:47'
}

{
	#category : #accessing,
	#timestamp : 'stlu 3/13/2021 00:59'
}
LOGLDepthTesting >> cubeVertices [

	^ #(	"positions"		"texture coords"
			-0.5 -0.5 -0.5	0.0 0.0
			0.5 -0.5 -0.5	1.0 0.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 0.5 -0.5	1.0 1.0
			-0.5 0.5 -0.5	0.0 1.0
			-0.5 -0.5 -0.5	0.0 0.0

			-0.5 -0.5 0.5	0.0 0.0
			0.5 -0.5 0.5	1.0 0.0
			0.5 0.5 0.5		1.0 1.0
			0.5 0.5 0.5		1.0 1.0
			-0.5 0.5 0.5	0.0 1.0
			-0.5 -0.5 0.5	0.0 0.0

			-0.5 0.5 0.5	1.0 0.0
			-0.5 0.5 -0.5	1.0 1.0
			-0.5 -0.5 -0.5	0.0 1.0
			-0.5 -0.5 -0.5	0.0 1.0
			-0.5 -0.5 0.5	0.0 0.0
			-0.5 0.5 0.5	1.0 0.0

			0.5 0.5 0.5		1.0 0.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 0.5	0.0 0.0
			0.5 0.5 0.5		1.0 0.0

			-0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 -0.5	1.0 1.0
			0.5 -0.5 0.5	1.0 0.0
			0.5 -0.5 0.5	1.0 0.0
			-0.5 -0.5 0.5	0.0 0.0
			-0.5 -0.5 -0.5	0.0 1.0

			-0.5 0.5 -0.5	0.0 1.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 0.5 0.5		1.0 0.0
			0.5 0.5 0.5		1.0 0.0
			-0.5 0.5 0.5	0.0 0.0
			-0.5 0.5 -0.5	0.0 1.0
		) asFloat32Array
]

{
	#category : #shaders,
	#timestamp : 'stlu 3/13/2021 00:57'
}
LOGLDepthTesting >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture1;

void main()
{    
    FragColor = texture(texture1, TexCoords);
}'
]

{
	#category : #accessing,
	#timestamp : 'stlu 3/13/2021 01:02'
}
LOGLDepthTesting >> planeVertices [

	^ #(	"positions"		"texture coords"
			5.0 -0.5 5.0	2.0 0.0
			-5.0 -0.5 5.0	0.0 0.0
			-5.0 -0.5 -5.0	0.0 2.0

			5.0 -0.5 5.0	2.0 0.0
			-5.0 -0.5 -5.0	0.0 2.0
			5.0 -0.5 -5.0	2.0 2.0
		) asFloat32Array
]

{
	#category : #running,
	#timestamp : 'stlu 4/15/2021 12:10'
}
LOGLDepthTesting >> render [

	GL clearColor: (Color r: 0.1 g: 0.1 b: 0.1 alpha: 0.1).
	GL clear: (GL_COLOR_BUFFER_BIT bitOr: GL_DEPTH_BUFFER_BIT).
	
	program useDuring: [
		program uniforms
			projection: self projectionMatrix;
			view: camera viewMatrix.
		self flag: #todo. "texture binding points"
		GL activeTexture: GL_TEXTURE0.
		vao boundDuring: [
			(vao vertexBufferBindingAt: 0) buffer: cubeVBO.
			cubeTexture bind.
			program uniforms model: (Matrix4x4 withOffset: -1.0 @ 0.0 @ -1.0).
			vao drawArrays: GL_TRIANGLES count: 36.
			program uniforms model: (Matrix4x4 withOffset: 2.0 @ 0.0 @ 0.0).
			vao drawArrays: GL_TRIANGLES count: 36.
		
			(vao vertexBufferBindingAt: 0) buffer: planeVBO.
			planeTexture bind.
			program uniforms model: Matrix4x4 identity.
			vao drawArrays: GL_TRIANGLES count: 6]]
]

{
	#category : #running,
	#timestamp : 'stlu 4/16/2021 15:32'
}
LOGLDepthTesting >> setUp [

	super setUp.

	GL enable: GL_DEPTH_TEST.
	GL depthFunc: GL_LESS.

	program := GLProgram
					vertexSource: self vertexShaderSource
					fragmentSource: self fragmentShaderSource.
	
	cubeVBO := GLBuffer create.
	planeVBO := GLBuffer create.
	vao := GLVertexArray create.
	
	vao boundDuring: [
		cubeVBO usage: GL_STATIC_DRAW data: self cubeVertices.
		planeVBO usage: GL_STATIC_DRAW data: self planeVertices.
		
		(vao vertexBufferBindingAt: 0) buffer: cubeVBO stride: 5 * 4.
		
		(vao vertexAttributeAt: program inputs aPos location)
			enable;
			formatAsFloat: GL_FLOAT numComponents: 3 offset: 0;
			associateVertexBufferBindingAt: 0.
		
		(vao vertexAttributeAt: program inputs aTexCoords location)
			enable;
			formatAsFloat: GL_FLOAT numComponents: 2 offset: 3 * 4;
			associateVertexBufferBindingAt: 0].
	
	cubeTexture := GL2DTexture create.
	planeTexture := GL2DTexture create.
	
	self flag: #todo. "avoid long texture initializations?"
	cubeTexture boundDuring: [
		cubeTexture
			wrapS: GL_REPEAT;
			wrapT: GL_REPEAT;
			minificationFilter: GL_LINEAR;
			magnificationFilter: GL_LINEAR;
			imageForm: LOGLImages marble flipVertically;
			generateMipmap].
	
	planeTexture boundDuring: [
		planeTexture
			wrapS: GL_REPEAT;
			wrapT: GL_REPEAT;
			minificationFilter: GL_LINEAR;
			magnificationFilter: GL_LINEAR;
			imageForm: LOGLImages metal flipVertically;
			generateMipmap].
	
	program uniforms texture1: 0.
]

{
	#category : #shaders,
	#timestamp : 'stlu 3/13/2021 00:57'
}
LOGLDepthTesting >> vertexShaderSource [

	^ '#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoords;

out vec2 TexCoords;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    TexCoords = aTexCoords;    
    gl_Position = projection * view * model * vec4(aPos, 1.0);
}'
]
