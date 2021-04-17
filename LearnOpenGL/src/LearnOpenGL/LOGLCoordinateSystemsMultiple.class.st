"
1.6.3
"
Class {
	#name : #LOGLCoordinateSystemsMultiple,
	#superclass : #LOGLCoordinateSystemsDepth,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 2/1/2021 13:50'
}

{
	#category : #accessing,
	#timestamp : 'stlu 1/29/2021 17:30'
}
LOGLCoordinateSystemsMultiple >> cubePositions [

	^ #(
			(0.0  0.0  0.0)
			(2.0  5.0 -15.0)
			(-1.5 -2.2 -2.5)
			(-3.8 -2.0 -12.3)
			(2.4 -0.4 -3.5)
			(-1.7  3.0 -7.5)
			(1.3 -2.0 -2.5)
			(1.5  2.0 -2.5)
			(1.5  0.2 -1.5)
			(-1.3  1.0 -1.5))
]

{
	#category : #running,
	#timestamp : 'stlu 3/15/2021 16:20'
}
LOGLCoordinateSystemsMultiple >> draw [

	program uniforms
		view: self viewMatrix;
		projection: self projectionMatrix.
	
	self cubePositions withIndexDo: [:position :index |
		| model angle |
		angle := index - 1 * 20.0.
		model := Matrix4x4 withRotation: angle around: 1.0 @ 0.3 @ 0.5.
		model := model translatedBy: (Vector3 from: position).
		program uniforms model: model.
		vao drawArrays: GL_TRIANGLES count: 36]
]
