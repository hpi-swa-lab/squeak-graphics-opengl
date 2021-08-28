Class {
	#name : #GLFWContext,
	#superclass : #GLContext,
	#instVars : [
		'window'
	],
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-OpenGL'
}

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 8/28/2021 14:01'
}
GLFWContext class >> newForWindow: aWindow [

	^ self basicNew
		window: aWindow;
		initialize;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/16/2021 10:35'
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
	#'squeak_changestamp' : 'stlu 8/28/2021 14:05'
}
GLFWContext class >> window: aWindow [

	^ GLFW contexts
		at: aWindow
		ifAbsentPut: [
			self newForWindow: aWindow]
]

{
	#category : #activation,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> activate [

	window makeCurrent
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPI [

	^ window getAttribute: GLFW_CLIENT_API
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 2/12/2021 22:39'
}
GLFWContext >> clientAPIMajorVersion [

	^ window getAttribute: GLFW_CONTEXT_VERSION_MAJOR
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPIMinorVersion [

	^ window getAttribute: GLFW_CONTEXT_VERSION_MINOR
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 2/12/2021 22:39'
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
	#'squeak_changestamp' : 'stlu 2/12/2021 22:40'
}
GLFWContext >> clientAPIRevision [

	^ window getAttribute: GLFW_CONTEXT_REVISION
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/12/2021 22:41'
}
GLFWContext >> creationAPI [

	^ window getAttribute: GLFW_CONTEXT_CREATION_API
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/12/2021 22:41'
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
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> deactivate [

	GLFW makeContextCurrent: nil
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 8/28/2021 13:29'
}
GLFWContext >> destroy [

	super destroy.
	window ifNotNil: [
		window destroy]
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> endFrame [

	GLFW pollEvents
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 2/12/2021 22:41'
}
GLFWContext >> generatesErrors [

	^ (window getAttribute: GLFW_CONTEXT_NO_ERROR) = GLFW_FALSE
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 4/16/2021 13:00'
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
	#'squeak_changestamp' : 'stlu 2/12/2021 22:43'
}
GLFWContext >> isDebug [

	^ (window getAttribute: GLFW_OPENGL_DEBUG_CONTEXT) = GLFW_TRUE
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 2/12/2021 22:42'
}
GLFWContext >> isForwardCompatible [

	^ (window getAttribute: GLFW_OPENGL_FORWARD_COMPAT) = GLFW_TRUE
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 4/16/2021 10:13'
}
GLFWContext >> openGLProfile [

	^ (window getAttribute: GLFW_OPENGL_PROFILE) caseOf: {
		[GLFW_OPENGL_CORE_PROFILE] -> [#core].
		[GLFW_OPENGL_COMPAT_PROFILE] -> [#compatibility].
		[GLFW_OPENGL_ANY_PROFILE] -> [nil] }
]

{
	#category : #'client api',
	#'squeak_changestamp' : 'stlu 2/12/2021 22:43'
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
	#'squeak_changestamp' : 'stlu 2/12/2021 22:44'
}
GLFWContext >> releaseBehavior [

	^ window getAttribute: GLFW_CONTEXT_RELEASE_BEHAVIOR
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 4/16/2021 14:07'
}
GLFWContext >> resolveFunctionAddress: functionName [

	| result |
	self assert: self = GL context.
	^ (result := GLFW getProcAddress: functionName) isNull ifFalse: [result getHandle]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 2/12/2021 22:45'
}
GLFWContext >> robustness [

	^ window getAttribute: GLFW_CONTEXT_ROBUSTNESS
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> shouldClose [

	^ window shouldClose
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> swapBuffers [

	window swapBuffers
]

{
	#category : #'context actions',
	#'squeak_changestamp' : 'stlu 10/19/2020 16:50'
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
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWContext >> window [

	^ window
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 10/19/2020 15:54'
}
GLFWContext >> window: aWindow [

	window := aWindow
]
