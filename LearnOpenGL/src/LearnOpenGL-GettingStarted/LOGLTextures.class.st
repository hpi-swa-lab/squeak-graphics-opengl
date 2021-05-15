"
1.4.1
"
Class {
	#name : #LOGLTextures,
	#superclass : #LOGLHelloTriangleIndexed,
	#instVars : [
		'texture'
	],
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 1/4/2021 04:41'
}
LOGLTextures >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

uniform sampler2D texture1;

void main() {
	FragColor = texture(texture1, TexCoord);
}'
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 1/7/2021 11:19'
}
LOGLTextures >> isWireframe [

	^ false
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 5/14/2021 21:55'
}
LOGLTextures >> setUp [

	super setUp.
	
	texture := GL2DTexture create.
	texture
		bindAt: 0;
		wrapS: GL_REPEAT;
		wrapT: GL_REPEAT;
		minificationFilter: GL_LINEAR;
		magnificationFilter: GL_LINEAR;
		imageForm: LOGLImages container flipVertically;
		generateMipmap.
	
	vao boundDuring: [
		(vao vertexBufferBindingAt: 0) buffer: vbo stride: 5 * 4.
		
		(vao vertexAttributeAt: program inputs aPos location)
			enable;
			formatAsFloat: GL_FLOAT numComponents: 3 offset: 0;
			associateVertexBufferBindingAt: 0.
		
		(vao vertexAttributeAt: program inputs aTexCoord location)
			enable;
			formatAsFloat: GL_FLOAT numComponents: 2 offset: 3 * 4;
			associateVertexBufferBindingAt: 0].
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 1/4/2021 04:42'
}
LOGLTextures >> vertexShaderSource [

	^ '#version 330 core
in vec3 aPos;
in vec2 aTexCoord;

out vec2 TexCoord;

void main() {
	gl_Position = vec4(aPos, 1.0);
	TexCoord = vec2 (aTexCoord.x, aTexCoord.y);
}'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 1/4/2021 05:41'
}
LOGLTextures >> vertices [

	^ #(	"positions"		"texture coords"
			0.5 0.5 0.0		1.0 1.0 "top right"
			0.5 -0.5 0.0	1.0 0.0 "bottom right"
			-0.5 -0.5 0.0	0.0 0.0 "bottom left"
			-0.5 0.5 0.0	0.0 1.0 "top left"
		) asFloat32Array
]
