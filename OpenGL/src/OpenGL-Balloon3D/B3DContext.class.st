Class {
	#name : #B3DContext,
	#superclass : #GLContext,
	#instVars : [
		'renderer'
	],
	#category : #'OpenGL-Balloon3D'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/9/2020 18:26'
}
B3DContext class >> bounds: aRectangle [

	^ self renderer: (B3DRenderer bounds: aRectangle)
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 11/9/2020 18:24'
}
B3DContext class >> renderer: aRenderer [

	^ self basicNew
		renderer: aRenderer;
		initialize;
		yourself
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 11/9/2020 15:43'
}
B3DContext >> activate [

	renderer activate
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 11/9/2020 15:44'
}
B3DContext >> deactivate [

	renderer deactivate
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 11/9/2020 15:43'
}
B3DContext >> destroy [

	super destroy.
	renderer destroy
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 11/9/2020 15:42'
}
B3DContext >> endFrame [
	"do nothing"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 6/20/2022 16:49'
}
B3DContext >> initializeVersion [
	"B3D does not offer any information on the created context.
	We need to determine the version through api calls."
	version := GL10.
	self initializeLibrary.
	library makeCurrentDuring: [
		| majorMinor major minor profile |
		majorMinor := GL majorMinor.
		GL checkForError. "just called 1st OpenGL command - check it worked"
		major := majorMinor first.
		minor := majorMinor second.
		version := GLAPI major: major minor: minor profile: nil.
		profile := GL profile.
		version := GLAPI major: major minor: minor profile: profile].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/9/2020 15:41'
}
B3DContext >> renderer [

	^ renderer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/9/2020 15:41'
}
B3DContext >> renderer: anObject [

	renderer := anObject
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 4/16/2021 14:18'
}
B3DContext >> resolveFunctionAddress: functionName [

	self flag: #todo. "This is where B3D breaks apart."
	"leave resolution to FFI plugin and hope for the best"
	^ ExternalAddress new
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 11/9/2020 15:42'
}
B3DContext >> shouldClose [

	^ false
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 11/9/2020 15:41'
}
B3DContext >> swapBuffers [

	renderer swapBuffers
]
