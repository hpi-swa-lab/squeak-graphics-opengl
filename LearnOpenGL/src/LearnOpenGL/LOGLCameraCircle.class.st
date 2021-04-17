"
1.7.1
"
Class {
	#name : #LOGLCameraCircle,
	#superclass : #LOGLCoordinateSystemsMultiple,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 2/1/2021 13:43'
}

{
	#category : #accessing,
	#timestamp : 'stlu 2/1/2021 13:36'
}
LOGLCameraCircle >> viewMatrix [

	| radius camX camZ |
	radius := 10.0.
	camX := lastFrameTime sin * radius.
	camZ := lastFrameTime cos * radius.
	^ Matrix4x4
		lookAt: 0.0 @ 0.0 @ 0.0
		from: camX @ 0.0 @ camZ
		up: 0.0 @ 1.0 @ 0.0
]
