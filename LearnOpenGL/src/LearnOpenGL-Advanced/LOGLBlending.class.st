"
4.3.2
"
Class {
	#name : #LOGLBlending,
	#superclass : #LOGLDiscarding,
	#category : #'LearnOpenGL-Advanced',
	#'squeak_changestamp' : 'stlu 6/27/2021 18:39'
}

{
	#category : #shaders,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:30'
}
LOGLBlending >> fragmentShaderSource [

	^ '#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture1;

void main()
{             
    FragColor = texture(texture1, TexCoords);
}'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:32'
}
LOGLBlending >> setUp [

	super setUp.
	
	GL enable: GL_BLEND.
	GL blendFunc: GL_SRC_ALPHA with: GL_ONE_MINUS_SRC_ALPHA.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:34'
}
LOGLBlending >> transparentImageForm [

	^ LOGLImages window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/27/2021 18:45'
}
LOGLBlending >> transparentLocations [

	^ super transparentLocations sorted: [:a :b |
		(camera position distanceTo: a)
			< (camera position distanceTo: b)]
]
