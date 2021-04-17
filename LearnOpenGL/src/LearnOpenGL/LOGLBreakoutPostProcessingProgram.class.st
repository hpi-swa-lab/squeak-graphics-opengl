Class {
	#name : #LOGLBreakoutPostProcessingProgram,
	#superclass : #GLStaticProgram,
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #'shader code',
	#timestamp : 'stlu 3/6/2021 15:03'
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
	#timestamp : 'stlu 1/10/2021 00:38'
}
LOGLBreakoutPostProcessingProgram class >> glslFragmentShader [

	^ '#version 330 core
in vec2 TexCoords;
out vec4 color;

uniform sampler2D scene;
uniform vec2  offsets[9];
uniform int     edge_kernel[9];
uniform float  blur_kernel[9];

uniform bool chaos;
uniform bool confuse;
uniform bool shake;

void main()
{
    // zero out memory since an out variable is initialized with undefined values by default 
    color = vec4(0.0f);

    vec3 sample[9];
    // sample from texture offsets if using convolution matrix
    if(chaos || shake)
        for(int i = 0; i < 9; i++)
            sample[i] = vec3(texture(scene, TexCoords.st + offsets[i]));

    // process effects
    if(chaos)
    {           
        for(int i = 0; i < 9; i++)
            color += vec4(sample[i] * edge_kernel[i], 0.0f);
        color.a = 1.0f;
    }
    else if(confuse)
    {
        color = vec4(1.0 - texture(scene, TexCoords).rgb, 1.0);
    }
    else if(shake)
    {
        for(int i = 0; i < 9; i++)
            color += vec4(sample[i] * blur_kernel[i], 0.0f);
        color.a = 1.0f;
    }
    else
    {
        color =  texture(scene, TexCoords);
    }
}'
]

{
	#category : #'shader code',
	#timestamp : 'stlu 2/23/2021 16:41'
}
LOGLBreakoutPostProcessingProgram class >> glslVertexShader [

	^ '#version 330 core
layout (location = 0) in vec4 vertex; // <vec2 position, vec2 texCoords>

out vec2 TexCoords;

uniform bool chaos;
uniform bool confuse;
uniform bool shake;
uniform float time;

void main() {
    gl_Position = vec4(vertex.xy, 0.0f, 1.0f); 
    vec2 texture = vertex.zw;
    if (chaos) {
        float strength = 0.3;
        vec2 pos = vec2(texture.x + sin(time) * strength, texture.y + cos(time) * strength);        
        TexCoords = pos;
    } else if (confuse) {
        TexCoords = vec2(1.0 - texture.x, 1.0 - texture.y);
    } else {
        TexCoords = texture;
    }
    if (shake) {
        float strength = 0.01;
        gl_Position.x += cos(time * 10) * strength;        
        gl_Position.y += cos(time * 15) * strength;        
    }
}'
]

{
	#category : #'shader code',
	#timestamp : 'stlu 1/10/2021 00:33'
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
