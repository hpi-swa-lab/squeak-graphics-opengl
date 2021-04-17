Class {
	#name : #LOGLBreakoutParticleProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'shader code',
	#timestamp : 'stlu 1/8/2021 15:01'
}
LOGLBreakoutParticleProgram class >> fragmentShader [

	^ '#version 330 core
in vec2 TexCoords;
in vec4 ParticleColor;
out vec4 color;

uniform sampler2D sprite;

void main()
{
    color = texture(sprite, TexCoords) * ParticleColor;
}'
]

{
	#category : #'shader code',
	#timestamp : 'stlu 1/8/2021 12:20'
}
LOGLBreakoutParticleProgram class >> vertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 vertex; // <vec2 position, vec2 texCoords>

out vec2 TexCoords;
out vec4 ParticleColor;

uniform mat4 projection;
uniform vec2 offset;
uniform vec4 color;

void main()
{
    float scale = 10.0f;
    TexCoords = vertex.zw;
    ParticleColor = color;
    gl_Position = projection * vec4((vertex.xy * scale) + offset, 0.0, 1.0);
}'
]
