"
4.3.1
"
Class {
	#name : #LOGLDiscarding,
	#superclass : #LOGLDepthTesting,
	#instVars : [
		'transparentVBO',
		'transparentTexture'
	],
	#category : #'LearnOpenGL-Advanced',
	#'squeak_changestamp' : 'stlu 6/27/2021 09:38'
}

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:51'
}
LOGLDiscarding >> draw [

	super draw.
	
	(vao vertexBufferBindingAt: 0) buffer: transparentVBO.
	program uniforms texture1: 3.
	self transparentLocations do: [:location |
		program uniforms model: (Matrix4x4 withOffset: location).
		vao drawArrays: GL_TRIANGLES count: 6]
]

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 6/27/2021 10:02'
}
LOGLDiscarding >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture1;

void main()
{             
    vec4 texColor = texture(texture1, TexCoords);
    if(texColor.a < 0.1)
        discard;
    FragColor = texColor;
}'
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:51'
}
LOGLDiscarding >> setUp [

	super setUp.

	transparentVBO := GLBuffer create.
	transparentVBO usage: GL_STATIC_DRAW data: self transparentVertices.
	
	transparentTexture := GLTexture2D create.
	transparentTexture boundDuring: [
		transparentTexture
			bindAt: 3;
			wrapS: GL_CLAMP_TO_EDGE;
			wrapT: GL_CLAMP_TO_EDGE;
			minificationFilter: GL_LINEAR;
			magnificationFilter: GL_LINEAR;
			imageForm: self transparentImageForm;
			generateMipmap].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:33'
}
LOGLDiscarding >> transparentImageForm [

	^ LOGLImages grass
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:41'
}
LOGLDiscarding >> transparentLocations [

	^ {
		-1.5 @ 0.0 @ -0.48.
		1.5 @ 0.0 @ 0.51.
		0.0 @ 0.0 @ 0.7.
		-0.3 @ 0.0 @ -2.3.
		0.5 @ 0.0 @ -0.6.
	}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:36'
}
LOGLDiscarding >> transparentVertices [

	^ #(	"positions"		"texture coords"
			0.0 0.5 0.0		0.0 0.0
			0.0 -0.5 0.0	0.0 1.0
			1.0 -0.5 0.0	1.0 1.0

			0.0 0.5 0.0		0.0 0.0
			1.0 -0.5 0.0	1.0 1.0
			1.0 0.5 0.0		1.0 0.0
		) asFloat32Array
]
