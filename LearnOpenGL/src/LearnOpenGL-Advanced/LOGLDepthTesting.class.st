"
4.1.1
"
Class {
	#name : #LOGLDepthTesting,
	#superclass : #LOGL3DTemplate,
	#instVars : [
		'program',
		'vao',
		'cubeVBO',
		'planeVBO',
		'cubeTexture',
		'planeTexture'
	],
	#category : #'LearnOpenGL-Advanced'
}

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:08'
}
LOGLDepthTesting >> cubeModelMatrices [

	^ {
		Matrix4x4 withOffset: -1.0 @ 0.0 @ -1.0.
		Matrix4x4 withOffset: 2.0 @ 0.0 @ 0.0.
	}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 3/13/2021 00:59'
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
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:19'
}
LOGLDepthTesting >> draw [

	self drawCubes: self cubeModelMatrices.
	self drawPlane.
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:18'
}
LOGLDepthTesting >> drawCubes: modelMatrices [

	(vao vertexBufferBindingAt: 0) buffer: cubeVBO.
	program uniforms texture1: 1.
	
	modelMatrices do: [:modelMatrix |
		program uniforms model: modelMatrix.
		vao drawArrays: GL_TRIANGLES numVertices: 36].
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 14:29'
}
LOGLDepthTesting >> drawPlane [

	(vao vertexBufferBindingAt: 0) buffer: planeVBO.
	program uniforms texture1: 2.
	program uniforms model: Matrix4x4 identity.
	vao drawArrays: GL_TRIANGLES numVertices: 6.
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 3/13/2021 00:57'
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
	#'squeak_changestamp' : 'stlu 3/13/2021 01:02'
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
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:47'
}
LOGLDepthTesting >> render [

	GL clearColor: (Color r: 0.1 g: 0.1 b: 0.1 alpha: 0.1).
	GL clear: (GL_COLOR_BUFFER_BIT bitOr: GL_DEPTH_BUFFER_BIT).
	
	program useDuring: [
		program uniforms
			projection: self projectionMatrix;
			view: camera viewMatrix.
		vao boundDuring: [
			self draw]]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:49'
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
	
	cubeTexture := GLTexture2D create.
	planeTexture := GLTexture2D create.
	
	self flag: #todo. "avoid long texture initializations?"
	cubeTexture boundDuring: [
		cubeTexture
			bindAt: 1;
			wrapS: GL_REPEAT;
			wrapT: GL_REPEAT;
			minificationFilter: GL_LINEAR;
			magnificationFilter: GL_LINEAR;
			imageForm: LOGLImages marble flipVertically;
			generateMipmap].
	
	planeTexture boundDuring: [
		planeTexture
			bindAt: 2;
			wrapS: GL_REPEAT;
			wrapT: GL_REPEAT;
			minificationFilter: GL_LINEAR;
			magnificationFilter: GL_LINEAR;
			imageForm: LOGLImages metal flipVertically;
			generateMipmap].
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 3/13/2021 00:57'
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
