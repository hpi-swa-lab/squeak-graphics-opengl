Class {
	#name : #LOGLBreakoutPostProcessingProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout'
}

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:20'
}
LOGLBreakoutPostProcessingProgram class >> fragmentShader [

	^ self glslFragmentShader
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 3/6/2021 15:03'
}
LOGLBreakoutPostProcessingProgram class >> fragmentShader: out inputs: in uniforms: u [

	| texCoords color texel |
	texCoords := in TexCoords beFloatVector2.
	texel := u scene beFloat2DSampler at: texCoords.
	
	color := texel.
	(u chaos beBoolean or: u shake beBoolean) ifTrue: [
		| kernel |
		kernel := u chaos beBoolean
					ifTrue: [u edgeKernel beFloatArray: 9]
					ifFalse: [u blurKernel beFloatArray: 9].
		color := 0.0 @ 0.0 @ 0.0 @ 1.0.
		0 to: 8 do: [:i |
			| sample offset k |
			offset := (u offsets beFloatVector2Array: 9) at: i.
			sample := (u scene at: texCoords + offset) rgb.
			k := kernel at: i.
			color := color + (sample * k @ 0.0)]].
	u confuse beBoolean ifTrue: [
		color := 1.0 - texel rgb @ 1.0].
	
	out color: color
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 17:15'
}
LOGLBreakoutPostProcessingProgram class >> glslFragmentShader [

	^ '#version 330 core
in vec2 vTexCoords;
out vec4 oColor;

uniform sampler2D sScene;
uniform vec2 uOffsets[9];
uniform float uEdgeKernel[9];
uniform float uBlurKernel[9];

uniform bool uChaosIsActive;
uniform bool uConfusionIsActive;
uniform bool uShakeIsActive;

void main() {
	vec4 texel = texture(sScene, vTexCoords);
	vec4 color = texel;

	if (uChaosIsActive || uShakeIsActive) {
		float kernel[9];
		kernel = uChaosIsActive ? uEdgeKernel : uBlurKernel;
		color = vec4(0.0f, 0.0f, 0.0f, 1.0f);

		for (int i = 0; i <= 8; i++) {
			vec2 offset = uOffsets[i];
			vec3 sample = texture(sScene, vTexCoords + offset).rgb;
			color += vec4(sample * kernel[i], 0.0f);
		}
	}
	
	if (uConfusionIsActive) {
		color = vec4(1.0 - texel.rgb, 1.0);
	}
	
	oColor = color;
}'
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 8/6/2021 17:19'
}
LOGLBreakoutPostProcessingProgram class >> glslVertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 aVertex; // <vec2 position, vec2 texCoords>

out vec2 vTexCoords;

uniform bool uChaosIsActive;
uniform bool uConfusionIsActive;
uniform bool uShakeIsActive;
uniform float uTime;

#define SHAKE_STRENGTH 0.01
#define CHAOS_STRENGTH 0.3

void main() {
	vec2 pos = aVertex.xy;
	if (uShakeIsActive) {
		pos += cos(vec2(10.0, 15.0) * uTime) * SHAKE_STRENGTH;
	}
	gl_Position = vec4(aVertex.xy, 0.0f, 1.0f); 

	vec2 texCoords = aVertex.zw;
	if (uChaosIsActive) {
		texCoords += vec2(sin(uTime), cos(uTime)) * CHAOS_STRENGTH;
	} else if(uConfusionIsActive) {
		texCoords = 1.0 - texCoords;
	}
	vTexCoords = texCoords;
}'
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:20'
}
LOGLBreakoutPostProcessingProgram class >> vertexShader [

	^ self glslVertexShader
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 1/10/2021 00:33'
}
LOGLBreakoutPostProcessingProgram class >> vertexShader: out inputs: in uniforms: u [

	| vertex pos texCoords time |
	vertex := in vertex beFloatVector4.
	time := u time beFloat.
	
	pos := vertex xy.
	u shake beBoolean ifTrue: [
		pos := (10.0@15.0 * time) cos * 0.01 + pos].
	out gl_Position: pos @ 0.0 @ 1.0.
	
	texCoords := vertex zw.
	u chaos beBoolean ifTrue: [
		texCoords := texCoords + (time sin @ time cos * 0.3)].
	u confusion beBoolean ifTrue: [
		texCoords := 1.0 - texCoords].
	out TexCoords: texCoords
]
