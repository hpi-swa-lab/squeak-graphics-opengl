"
1.2.2
"
Class {
	#name : #LOGLHelloTriangleIndexed,
	#superclass : #LOGLHelloTriangle,
	#instVars : [
		'ebo'
	],
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 9/10/2021 13:08'
}
LOGLHelloTriangleIndexed >> draw [

	vao
		drawElements: GL_TRIANGLES
		numVertices: 6
		indexType: GL_UNSIGNED_INT.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/22/2020 15:01'
}
LOGLHelloTriangleIndexed >> indices [

	^ #(
			0 1 3
			1 2 3
		) asWordArray
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 1/7/2021 11:16'
}
LOGLHelloTriangleIndexed >> isWireframe [

	^ true
]

{
	#category : #running,
	#'squeak_changestamp' : 'stlu 9/9/2021 14:27'
}
LOGLHelloTriangleIndexed >> setUp [

	self isWireframe ifTrue: [
		GL polygonMode: GL_FRONT_AND_BACK with: GL_LINE].
	
	super setUp.
	
	ebo := GLBuffer create.
	
	vao boundDuring: [
		vao elementArrayBuffer: ebo.
		ebo usage: GL_STATIC_DRAW data: self indices].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/22/2020 14:37'
}
LOGLHelloTriangleIndexed >> vertices [

	^ #(
			0.5 0.5 0.0
			0.5 -0.5 0.0
			-0.5 -0.5 0.0
			-0.5 0.5 0.0
		) asFloat32Array
]
