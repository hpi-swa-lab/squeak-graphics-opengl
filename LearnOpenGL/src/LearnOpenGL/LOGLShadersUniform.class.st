"
1.3.1
"
Class {
	#name : #LOGLShadersUniform,
	#superclass : #LOGLHelloTriangle,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 1/4/2021 04:08'
}

{
	#category : #shaders,
	#timestamp : 'stlu 1/4/2021 03:46'
}
LOGLShadersUniform >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;
uniform vec4 ourColor;
void main() {
	FragColor = ourColor;
}'
]

{
	#category : #running,
	#timestamp : 'stlu 1/4/2021 04:04'
}
LOGLShadersUniform >> render [

	| time |
	time := (Time utcMicrosecondClock / 1e6) sin / 2 + 0.5.
	program uniforms ourColor: (0.0 @ time @ 0.0 @ 1.0).
	super render
]
