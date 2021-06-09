"
1.7.1
"
Class {
	#name : #LOGLCameraCircle,
	#superclass : #LOGLCoordinateSystemsMultiple,
	#category : #'LearnOpenGL-GettingStarted'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 22:47'
}
LOGLCameraCircle >> viewMatrix [

	| radius camX camZ |
	radius := 10.0.
	camX := timeOfLastFrame sin * radius.
	camZ := timeOfLastFrame cos * radius.
	^ Matrix4x4
		lookAt: 0.0 @ 0.0 @ 0.0
		from: camX @ 0.0 @ camZ
		up: 0.0 @ 1.0 @ 0.0
]
