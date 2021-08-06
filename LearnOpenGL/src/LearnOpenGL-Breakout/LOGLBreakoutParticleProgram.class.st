Class {
	#name : #LOGLBreakoutParticleProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 16:23'
}
LOGLBreakoutParticleProgram class >> fragmentShader [

	^ '#version 330 core
in vec2 vTexCoords;
in vec4 vParticleColor;
out vec4 oColor;

uniform sampler2D sSprite;

void main() {
	oColor = texture(sSprite, vTexCoords) * vParticleColor;
}'
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 16:15'
}
LOGLBreakoutParticleProgram class >> vertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 aVertex; // <vec2 position, vec2 texCoords>

out vec2 vTexCoords;
out vec4 vParticleColor;

uniform mat4 uProjection;
uniform vec2 uOffset;
uniform vec4 uColor;

#define SCALE 10.0f

void main()
{
	vTexCoords = aVertex.zw;
	vParticleColor = uColor;
	gl_Position = uProjection * vec4((aVertex.xy * SCALE) + uOffset, 0.0, 1.0);
}'
]
