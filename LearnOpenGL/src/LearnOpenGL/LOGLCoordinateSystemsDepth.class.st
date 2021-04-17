"
1.6.2
"
Class {
	#name : #LOGLCoordinateSystemsDepth,
	#superclass : #LOGLCoordinateSystems,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 1/29/2021 15:17'
}

{
	#category : #running,
	#timestamp : 'stlu 3/15/2021 16:20'
}
LOGLCoordinateSystemsDepth >> draw [

	| model |
	model := Matrix4x4
				withRotation: lastFrameTime radiansToDegrees * 50.0 degreesToRadians
				around: 0.5 @ 1.0 @ 0.0.
	program uniforms
		model: model;
		view: self viewMatrix;
		projection: self projectionMatrix.
	vao drawArrays: GL_TRIANGLES count: 36
]

{
	#category : #running,
	#timestamp : 'stlu 1/29/2021 15:15'
}
LOGLCoordinateSystemsDepth >> render [

	GL clear: GL_DEPTH_BUFFER_BIT.
	super render
]

{
	#category : #running,
	#timestamp : 'stlu 1/29/2021 15:08'
}
LOGLCoordinateSystemsDepth >> setUp [

	GL enable: GL_DEPTH_TEST.
	super setUp
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/29/2021 14:59'
}
LOGLCoordinateSystemsDepth >> vertices [

	^ #(	"positions"		"texture coords"
			-0.5 -0.5 -0.5	0.0 0.0
			0.5 -0.5 -0.5	1.0 0.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 0.5 -0.5	1.0 1.0
			-0.5 0.5 -0.5	0.0 1.0
			-0.5 -0.5 -0.5	0.0 0.0

			-0.5 -0.5 0.5	0.0 0.0
			0.5 -0.5 0.5	1.0 0.0
			0.5 0.5 0.5		1.0 1.0
			0.5 0.5 0.5		1.0 1.0
			-0.5 0.5 0.5	0.0 1.0
			-0.5 -0.5 0.5	0.0 0.0

			-0.5 0.5 0.5	1.0 0.0
			-0.5 0.5 -0.5	1.0 1.0
			-0.5 -0.5 -0.5	0.0 1.0
			-0.5 -0.5 -0.5	0.0 1.0
			-0.5 -0.5 0.5	0.0 0.0
			-0.5 0.5 0.5	1.0 0.0

			0.5 0.5 0.5		1.0 0.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 0.5	0.0 0.0
			0.5 0.5 0.5		1.0 0.0

			-0.5 -0.5 -0.5	0.0 1.0
			0.5 -0.5 -0.5	1.0 1.0
			0.5 -0.5 0.5	1.0 0.0
			0.5 -0.5 0.5	1.0 0.0
			-0.5 -0.5 0.5	0.0 0.0
			-0.5 -0.5 -0.5	0.0 1.0

			-0.5 0.5 -0.5	0.0 1.0
			0.5 0.5 -0.5	1.0 1.0
			0.5 0.5 0.5		1.0 0.0
			0.5 0.5 0.5		1.0 0.0
			-0.5 0.5 0.5	0.0 0.0
			-0.5 0.5 -0.5	0.0 1.0
		) asFloat32Array
]
