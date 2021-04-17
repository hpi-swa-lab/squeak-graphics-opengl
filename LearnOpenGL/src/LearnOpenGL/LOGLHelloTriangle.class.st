"
1.2.1
"
Class {
	#name : #LOGLHelloTriangle,
	#superclass : #LOGLTemplate,
	#instVars : [
		'program',
		'vao',
		'vbo'
	],
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 12/14/2020 15:50'
}

{
	#category : #running,
	#timestamp : 'stlu 3/15/2021 16:22'
}
LOGLHelloTriangle >> draw [

	vao drawArrays: GL_TRIANGLES count: 3
]

{
	#category : #shaders,
	#timestamp : 'stlu 10/22/2020 16:53'
}
LOGLHelloTriangle >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;
void main() {
	FragColor = vec4(1.0f, 0.5f, 0.2f, 1.0f);
}'
]

{
	#category : #running,
	#timestamp : 'stlu 4/15/2021 12:10'
}
LOGLHelloTriangle >> render [

	GL clearColor: (Color r: 0.2 g: 0.3 b: 0.3).
	GL clear: GL_COLOR_BUFFER_BIT.
	
	vao boundDuring: [
		program useDuring: [
			self draw]]
]

{
	#category : #running,
	#timestamp : 'stlu 4/16/2021 15:32'
}
LOGLHelloTriangle >> setUp [

	program := GLProgram
					vertexSource: self vertexShaderSource
					fragmentSource: self fragmentShaderSource.
	
	vbo := GLBuffer create.
	vao := GLVertexArray create.
	
	vao boundDuring: [
		vbo usage: GL_STATIC_DRAW data: self vertices.
		(vao vertexBufferBindingAt: 0) buffer: vbo stride: 3 * 4.
		(vao vertexAttributeAt: program inputs aPos location)
			enable;
			formatAsFloat: GL_FLOAT numComponents: 3 offset: 0;
			associateVertexBufferBindingAt: 0].
]

{
	#category : #shaders,
	#timestamp : 'stlu 1/4/2021 03:45'
}
LOGLHelloTriangle >> vertexShaderSource [

	^ '#version 330 core
layout (location = 0) in vec3 aPos;
void main() {
	gl_Position = vec4(aPos, 1.0);
}'
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/22/2020 14:34'
}
LOGLHelloTriangle >> vertices [

	^ #(
			-0.5 -0.5 0.0
			0.5 -0.5 0.0
			0.0 0.5 0.0
		) asFloat32Array
]
