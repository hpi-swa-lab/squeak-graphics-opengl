"
1.5.1
"
Class {
	#name : #LOGLTransformations,
	#superclass : #LOGLTextures,
	#instVars : [
		'texture2'
	],
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 1/29/2021 15:11'
}
LOGLTransformations >> draw [

	| transform |
	transform := Matrix4x4 identity.
	transform := transform rotatedBy: lastFrameTime radiansToDegrees around: 0.0 @ 0.0 @ 1.0.
	transform := transform translatedBy: 0.5 @ -0.5 @ 0.0.
	program uniforms transform: transform.
	super draw
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 1/7/2021 11:26'
}
LOGLTransformations >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

in vec2 TexCoord;

// texture samplers
uniform sampler2D texture1;
uniform sampler2D texture2;

void main()
{
	// linearly interpolate between both textures (80% container, 20% awesomeface)
	FragColor = mix(texture(texture1, TexCoord), texture(texture2, TexCoord), 0.2);
}'
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 5/14/2021 22:34'
}
LOGLTransformations >> setUp [

	super setUp.
	
	texture2 := GL2DTexture create.
	GLTexture activateTextureImageUnitAt: 1.
	texture2
		bindAt: 1;
		wrapS: GL_REPEAT;
		wrapT: GL_REPEAT;
		minificationFilter: GL_LINEAR;
		magnificationFilter: GL_LINEAR;
		imageForm: LOGLImages awesomeface flipVertically;
		generateMipmap.
	
	program uniforms
		texture1: 0;
		texture2: 1.
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 1/7/2021 11:26'
}
LOGLTransformations >> vertexShaderSource [

	^ '#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec2 aTexCoord;

out vec2 TexCoord;

uniform mat4 transform;

void main()
{
	gl_Position = transform * vec4(aPos, 1.0);
	TexCoord = vec2(aTexCoord.x, aTexCoord.y);
}'
]
