Class {
	#name : #GLFWContext,
	#superclass : #GLContext,
	#instVars : [
		'window'
	],
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-OpenGL',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 4/16/2021 10:35'
}
GLFWContext class >> newIn: bounds version: aGLVersion title: aString [

	self flag: #todo. "Deprecated"
	GLFW targetVersion: aGLVersion.
	^ self window: (GLFWWindow
						extent: bounds extent
						title: aString)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/12/2021 22:59'
}
GLFWContext class >> window: aWindow [

	^ GLFW contexts
		at: aWindow
		ifAbsentPut: [
			self basicNew
				window: aWindow;
				initialize;
				yourself]
]

{
	#category : #activation,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> activate [

	window makeCurrent
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPI [

	^ window getAttribute: GLFW_CLIENT_API
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:39'
}
GLFWContext >> clientAPIMajorVersion [

	^ window getAttribute: GLFW_CONTEXT_VERSION_MAJOR
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPIMinorVersion [

	^ window getAttribute: GLFW_CONTEXT_VERSION_MINOR
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:39'
}
GLFWContext >> clientAPIName [

	| api |
	api := self clientAPI.
	api = GLFW_OPENGL_API ifTrue: [^ #gl].
	api = GLFW_NO_API ifTrue: [^ #none].
	api = GLFW_OPENGL_ES_API ifTrue: [
		self clientAPIMajorVersion > 1
			ifTrue: [^ #gles2]
			ifFalse: [^ #gles1]].
	self error: 'Unkown client API'
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPIRevision [

	^ window getAttribute: GLFW_CONTEXT_REVISION
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 22:41'
}
GLFWContext >> creationAPI [

	^ window getAttribute: GLFW_CONTEXT_CREATION_API
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 22:41'
}
GLFWContext >> creationAPIName [

	| api |
	api := self contextCreationAPI.
	api = GLFW_NATIVE_CONTEXT_API ifTrue: [^ #native].
	api = GLFW_EGL_CONTEXT_API ifTrue: [^ #egl].
	api = GLFW_OSMESA_CONTEXT_API ifTrue: [^ #mesa].
	self error: 'Unkown context creation API'
]

{
	#category : #activation,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> deactivate [

	GLFW makeContextCurrent: nil
]

{
	#category : #'context actions',
	#timestamp : 'stlu 12/8/2020 17:47'
}
GLFWContext >> destroy [

	super destroy.
	window ifNotNil: [
		GLFW contexts removeKey: window.
		window destroy]
]

{
	#category : #'context actions',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> endFrame [

	GLFW pollEvents
]

{
	#category : #testing,
	#timestamp : 'stlu 2/12/2021 22:41'
}
GLFWContext >> generatesErrors [

	^ (window getAttribute: GLFW_CONTEXT_NO_ERROR) = GLFW_FALSE
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 4/16/2021 13:00'
}
GLFWContext >> initializeVersion [

	version := GLVersion
				api: self clientAPIName
				major: self clientAPIMajorVersion
				minor: self clientAPIMinorVersion
				profile: self openGLProfile
]

{
	#category : #testing,
	#timestamp : 'stlu 2/12/2021 22:43'
}
GLFWContext >> isDebug [

	^ (window getAttribute: GLFW_OPENGL_DEBUG_CONTEXT) = GLFW_TRUE
]

{
	#category : #testing,
	#timestamp : 'stlu 2/12/2021 22:42'
}
GLFWContext >> isForwardCompatible [

	^ (window getAttribute: GLFW_OPENGL_FORWARD_COMPAT) = GLFW_TRUE
]

{
	#category : #'client api',
	#timestamp : 'stlu 4/16/2021 10:13'
}
GLFWContext >> openGLProfile [

	^ (window getAttribute: GLFW_OPENGL_PROFILE) caseOf: {
		[GLFW_OPENGL_CORE_PROFILE] -> [#core].
		[GLFW_OPENGL_COMPAT_PROFILE] -> [#compatibility].
		[GLFW_OPENGL_ANY_PROFILE] -> [nil] }
]

{
	#category : #'client api',
	#timestamp : 'stlu 2/12/2021 22:43'
}
GLFWContext >> openGLProfileName [

	| profile |
	profile := self openGLProfile.
	profile = GLFW_OPENGL_CORE_PROFILE ifTrue: [^ #core].
	profile = GLFW_OPENGL_COMPAT_PROFILE ifTrue: [^ #compatibility].
	profile = GLFW_OPENGL_ANY_PROFILE ifTrue: [^ #unkown].
	self error: 'Unkown context profile'
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 22:44'
}
GLFWContext >> releaseBehavior [

	^ window getAttribute: GLFW_CONTEXT_RELEASE_BEHAVIOR
]

{
	#category : #'context actions',
	#timestamp : 'stlu 4/16/2021 14:07'
}
GLFWContext >> resolveFunctionAddress: functionName [

	| result |
	self assert: self = GL context.
	^ (result := GLFW getProcAddress: functionName) isNull ifFalse: [result getHandle]
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 22:45'
}
GLFWContext >> robustness [

	^ window getAttribute: GLFW_CONTEXT_ROBUSTNESS
]

{
	#category : #testing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> shouldClose [

	^ window shouldClose
]

{
	#category : #'context actions',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> swapBuffers [

	window swapBuffers
]

{
	#category : #'context actions',
	#timestamp : 'stlu 10/19/2020 16:50'
}
GLFWContext >> useMorphicEventHandling [

	self flag: #todo. "This is not the right place for this."
	window cursorPosCallback: [:win :x :y |
		| evt |
		evt := MouseMoveEvent new
				setType: #mouseMove
				startPoint: x @ y
				endPoint: x @ y
				trail: nil
				buttons: 0
				hand: ActiveHand
				stamp: 0.
		ActiveHand handleEvent: evt].
	
	window mouseButtonCallback: [:win :button :down :mods |
		ActiveHand handleEvent: (MouseButtonEvent new
			setType: (down ifTrue: [#mouseDown] ifFalse: [#mouseUp])
			position: ActiveHand position
			which: button
			buttons: button
			hand: ActiveHand
			stamp: 0)].
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWContext >> window [

	^ window
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 10/19/2020 15:54'
}
GLFWContext >> window: aWindow [

	window := aWindow
]
