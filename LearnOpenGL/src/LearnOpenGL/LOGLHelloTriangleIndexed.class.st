"
1.2.2
"
Class {
	#name : #LOGLHelloTriangleIndexed,
	#superclass : #LOGLHelloTriangle,
	#instVars : [
		'ebo'
	],
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 1/4/2021 04:08'
}

{
	#category : #running,
	#timestamp : 'stlu 3/15/2021 16:27'
}
LOGLHelloTriangleIndexed >> draw [

	vao
		drawElements: GL_TRIANGLES
		count: 6
		startingAt: 0
		type: GL_UNSIGNED_INT
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/22/2020 15:01'
}
LOGLHelloTriangleIndexed >> indices [

	^ #(
			0 1 3
			1 2 3
		) asWordArray
]

{
	#category : #testing,
	#timestamp : 'stlu 1/7/2021 11:16'
}
LOGLHelloTriangleIndexed >> isWireframe [

	^ true
]

{
	#category : #running,
	#timestamp : 'stlu 4/16/2021 15:33'
}
LOGLHelloTriangleIndexed >> setUp [

	self isWireframe ifTrue: [
		GL polygonMode: GL_FRONT_AND_BACK with: GL_LINE].
	
	super setUp.
	
	ebo := GLBuffer create.
	ebo target: GL_ELEMENT_ARRAY_BUFFER.
	
	vao boundDuring: [
		ebo bind.
		ebo usage: GL_STATIC_DRAW data: self indices].
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/22/2020 14:37'
}
LOGLHelloTriangleIndexed >> vertices [

	^ #(
			0.5 0.5 0.0
			0.5 -0.5 0.0
			-0.5 -0.5 0.0
			-0.5 0.5 0.0
		) asFloat32Array
]
