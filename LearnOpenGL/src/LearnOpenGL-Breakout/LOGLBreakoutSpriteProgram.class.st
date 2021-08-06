Class {
	#name : #LOGLBreakoutSpriteProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 16:20'
}
LOGLBreakoutSpriteProgram class >> fragmentShader [

	^ '#version 330 core
in vec2 vTexCoords;
out vec4 oColor;

uniform sampler2D sSprite;
uniform vec3 uSpriteColor;

void main() {
	oColor = vec4(uSpriteColor, 1.0) * texture(sSprite, vTexCoords);
}'
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 16:19'
}
LOGLBreakoutSpriteProgram class >> vertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 aVertex; // <vec2 position, vec2 texCoords>

out vec2 vTexCoords;

uniform mat4 uModel;
// note that we''re omitting the view matrix; the view never changes so we basically have an identity view matrix and can therefore omit it.
uniform mat4 uProjection;

void main() {
	vTexCoords = aVertex.zw;
	gl_Position = uProjection * uModel * vec4(aVertex.xy, 0.0, 1.0);
}'
]
