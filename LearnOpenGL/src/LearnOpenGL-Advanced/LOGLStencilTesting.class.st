Class {
	#name : #LOGLStencilTesting,
	#superclass : #LOGLDepthTesting,
	#instVars : [
		'singleColorProgram'
	],
	#category : #'LearnOpenGL-Advanced'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:32'
}
LOGLStencilTesting >> cubeModelMatricesScaledBy: aFloat [

	| scaleMatrix |
	scaleMatrix := Matrix4x4 withScale: aFloat @ aFloat @ aFloat.
	^ self cubeModelMatrices collect: [:mat | mat * scaleMatrix]
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:22'
}
LOGLStencilTesting >> drawSingleColorCubes: modelMatrices [

	(vao vertexBufferBindingAt: 0) buffer: cubeVBO.
	
	modelMatrices do: [:modelMatrix |
		singleColorProgram uniforms model: modelMatrix.
		vao drawArrays: GL_TRIANGLES numVertices: 36].
]

{
	#category : #rendering,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:57'
}
LOGLStencilTesting >> render [

	GL clearColor: (Color r: 0.1 g: 0.1 b: 0.1 alpha: 0.1).
	GL stencilMask: 16rFF.
	GL clear: ((GL_COLOR_BUFFER_BIT bitOr: GL_DEPTH_BUFFER_BIT) bitOr: GL_STENCIL_BUFFER_BIT).
	
	vao boundDuring: [
		program useDuring: [
			program uniforms
				projection: self projectionMatrix;
				view: camera viewMatrix.
			
			"Draw floor as normal, but don't write the floor to the stencil buffer.
			We only care about the containers.
			We set its mask to 0x00 to not write to the stencil buffer."
			GL stencilFunc: GL_ALWAYS with: 0 with: 16rFF.
			GL stencilMask: 16r00.
			GL enable: GL_DEPTH_TEST.
			self drawPlane.
			
			"1st render pass: draw cubes as normal, writing to the stencil buffer"
			GL stencilFunc: GL_ALWAYS with: 1 with: 16rFF.
			GL stencilMask: 16rFF.
			self drawCubes: self cubeModelMatrices].
		
		singleColorProgram useDuring: [
			singleColorProgram uniforms
				projection: self projectionMatrix;
				view: camera viewMatrix.
			
			"2nd. render pass: now draw slightly scaled versions of the cubes, this time disabling stencil writing.
			Because the stencil buffer is now filled with several 1s,
			the parts of the buffer that are 1 are not drawn,
			thus only drawing the cubes' size differences, making it look like borders."
			GL stencilFunc: GL_NOTEQUAL with: 1 with: 16rFF.
			GL stencilMask: 16r00.
			GL disable: GL_DEPTH_TEST.
			self drawSingleColorCubes: (self cubeModelMatricesScaledBy: 1.1)]].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/9/2021 23:30'
}
LOGLStencilTesting >> setUp [

	super setUp.

	GL enable: GL_STENCIL_TEST.
	GL stencilOp: GL_KEEP with: GL_KEEP with: GL_REPLACE.
		
	singleColorProgram := GLProgram
		vertexSource: self vertexShaderSource
		fragmentSource: self singleColorFragmentShaderSource.
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 12/9/2021 14:36'
}
LOGLStencilTesting >> singleColorFragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

void main()
{
    FragColor = vec4(0.04, 0.28, 0.26, 1.0);
}'
]
