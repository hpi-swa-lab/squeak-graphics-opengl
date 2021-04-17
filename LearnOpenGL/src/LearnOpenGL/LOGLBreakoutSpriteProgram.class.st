Class {
	#name : #LOGLBreakoutSpriteProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'shader code',
	#timestamp : 'stlu 1/6/2021 13:28'
}
LOGLBreakoutSpriteProgram class >> fragmentShader [

	^ '#version 330 core
in vec2 TexCoords;
out vec4 color;

uniform sampler2D sprite;
uniform vec3 spriteColor;

void main()
{
    
    color = vec4(spriteColor, 1.0) * texture(sprite, TexCoords);
}'
]

{
	#category : #'shader code',
	#timestamp : 'stlu 1/6/2021 13:29'
}
LOGLBreakoutSpriteProgram class >> vertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 vertex; // <vec2 position, vec2 texCoords>

out vec2 TexCoords;

uniform mat4 model;
// note that we''re omitting the view matrix; the view never changes so we basically have an identity view matrix and can therefore omit it.
uniform mat4 projection;

void main()
{
    TexCoords = vertex.zw;
    gl_Position = projection * model * vec4(vertex.xy, 0.0, 1.0);
}'
]
