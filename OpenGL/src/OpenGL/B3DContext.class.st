Class {
	#name : #B3DContext,
	#superclass : #GLContext,
	#instVars : [
		'renderer'
	],
	#category : #'OpenGL-Core',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/9/2020 18:26'
}
B3DContext class >> bounds: aRectangle [

	^ self renderer: (B3DRenderer bounds: aRectangle)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/9/2020 18:24'
}
B3DContext class >> renderer: aRenderer [

	^ self basicNew
		renderer: aRenderer;
		initialize;
		yourself
]

{
	#category : #activation,
	#timestamp : 'stlu 11/9/2020 15:43'
}
B3DContext >> activate [

	renderer activate
]

{
	#category : #activation,
	#timestamp : 'stlu 11/9/2020 15:44'
}
B3DContext >> deactivate [

	renderer deactivate
]

{
	#category : #'context actions',
	#timestamp : 'stlu 11/9/2020 15:43'
}
B3DContext >> destroy [

	super destroy.
	renderer destroy
]

{
	#category : #'context actions',
	#timestamp : 'stlu 11/9/2020 15:42'
}
B3DContext >> endFrame [
	"do nothing"
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/16/2021 14:19'
}
B3DContext >> initializeVersion [

	| tempLib |
	"B3D does not offer any information on the created context.
	We need to determine the version through api calls."
	version := GL10 new.
	tempLib := GLExternalLibrary context: self.
	
	tempLib makeCurrentDuring: [
		| majorMinor profile |
		majorMinor := tempLib version.
		tempLib checkForError. "just called 1st OpenGL command - check it worked"
		profile := tempLib profile.
		version := GLVersion
					api: #gl
					major: majorMinor first
					minor: majorMinor second
					profile: profile].
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 15:41'
}
B3DContext >> renderer [

	^ renderer
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 15:41'
}
B3DContext >> renderer: anObject [

	renderer := anObject
]

{
	#category : #'context actions',
	#timestamp : 'stlu 4/16/2021 14:18'
}
B3DContext >> resolveFunctionAddress: functionName [

	self flag: #todo. "This is where B3D breaks apart."
	"leave resolution to FFI plugin and hope for the best"
	^ ExternalAddress new
]

{
	#category : #testing,
	#timestamp : 'stlu 11/9/2020 15:42'
}
B3DContext >> shouldClose [

	^ false
]

{
	#category : #'context actions',
	#timestamp : 'stlu 11/9/2020 15:41'
}
B3DContext >> swapBuffers [

	renderer swapBuffers
]
