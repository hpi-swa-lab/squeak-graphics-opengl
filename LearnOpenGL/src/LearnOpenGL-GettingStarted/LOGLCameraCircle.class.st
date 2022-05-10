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
	#'squeak_changestamp' : 'stlu 4/30/2022 22:54'
}
LOGLCameraCircle >> viewMatrix [

	| radius camX camZ |
	radius := 10.0.
	camX := (timeOfLastFrame / 1e6) sin * radius.
	camZ := (timeOfLastFrame / 1e6) cos * radius.
	^ Matrix4x4
		lookAt: 0.0 @ 0.0 @ 0.0
		from: camX @ 0.0 @ camZ
		up: 0.0 @ 1.0 @ 0.0
]
