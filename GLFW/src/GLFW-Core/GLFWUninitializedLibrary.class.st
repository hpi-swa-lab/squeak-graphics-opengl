"
3.3.x
"
Class {
	#name : #GLFWUninitializedLibrary,
	#superclass : #ExternalLibrary,
	#instVars : [
		'errorCallback',
		'callbacks',
		'contexts'
	],
	#classVars : [
		'ErrorMessages',
		'PrintableKeys'
	],
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#'squeak_changestamp' : 'stlu 4/21/2021 09:05'
}

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 6/25/2021 08:56'
}
GLFWUninitializedLibrary class >> compileConstantAccessors [

	GLFWConstants classVarNames do: [:aSymbol |
		| selector source |
		selector := aSymbol allButFirst: 5. "GLFW_"
		source := '{1}

	<generated>
	^ {2}' format: {
			selector.
			aSymbol asString.
		}.
		self compile: source classified: 'constants']
]

{
	#category : #examples,
	#'squeak_changestamp' : 'stlu 9/22/2021 17:35'
}
GLFWUninitializedLibrary class >> example1 [
	"
	self example1.
	"
	"A minimal GLFW example window. Dismiss by clicking anywhere inside Squeak.
	Do NOT force quit the window (unless you want your Squeak to force quit too)."
	| window |
	window := GLFWWindow
					extent: 400 @ 400
					title: 'GLFW example1'.
	window ifNil: [^ self error: 'GLFW Error'].
	[[Sensor anyButtonPressed] whileFalse]
		ensure: [window destroy].
]

{
	#category : #examples,
	#'squeak_changestamp' : 'stlu 9/22/2021 17:35'
}
GLFWUninitializedLibrary class >> example2 [
	"
	self example2.
	"
	"A minimal OpenGL example with GLFW."
	| window context |
	window := GLFWWindow
					extent: 400 @ 400
					title: 'GLFW example2'.
	window ifNil: [^ self error: 'GLFW Error'].
	context := window context.
	
	[context library makeCurrentDuring: [
		GL clearColor: Color red.
		[window shouldClose] whileFalse: [
			GL clear: GL COLOR_BUFFER_BIT.
			"your OpenGL code here"
			context swapBuffers.
			GLFW pollEvents]]
	] ensure: [context destroy].
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 9/17/2021 11:23'
}
GLFWUninitializedLibrary class >> initialize [

	GLFWConstants initialize.
	Smalltalk addToShutDownList: self "after: GLContext". "hard dependency on OpenGL"
	Smalltalk addToStartUpList: self.
	self initializeErrorMessages.
	self initializePrintableKeys.
	self registerNewInstance.
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 4/16/2021 11:09'
}
GLFWUninitializedLibrary class >> initializeErrorMessages [

	ErrorMessages := {
		GLFW_NO_ERROR -> 'No error. No error has occurred. Yay.'.
		GLFW_NOT_INITIALIZED -> 'Not initialized. A GLFW function was called that must not be called unless the library is initialized.'.
		GLFW_NO_CURRENT_CONTEXT -> 'No current context. A GLFW function was called that needs and operates on the current OpenGL or OpenGL ES context but no context is current on the calling thread.'.
		GLFW_INVALID_ENUM -> 'Invalid enum. One of the arguments to the function was an invalid enum value.'.
		GLFW_INVALID_VALUE -> 'Invalid value. One of the arguments to the function was an invalid value.'.
		GLFW_OUT_OF_MEMORY -> 'Out of memory. A memory allocation failed. A bug in GLFW or the underlying operating system.'.
		GLFW_API_UNAVAILABLE -> 'API unavailable. GLFW could not find support for the requested API on the system. The installed graphics driver does not support the requested API, or does not support it via the chosen context creation backend.'.
		GLFW_VERSION_UNAVAILABLE -> 'Version unavailable. The requested OpenGL or OpenGL ES version (including any requested context or framebuffer hints) is not available on this machine.'.
		GLFW_PLATFORM_ERROR -> 'Platform error. A platform-specific error occurred that does not match any of the more specific categories. A bug or configuration error in GLFW, the underlying operating system or its drivers, or a lack of required resources.'.
		GLFW_FORMAT_UNAVAILABLE -> 'Format unavailable. The requested format is not supported or available.'.
		GLFW_NO_WINDOW_CONTEXT -> 'No window context. A window that does not have an OpenGL or OpenGL ES context was passed to a function that requires it to have one.'.
		GLFW_CURSOR_UNAVAILABLE -> 'Cursor unavailable. The specified standard cursor shape is not available, either because the current system cursor theme does not provide it or because it is not available on the platform.'.
		GLFW_FEATURE_UNAVAILABLE -> 'Feature unavailable. The requested feature is not provided by the platform, so GLFW is unable to implement it.'.
		GLFW_FEATURE_UNIMPLEMENTED -> 'Feature unimplemented. The requested feature has not yet been implemented in GLFW for this platform.'
	} as: Dictionary
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 9/17/2021 11:23'
}
GLFWUninitializedLibrary class >> initializePrintableKeys [

	PrintableKeys := Set newFrom: {
		GLFW_KEY_APOSTROPHE.
		GLFW_KEY_COMMA.
		GLFW_KEY_MINUS.
		GLFW_KEY_PERIOD.
		GLFW_KEY_SLASH.
		GLFW_KEY_SEMICOLON.
		GLFW_KEY_EQUAL.
		GLFW_KEY_LEFT_BRACKET.
		GLFW_KEY_RIGHT_BRACKET.
		GLFW_KEY_BACKSLASH.
		GLFW_KEY_WORLD_1.
		GLFW_KEY_WORLD_2.
		GLFW_KEY_0.
		GLFW_KEY_1.
		GLFW_KEY_2.
		GLFW_KEY_3.
		GLFW_KEY_4.
		GLFW_KEY_5.
		GLFW_KEY_6.
		GLFW_KEY_7.
		GLFW_KEY_8.
		GLFW_KEY_9.
		GLFW_KEY_A.
		GLFW_KEY_B.
		GLFW_KEY_C.
		GLFW_KEY_D.
		GLFW_KEY_E.
		GLFW_KEY_F.
		GLFW_KEY_G.
		GLFW_KEY_H.
		GLFW_KEY_I.
		GLFW_KEY_J.
		GLFW_KEY_K.
		GLFW_KEY_L.
		GLFW_KEY_M.
		GLFW_KEY_N.
		GLFW_KEY_O.
		GLFW_KEY_P.
		GLFW_KEY_Q.
		GLFW_KEY_R.
		GLFW_KEY_S.
		GLFW_KEY_T.
		GLFW_KEY_U.
		GLFW_KEY_V.
		GLFW_KEY_W.
		GLFW_KEY_X.
		GLFW_KEY_Y.
		GLFW_KEY_Z.
		GLFW_KEY_KP_0.
		GLFW_KEY_KP_1.
		GLFW_KEY_KP_2.
		GLFW_KEY_KP_3.
		GLFW_KEY_KP_4.
		GLFW_KEY_KP_5.
		GLFW_KEY_KP_6.
		GLFW_KEY_KP_7.
		GLFW_KEY_KP_8.
		GLFW_KEY_KP_9.
		GLFW_KEY_KP_DECIMAL.
		GLFW_KEY_KP_DIVIDE.
		GLFW_KEY_KP_MULTIPLY.
		GLFW_KEY_KP_SUBTRACT.
		GLFW_KEY_KP_ADD.
		GLFW_KEY_KP_EQUAL.
	}.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 6/24/2021 16:16'
}
GLFWUninitializedLibrary class >> instance [

	^ Environment current
		at: #GLFW
		ifAbsentPut: [self newInstance]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary class >> moduleName [

	Smalltalk platformName = 'Win32' ifTrue: [
		^ 'glfw3.dll'].
	Smalltalk platformName = 'Mac OS' ifTrue:[
		^ Smalltalk osVersion asNumber < 1000 
			ifTrue: [self notYetImplemented]
			ifFalse:['glfw3.framework']].
	Smalltalk platformName = 'unix' ifTrue: [
		"default to X11 window system"
		^ Smalltalk osVersion = 'linux-gnu'
			ifTrue: ['libglfw.so']
			ifFalse: ['glfw3']].
	self error: 'Cannot identify platform'
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/24/2021 16:19'
}
GLFWUninitializedLibrary class >> newInstance [

	^ GLFWUninitializedLibrary new
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/24/2021 16:17'
}
GLFWUninitializedLibrary class >> registerNewInstance [

	^ Environment current
		at: #GLFW
		put: self newInstance
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:50'
}
GLFWUninitializedLibrary class >> shutDown: quitting [

	quitting ifTrue: [
		self instance terminate]
]

{
	#category : #'system startup',
	#'squeak_changestamp' : 'stlu 6/25/2021 09:03'
}
GLFWUninitializedLibrary class >> startUp: resuming [

	resuming ifTrue: [
		"in case no proper shutdown occurred:
		ensure all code still referencing and using the previous instance fails.
		avoids accidentally calling the FFI library with bogus memory references."
		self instance becomeForward: nil. "is nil good enough?"
		
		"we might have changed platform.
		create a new external library to properly init moduleName."
		self registerNewInstance.]
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ACCUM_ALPHA_BITS [

	<generated>
	^ GLFW_ACCUM_ALPHA_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ACCUM_BLUE_BITS [

	<generated>
	^ GLFW_ACCUM_BLUE_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ACCUM_GREEN_BITS [

	<generated>
	^ GLFW_ACCUM_GREEN_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ACCUM_RED_BITS [

	<generated>
	^ GLFW_ACCUM_RED_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ALPHA_BITS [

	<generated>
	^ GLFW_ALPHA_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_D3D11 [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_D3D11
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_D3D9 [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_D3D9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_METAL [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_METAL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_NONE [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_NONE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_OPENGL [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_OPENGL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_OPENGLES [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANGLE_PLATFORM_TYPE_VULKAN [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_VULKAN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ANY_RELEASE_BEHAVIOR [

	<generated>
	^ GLFW_ANY_RELEASE_BEHAVIOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> API_UNAVAILABLE [

	<generated>
	^ GLFW_API_UNAVAILABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ARROW_CURSOR [

	<generated>
	^ GLFW_ARROW_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> AUTO_ICONIFY [

	<generated>
	^ GLFW_AUTO_ICONIFY
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> AUX_BUFFERS [

	<generated>
	^ GLFW_AUX_BUFFERS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> BLUE_BITS [

	<generated>
	^ GLFW_BLUE_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CENTER_CURSOR [

	<generated>
	^ GLFW_CENTER_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CLIENT_API [

	<generated>
	^ GLFW_CLIENT_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> COCOA_CHDIR_RESOURCES [

	<generated>
	^ GLFW_COCOA_CHDIR_RESOURCES
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> COCOA_FRAME_NAME [

	<generated>
	^ GLFW_COCOA_FRAME_NAME
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> COCOA_GRAPHICS_SWITCHING [

	<generated>
	^ GLFW_COCOA_GRAPHICS_SWITCHING
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> COCOA_MENUBAR [

	<generated>
	^ GLFW_COCOA_MENUBAR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> COCOA_RETINA_FRAMEBUFFER [

	<generated>
	^ GLFW_COCOA_RETINA_FRAMEBUFFER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONNECTED [

	<generated>
	^ GLFW_CONNECTED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_CREATION_API [

	<generated>
	^ GLFW_CONTEXT_CREATION_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_DEBUG [

	<generated>
	^ GLFW_CONTEXT_DEBUG
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_NO_ERROR [

	<generated>
	^ GLFW_CONTEXT_NO_ERROR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_RELEASE_BEHAVIOR [

	<generated>
	^ GLFW_CONTEXT_RELEASE_BEHAVIOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_REVISION [

	<generated>
	^ GLFW_CONTEXT_REVISION
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_ROBUSTNESS [

	<generated>
	^ GLFW_CONTEXT_ROBUSTNESS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_VERSION_MAJOR [

	<generated>
	^ GLFW_CONTEXT_VERSION_MAJOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CONTEXT_VERSION_MINOR [

	<generated>
	^ GLFW_CONTEXT_VERSION_MINOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CROSSHAIR_CURSOR [

	<generated>
	^ GLFW_CROSSHAIR_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CURSOR [

	<generated>
	^ GLFW_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CURSOR_DISABLED [

	<generated>
	^ GLFW_CURSOR_DISABLED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CURSOR_HIDDEN [

	<generated>
	^ GLFW_CURSOR_HIDDEN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CURSOR_NORMAL [

	<generated>
	^ GLFW_CURSOR_NORMAL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> CURSOR_UNAVAILABLE [

	<generated>
	^ GLFW_CURSOR_UNAVAILABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> DECORATED [

	<generated>
	^ GLFW_DECORATED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> DEPTH_BITS [

	<generated>
	^ GLFW_DEPTH_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> DISCONNECTED [

	<generated>
	^ GLFW_DISCONNECTED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> DONT_CARE [

	<generated>
	^ GLFW_DONT_CARE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> DOUBLEBUFFER [

	<generated>
	^ GLFW_DOUBLEBUFFER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> EGL_CONTEXT_API [

	<generated>
	^ GLFW_EGL_CONTEXT_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FEATURE_UNAVAILABLE [

	<generated>
	^ GLFW_FEATURE_UNAVAILABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FEATURE_UNIMPLEMENTED [

	<generated>
	^ GLFW_FEATURE_UNIMPLEMENTED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FLOATING [

	<generated>
	^ GLFW_FLOATING
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FOCUSED [

	<generated>
	^ GLFW_FOCUSED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FOCUS_ON_SHOW [

	<generated>
	^ GLFW_FOCUS_ON_SHOW
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> FORMAT_UNAVAILABLE [

	<generated>
	^ GLFW_FORMAT_UNAVAILABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_LAST [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LAST
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_LEFT_TRIGGER [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_LEFT_X [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_X
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_LEFT_Y [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_Y
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_RIGHT_TRIGGER [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_RIGHT_X [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_X
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_AXIS_RIGHT_Y [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_Y
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_A [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_A
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_B [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_B
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_BACK [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_BACK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_CIRCLE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_CIRCLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_CROSS [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_CROSS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_DPAD_DOWN [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_DPAD_LEFT [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_LEFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_DPAD_RIGHT [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_DPAD_UP [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_GUIDE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_GUIDE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_LAST [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LAST
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_LEFT_BUMPER [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_LEFT_THUMB [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LEFT_THUMB
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_RIGHT_BUMPER [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_RIGHT_THUMB [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_SQUARE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_SQUARE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_START [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_START
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_TRIANGLE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_TRIANGLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_X [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_X
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GAMEPAD_BUTTON_Y [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_Y
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> GREEN_BITS [

	<generated>
	^ GLFW_GREEN_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAND_CURSOR [

	<generated>
	^ GLFW_HAND_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_CENTERED [

	<generated>
	^ GLFW_HAT_CENTERED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_DOWN [

	<generated>
	^ GLFW_HAT_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_LEFT [

	<generated>
	^ GLFW_HAT_LEFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_LEFT_DOWN [

	<generated>
	^ GLFW_HAT_LEFT_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_LEFT_UP [

	<generated>
	^ GLFW_HAT_LEFT_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_RIGHT [

	<generated>
	^ GLFW_HAT_RIGHT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_RIGHT_DOWN [

	<generated>
	^ GLFW_HAT_RIGHT_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_RIGHT_UP [

	<generated>
	^ GLFW_HAT_RIGHT_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HAT_UP [

	<generated>
	^ GLFW_HAT_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HOVERED [

	<generated>
	^ GLFW_HOVERED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> HRESIZE_CURSOR [

	<generated>
	^ GLFW_HRESIZE_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> IBEAM_CURSOR [

	<generated>
	^ GLFW_IBEAM_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> ICONIFIED [

	<generated>
	^ GLFW_ICONIFIED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> INVALID_ENUM [

	<generated>
	^ GLFW_INVALID_ENUM
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> INVALID_VALUE [

	<generated>
	^ GLFW_INVALID_VALUE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_1 [

	<generated>
	^ GLFW_JOYSTICK_1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_10 [

	<generated>
	^ GLFW_JOYSTICK_10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_11 [

	<generated>
	^ GLFW_JOYSTICK_11
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_12 [

	<generated>
	^ GLFW_JOYSTICK_12
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_13 [

	<generated>
	^ GLFW_JOYSTICK_13
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_14 [

	<generated>
	^ GLFW_JOYSTICK_14
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_15 [

	<generated>
	^ GLFW_JOYSTICK_15
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_16 [

	<generated>
	^ GLFW_JOYSTICK_16
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_2 [

	<generated>
	^ GLFW_JOYSTICK_2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_3 [

	<generated>
	^ GLFW_JOYSTICK_3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_4 [

	<generated>
	^ GLFW_JOYSTICK_4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_5 [

	<generated>
	^ GLFW_JOYSTICK_5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_6 [

	<generated>
	^ GLFW_JOYSTICK_6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_7 [

	<generated>
	^ GLFW_JOYSTICK_7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_8 [

	<generated>
	^ GLFW_JOYSTICK_8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_9 [

	<generated>
	^ GLFW_JOYSTICK_9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_HAT_BUTTONS [

	<generated>
	^ GLFW_JOYSTICK_HAT_BUTTONS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> JOYSTICK_LAST [

	<generated>
	^ GLFW_JOYSTICK_LAST
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_0 [

	<generated>
	^ GLFW_KEY_0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_1 [

	<generated>
	^ GLFW_KEY_1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_2 [

	<generated>
	^ GLFW_KEY_2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_3 [

	<generated>
	^ GLFW_KEY_3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_4 [

	<generated>
	^ GLFW_KEY_4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_5 [

	<generated>
	^ GLFW_KEY_5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_6 [

	<generated>
	^ GLFW_KEY_6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_7 [

	<generated>
	^ GLFW_KEY_7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_8 [

	<generated>
	^ GLFW_KEY_8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_9 [

	<generated>
	^ GLFW_KEY_9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_A [

	<generated>
	^ GLFW_KEY_A
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_APOSTROPHE [

	<generated>
	^ GLFW_KEY_APOSTROPHE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_B [

	<generated>
	^ GLFW_KEY_B
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_BACKSLASH [

	<generated>
	^ GLFW_KEY_BACKSLASH
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_BACKSPACE [

	<generated>
	^ GLFW_KEY_BACKSPACE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_C [

	<generated>
	^ GLFW_KEY_C
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_CAPS_LOCK [

	<generated>
	^ GLFW_KEY_CAPS_LOCK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_COMMA [

	<generated>
	^ GLFW_KEY_COMMA
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_D [

	<generated>
	^ GLFW_KEY_D
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_DELETE [

	<generated>
	^ GLFW_KEY_DELETE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_DOWN [

	<generated>
	^ GLFW_KEY_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_E [

	<generated>
	^ GLFW_KEY_E
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_END [

	<generated>
	^ GLFW_KEY_END
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_ENTER [

	<generated>
	^ GLFW_KEY_ENTER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_EQUAL [

	<generated>
	^ GLFW_KEY_EQUAL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_ESCAPE [

	<generated>
	^ GLFW_KEY_ESCAPE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F [

	<generated>
	^ GLFW_KEY_F
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F1 [

	<generated>
	^ GLFW_KEY_F1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F10 [

	<generated>
	^ GLFW_KEY_F10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F11 [

	<generated>
	^ GLFW_KEY_F11
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F12 [

	<generated>
	^ GLFW_KEY_F12
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F13 [

	<generated>
	^ GLFW_KEY_F13
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F14 [

	<generated>
	^ GLFW_KEY_F14
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F15 [

	<generated>
	^ GLFW_KEY_F15
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F16 [

	<generated>
	^ GLFW_KEY_F16
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F17 [

	<generated>
	^ GLFW_KEY_F17
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F18 [

	<generated>
	^ GLFW_KEY_F18
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F19 [

	<generated>
	^ GLFW_KEY_F19
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F2 [

	<generated>
	^ GLFW_KEY_F2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F20 [

	<generated>
	^ GLFW_KEY_F20
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F21 [

	<generated>
	^ GLFW_KEY_F21
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F22 [

	<generated>
	^ GLFW_KEY_F22
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F23 [

	<generated>
	^ GLFW_KEY_F23
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F24 [

	<generated>
	^ GLFW_KEY_F24
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F25 [

	<generated>
	^ GLFW_KEY_F25
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F3 [

	<generated>
	^ GLFW_KEY_F3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F4 [

	<generated>
	^ GLFW_KEY_F4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F5 [

	<generated>
	^ GLFW_KEY_F5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F6 [

	<generated>
	^ GLFW_KEY_F6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F7 [

	<generated>
	^ GLFW_KEY_F7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F8 [

	<generated>
	^ GLFW_KEY_F8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_F9 [

	<generated>
	^ GLFW_KEY_F9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_G [

	<generated>
	^ GLFW_KEY_G
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_GRAVE_ACCENT [

	<generated>
	^ GLFW_KEY_GRAVE_ACCENT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_H [

	<generated>
	^ GLFW_KEY_H
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_HOME [

	<generated>
	^ GLFW_KEY_HOME
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_I [

	<generated>
	^ GLFW_KEY_I
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_INSERT [

	<generated>
	^ GLFW_KEY_INSERT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_J [

	<generated>
	^ GLFW_KEY_J
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_K [

	<generated>
	^ GLFW_KEY_K
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_0 [

	<generated>
	^ GLFW_KEY_KP_0
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_1 [

	<generated>
	^ GLFW_KEY_KP_1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_2 [

	<generated>
	^ GLFW_KEY_KP_2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_3 [

	<generated>
	^ GLFW_KEY_KP_3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_4 [

	<generated>
	^ GLFW_KEY_KP_4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_5 [

	<generated>
	^ GLFW_KEY_KP_5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_6 [

	<generated>
	^ GLFW_KEY_KP_6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_7 [

	<generated>
	^ GLFW_KEY_KP_7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_8 [

	<generated>
	^ GLFW_KEY_KP_8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_9 [

	<generated>
	^ GLFW_KEY_KP_9
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_ADD [

	<generated>
	^ GLFW_KEY_KP_ADD
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_DECIMAL [

	<generated>
	^ GLFW_KEY_KP_DECIMAL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_DIVIDE [

	<generated>
	^ GLFW_KEY_KP_DIVIDE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_ENTER [

	<generated>
	^ GLFW_KEY_KP_ENTER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_EQUAL [

	<generated>
	^ GLFW_KEY_KP_EQUAL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_MULTIPLY [

	<generated>
	^ GLFW_KEY_KP_MULTIPLY
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_KP_SUBTRACT [

	<generated>
	^ GLFW_KEY_KP_SUBTRACT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_L [

	<generated>
	^ GLFW_KEY_L
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LAST [

	<generated>
	^ GLFW_KEY_LAST
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT [

	<generated>
	^ GLFW_KEY_LEFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT_ALT [

	<generated>
	^ GLFW_KEY_LEFT_ALT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT_BRACKET [

	<generated>
	^ GLFW_KEY_LEFT_BRACKET
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT_CONTROL [

	<generated>
	^ GLFW_KEY_LEFT_CONTROL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT_SHIFT [

	<generated>
	^ GLFW_KEY_LEFT_SHIFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_LEFT_SUPER [

	<generated>
	^ GLFW_KEY_LEFT_SUPER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_M [

	<generated>
	^ GLFW_KEY_M
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_MENU [

	<generated>
	^ GLFW_KEY_MENU
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_MINUS [

	<generated>
	^ GLFW_KEY_MINUS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_N [

	<generated>
	^ GLFW_KEY_N
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_NUM_LOCK [

	<generated>
	^ GLFW_KEY_NUM_LOCK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_O [

	<generated>
	^ GLFW_KEY_O
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_P [

	<generated>
	^ GLFW_KEY_P
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_PAGE_DOWN [

	<generated>
	^ GLFW_KEY_PAGE_DOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_PAGE_UP [

	<generated>
	^ GLFW_KEY_PAGE_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_PAUSE [

	<generated>
	^ GLFW_KEY_PAUSE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_PERIOD [

	<generated>
	^ GLFW_KEY_PERIOD
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_PRINT_SCREEN [

	<generated>
	^ GLFW_KEY_PRINT_SCREEN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_Q [

	<generated>
	^ GLFW_KEY_Q
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_R [

	<generated>
	^ GLFW_KEY_R
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT [

	<generated>
	^ GLFW_KEY_RIGHT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT_ALT [

	<generated>
	^ GLFW_KEY_RIGHT_ALT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT_BRACKET [

	<generated>
	^ GLFW_KEY_RIGHT_BRACKET
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT_CONTROL [

	<generated>
	^ GLFW_KEY_RIGHT_CONTROL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT_SHIFT [

	<generated>
	^ GLFW_KEY_RIGHT_SHIFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_RIGHT_SUPER [

	<generated>
	^ GLFW_KEY_RIGHT_SUPER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_S [

	<generated>
	^ GLFW_KEY_S
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_SCROLL_LOCK [

	<generated>
	^ GLFW_KEY_SCROLL_LOCK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_SEMICOLON [

	<generated>
	^ GLFW_KEY_SEMICOLON
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_SLASH [

	<generated>
	^ GLFW_KEY_SLASH
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_SPACE [

	<generated>
	^ GLFW_KEY_SPACE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_T [

	<generated>
	^ GLFW_KEY_T
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_TAB [

	<generated>
	^ GLFW_KEY_TAB
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_U [

	<generated>
	^ GLFW_KEY_U
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_UNKNOWN [

	<generated>
	^ GLFW_KEY_UNKNOWN
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_UP [

	<generated>
	^ GLFW_KEY_UP
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_V [

	<generated>
	^ GLFW_KEY_V
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_W [

	<generated>
	^ GLFW_KEY_W
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_WORLD_1 [

	<generated>
	^ GLFW_KEY_WORLD_1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_WORLD_2 [

	<generated>
	^ GLFW_KEY_WORLD_2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_X [

	<generated>
	^ GLFW_KEY_X
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_Y [

	<generated>
	^ GLFW_KEY_Y
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> KEY_Z [

	<generated>
	^ GLFW_KEY_Z
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> LOCK_KEY_MODS [

	<generated>
	^ GLFW_LOCK_KEY_MODS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> LOSE_CONTEXT_ON_RESET [

	<generated>
	^ GLFW_LOSE_CONTEXT_ON_RESET
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MAXIMIZED [

	<generated>
	^ GLFW_MAXIMIZED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_ALT [

	<generated>
	^ GLFW_MOD_ALT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_CAPS_LOCK [

	<generated>
	^ GLFW_MOD_CAPS_LOCK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_CONTROL [

	<generated>
	^ GLFW_MOD_CONTROL
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_NUM_LOCK [

	<generated>
	^ GLFW_MOD_NUM_LOCK
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_SHIFT [

	<generated>
	^ GLFW_MOD_SHIFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOD_SUPER [

	<generated>
	^ GLFW_MOD_SUPER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_1 [

	<generated>
	^ GLFW_MOUSE_BUTTON_1
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_2 [

	<generated>
	^ GLFW_MOUSE_BUTTON_2
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_3 [

	<generated>
	^ GLFW_MOUSE_BUTTON_3
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_4 [

	<generated>
	^ GLFW_MOUSE_BUTTON_4
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_5 [

	<generated>
	^ GLFW_MOUSE_BUTTON_5
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_6 [

	<generated>
	^ GLFW_MOUSE_BUTTON_6
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_7 [

	<generated>
	^ GLFW_MOUSE_BUTTON_7
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_8 [

	<generated>
	^ GLFW_MOUSE_BUTTON_8
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_LAST [

	<generated>
	^ GLFW_MOUSE_BUTTON_LAST
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_LEFT [

	<generated>
	^ GLFW_MOUSE_BUTTON_LEFT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_MIDDLE [

	<generated>
	^ GLFW_MOUSE_BUTTON_MIDDLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_BUTTON_RIGHT [

	<generated>
	^ GLFW_MOUSE_BUTTON_RIGHT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> MOUSE_PASSTHROUGH [

	<generated>
	^ GLFW_MOUSE_PASSTHROUGH
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NATIVE_CONTEXT_API [

	<generated>
	^ GLFW_NATIVE_CONTEXT_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NOT_ALLOWED_CURSOR [

	<generated>
	^ GLFW_NOT_ALLOWED_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NOT_INITIALIZED [

	<generated>
	^ GLFW_NOT_INITIALIZED
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_API [

	<generated>
	^ GLFW_NO_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_CURRENT_CONTEXT [

	<generated>
	^ GLFW_NO_CURRENT_CONTEXT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_ERROR [

	<generated>
	^ GLFW_NO_ERROR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_RESET_NOTIFICATION [

	<generated>
	^ GLFW_NO_RESET_NOTIFICATION
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_ROBUSTNESS [

	<generated>
	^ GLFW_NO_ROBUSTNESS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> NO_WINDOW_CONTEXT [

	<generated>
	^ GLFW_NO_WINDOW_CONTEXT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_ANY_PROFILE [

	<generated>
	^ GLFW_OPENGL_ANY_PROFILE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_API [

	<generated>
	^ GLFW_OPENGL_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_COMPAT_PROFILE [

	<generated>
	^ GLFW_OPENGL_COMPAT_PROFILE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_CORE_PROFILE [

	<generated>
	^ GLFW_OPENGL_CORE_PROFILE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_DEBUG_CONTEXT [

	<generated>
	^ GLFW_OPENGL_DEBUG_CONTEXT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_ES_API [

	<generated>
	^ GLFW_OPENGL_ES_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_FORWARD_COMPAT [

	<generated>
	^ GLFW_OPENGL_FORWARD_COMPAT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OPENGL_PROFILE [

	<generated>
	^ GLFW_OPENGL_PROFILE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OSMESA_CONTEXT_API [

	<generated>
	^ GLFW_OSMESA_CONTEXT_API
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> OUT_OF_MEMORY [

	<generated>
	^ GLFW_OUT_OF_MEMORY
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> PLATFORM_ERROR [

	<generated>
	^ GLFW_PLATFORM_ERROR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> POINTING_HAND_CURSOR [

	<generated>
	^ GLFW_POINTING_HAND_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> PRESS [

	<generated>
	^ GLFW_PRESS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RAW_MOUSE_MOTION [

	<generated>
	^ GLFW_RAW_MOUSE_MOTION
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RED_BITS [

	<generated>
	^ GLFW_RED_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> REFRESH_RATE [

	<generated>
	^ GLFW_REFRESH_RATE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RELEASE [

	<generated>
	^ GLFW_RELEASE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RELEASE_BEHAVIOR_FLUSH [

	<generated>
	^ GLFW_RELEASE_BEHAVIOR_FLUSH
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RELEASE_BEHAVIOR_NONE [

	<generated>
	^ GLFW_RELEASE_BEHAVIOR_NONE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> REPEAT [

	<generated>
	^ GLFW_REPEAT
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZABLE [

	<generated>
	^ GLFW_RESIZABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZE_ALL_CURSOR [

	<generated>
	^ GLFW_RESIZE_ALL_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZE_EW_CURSOR [

	<generated>
	^ GLFW_RESIZE_EW_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZE_NESW_CURSOR [

	<generated>
	^ GLFW_RESIZE_NESW_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZE_NS_CURSOR [

	<generated>
	^ GLFW_RESIZE_NS_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> RESIZE_NWSE_CURSOR [

	<generated>
	^ GLFW_RESIZE_NWSE_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> SAMPLES [

	<generated>
	^ GLFW_SAMPLES
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> SCALE_TO_MONITOR [

	<generated>
	^ GLFW_SCALE_TO_MONITOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> SRGB_CAPABLE [

	<generated>
	^ GLFW_SRGB_CAPABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> STENCIL_BITS [

	<generated>
	^ GLFW_STENCIL_BITS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> STEREO [

	<generated>
	^ GLFW_STEREO
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> STICKY_KEYS [

	<generated>
	^ GLFW_STICKY_KEYS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> STICKY_MOUSE_BUTTONS [

	<generated>
	^ GLFW_STICKY_MOUSE_BUTTONS
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> TRANSPARENT_FRAMEBUFFER [

	<generated>
	^ GLFW_TRANSPARENT_FRAMEBUFFER
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> VERSION_UNAVAILABLE [

	<generated>
	^ GLFW_VERSION_UNAVAILABLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> VISIBLE [

	<generated>
	^ GLFW_VISIBLE
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> VRESIZE_CURSOR [

	<generated>
	^ GLFW_VRESIZE_CURSOR
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> WIN32_KEYBOARD_MENU [

	<generated>
	^ GLFW_WIN32_KEYBOARD_MENU
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> X11_CLASS_NAME [

	<generated>
	^ GLFW_X11_CLASS_NAME
]

{
	#category : #constants,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:19'
}
GLFWUninitializedLibrary >> X11_INSTANCE_NAME [

	<generated>
	^ GLFW_X11_INSTANCE_NAME
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 8/28/2021 13:27'
}
GLFWUninitializedLibrary >> beInitializedLibrary [

	self changeClassTo: GLFWInitializedLibrary.
	callbacks := Dictionary new.
	contexts := Dictionary new.
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 4/21/2021 10:58'
}
GLFWUninitializedLibrary >> beUninitializedLibrary [

	"do nothing"
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 4/14/2021 18:07'
}
GLFWUninitializedLibrary >> checkForError [
	"Check for any GLFW errors, and raise an Error if any exist."
	| errorCode |
	errorCode := self getError.
	errorCode ~= GLFW_NO_ERROR ifTrue: [
		self error: (self messageForErrorCode: errorCode)]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> createCursor: window with: xpos with: ypos [

	self init ifTrue: [
		^ self createCursor: window with: xpos with: ypos]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> createStandardCursor: shape [

	self init ifTrue: [
		^ self createStandardCursor: shape]
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> createWindow: width with: height with: title with: monitor with: share [

	self init ifTrue: [
		^ self createWindow: width with: height with: title with: monitor with: share]
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> createWindowSurface: instance with: window with: allocator with: surface [

	self init ifTrue: [
		^ self createWindowSurface: instance with: window with: allocator with: surface]
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> defaultWindowHints [

	self init ifTrue: [
		^ self defaultWindowHints]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> destroyCursor: cursor [

	self init ifTrue: [
		^ self destroyCursor: cursor]
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> destroyWindow: handle [

	self init ifTrue: [
		^ self destroyWindow: handle]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> extensionSupported: extension [

	self init ifTrue: [
		^ self extensionSupported: extension]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> focusWindow: window [

	self init ifTrue: [
		^ self focusWindow: window]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 4/21/2021 10:13'
}
GLFWUninitializedLibrary >> getClipboardString [

	^ self getClipboardString: nil
]

{
	#category : #'api - clipboard',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getClipboardString: window [

	self init ifTrue: [
		^ self getClipboardString: window]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getCurrentContext [

	self init ifTrue: [
		^ self getCurrentContext]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getCursorPos: window with: xpos with: ypos [

	self init ifTrue: [
		^ self getCursorPos: window with: xpos with: ypos]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> getError [

	^ self getError: nil
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> getError: stringOrNil [

	<apicall: int 'glfwGetError' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getFramebufferSize: window with: width with: height [

	self init ifTrue: [
		^ self getFramebufferSize: window with: width with: height]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getGamepadName: jid [

	self init ifTrue: [
		^ self getGamepadName: jid]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getGamepadState: jid with: state [

	self init ifTrue: [
		^ self getGamepadState: jid with: state]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getGammaRamp: monitor [

	self init ifTrue: [
		^ self getGammaRamp: monitor]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getInputMode: window with: mode [

	self init ifTrue: [
		^ self getInputMode: window with: mode]
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getInstanceProcAddress: instance with: procname [

	self init ifTrue: [
		^ self getInstanceProcAddress: instance with: procname]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickAxes: jid with: count [

	self init ifTrue: [
		^ self getJoystickAxes: jid with: count]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickButtons: jid with: count [

	self init ifTrue: [
		^ self getJoystickButtons: jid with: count]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickGUID: jid [

	self init ifTrue: [
		^ self getJoystickGUID: jid]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickHats: jid with: count [

	self init ifTrue: [
		^ self getJoystickHats: jid with: count]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickName: jid [

	self init ifTrue: [
		^ self getJoystickName: jid]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getJoystickUserPointer: jid [

	self init ifTrue: [
		^ self getJoystickUserPointer: jid]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getKey: window with: key [

	self init ifTrue: [
		^ self getKey: window with: key]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getKeyName: key with: scancode [

	self init ifTrue: [
		^ self getKeyName: key with: scancode]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getKeyScancode: key [

	self init ifTrue: [
		^ self getKeyScancode: key]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorContentScale: monitor with: xscale with: yscale [

	self init ifTrue: [
		^ self getMonitorContentScale: monitor with: xscale with: yscale]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorName: monitor [

	self init ifTrue: [
		^ self getMonitorName: monitor]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorPhysicalSize: monitor with: widthMM with: heightMM [

	self init ifTrue: [
		^ self getMonitorPhysicalSize: monitor with: widthMM with: heightMM]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorPos: monitor with: xpos with: ypos [

	self init ifTrue: [
		^ self getMonitorPos: monitor with: xpos with: ypos]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorUserPointer: monitor [

	self init ifTrue: [
		^ self getMonitorUserPointer: monitor]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitorWorkarea: monitor with: xpos with: ypos with: width with: height [

	self init ifTrue: [
		^ self getMonitorWorkarea: monitor with: xpos with: ypos with: width with: height]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMonitors: count [

	self init ifTrue: [
		^ self getMonitors: count]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getMouseButton: window with: button [

	self init ifTrue: [
		^ self getMouseButton: window with: button]
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getPhysicalDevicePresentationSupport: instance with: device with: queuefamily [

	self init ifTrue: [
		^ self getPhysicalDevicePresentationSupport: instance with: device with: queuefamily]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getPrimaryMonitor [

	self init ifTrue: [
		^ self getPrimaryMonitor]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getProcAddress: procname [

	self init ifTrue: [
		^ self getProcAddress: procname]
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getRequiredInstanceExtensions: count [

	self init ifTrue: [
		^ self getRequiredInstanceExtensions: count]
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getTime [

	self init ifTrue: [
		^ self getTime]
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getTimerFrequency [

	self init ifTrue: [
		^ self getTimerFrequency]
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getTimerValue [

	self init ifTrue: [
		^ self getTimerValue]
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> getVersion: major with: minor with: rev [

	<apicall: void 'glfwGetVersion' (int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> getVersionString [

	<apicall: char* 'glfwGetVersionString' ()>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getVideoMode: monitor [

	self init ifTrue: [
		^ self getVideoMode: monitor]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getVideoModes: monitor with: count [

	self init ifTrue: [
		^ self getVideoModes: monitor with: count]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowAttrib: window with: attrib [

	self init ifTrue: [
		^ self getWindowAttrib: window with: attrib]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowContentScale: window with: xscale with: yscale [

	self init ifTrue: [
		^ self getWindowContentScale: window with: xscale with: yscale]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowFrameSize: window with: left with: top with: right with: bottom [

	self init ifTrue: [
		^ self getWindowFrameSize: window with: left with: top with: right with: bottom]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowMonitor: window [

	self init ifTrue: [
		^ self getWindowMonitor: window]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowOpacity: window [

	self init ifTrue: [
		^ self getWindowOpacity: window]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowPos: window with: xpos with: ypos [

	self init ifTrue: [
		^ self getWindowPos: window with: xpos with: ypos]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowSize: window with: width with: height [

	self init ifTrue: [
		^ self getWindowSize: window with: width with: height]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> getWindowUserPointer: window [

	self init ifTrue: [
		^ self getWindowUserPointer: window]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> hideWindow: window [

	self init ifTrue: [
		^ self hideWindow: window]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:46'
}
GLFWUninitializedLibrary >> hintAnyProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_ANY_PROFILE
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 21:53'
}
GLFWUninitializedLibrary >> hintClientAPI: apiEnum [

	self windowHint: GLFW_CLIENT_API with: apiEnum
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:47'
}
GLFWUninitializedLibrary >> hintCompatibilityProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_COMPAT_PROFILE
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:47'
}
GLFWUninitializedLibrary >> hintCoreProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_CORE_PROFILE
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 21:57'
}
GLFWUninitializedLibrary >> hintGLAPI [

	self hintClientAPI: GLFW_OPENGL_API
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 21:57'
}
GLFWUninitializedLibrary >> hintGLES1API [

	self hintClientAPI: GLFW_OPENGL_ES_API
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 21:57'
}
GLFWUninitializedLibrary >> hintGLES2API [

	self hintClientAPI: GLFW_OPENGL_ES_API
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:45'
}
GLFWUninitializedLibrary >> hintMajorVersion: anInteger [

	self windowHint: GLFW_CONTEXT_VERSION_MAJOR with: anInteger
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 00:47'
}
GLFWUninitializedLibrary >> hintMinorVersion: anInteger [

	self windowHint: GLFW_CONTEXT_VERSION_MINOR with: anInteger
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 2/12/2021 21:57'
}
GLFWUninitializedLibrary >> hintNoAPI [

	self hintClientAPI: GLFW_NO_API
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> iconifyWindow: window [

	self init ifTrue: [
		^ self iconifyWindow: window]
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:58'
}
GLFWUninitializedLibrary >> init [

	self privateInit ifFalse: [
		self checkForError.
		^ false].
	
	self beInitializedLibrary.
	^ true
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> initHint: hint with: value [

	<apicall: void 'glfwInitHint' (int int)>
	^ self externalCallFailed
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 9/17/2021 11:26'
}
GLFWUninitializedLibrary >> isPrintableKey: keyEnum [

	^ PrintableKeys includes: keyEnum
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> joystickIsGamepad: jid [

	self init ifTrue: [
		^ self joystickIsGamepad: jid]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> joystickPresent: jid [

	self init ifTrue: [
		^ self joystickPresent: jid]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> makeContextCurrent: window [

	self init ifTrue: [
		^ self makeContextCurrent: window]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> maximizeWindow: window [

	self init ifTrue: [
		^ self maximizeWindow: window]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 4/14/2021 18:09'
}
GLFWUninitializedLibrary >> messageForErrorCode: anInteger [

	^ ErrorMessages
		at: anInteger
		ifAbsent: ['Unknown error ' , anInteger asString]
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> pollEvents [

	self init ifTrue: [
		^ self pollEvents]
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> postEmptyEvent [

	self init ifTrue: [
		^ self postEmptyEvent]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 9/17/2021 11:28'
}
GLFWUninitializedLibrary >> printableKeys [

	^ PrintableKeys
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 4/21/2021 09:33'
}
GLFWUninitializedLibrary >> privateInit [

	<apicall: bool 'glfwInit' ()>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:36'
}
GLFWUninitializedLibrary >> privateSetErrorCallback: anFFICallback [

	<apicall: void* 'glfwSetErrorCallback' (FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> rawMouseMotionSupported [

	self init ifTrue: [
		^ self rawMouseMotionSupported]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> requestWindowAttention: window [

	self init ifTrue: [
		^ self requestWindowAttention: window]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> restoreWindow: window [

	self init ifTrue: [
		^ self restoreWindow: window]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCharCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setCharCallback: aWindow with: aBlock]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCharModsCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setCharModsCallback: aWindow with: aBlock]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 4/21/2021 10:13'
}
GLFWUninitializedLibrary >> setClipboardString: string [

	self setClipboardString: nil with: string
]

{
	#category : #'api - clipboard',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setClipboardString: window with: string [

	self init ifTrue: [
		^ self setClipboardString: window with: string]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCursor: window with: cursor [

	self init ifTrue: [
		^ self setCursor: window with: cursor]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCursorEnterCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setCursorEnterCallback: aWindow with: aBlock]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCursorPos: window with: xpos with: ypos [

	self init ifTrue: [
		^ self setCursorPos: window with: xpos with: ypos]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setCursorPosCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setCursorPosCallback: aWindow with: aBlock]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setDropCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setDropCallback: aWindow with: aBlock]
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 8/27/2021 14:43'
}
GLFWUninitializedLibrary >> setErrorCallback: aBlock [

	errorCallback := aBlock signature: '<callback: void (*)(int string)>'.
	self privateSetErrorCallback: errorCallback.
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setFramebufferSizeCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setFramebufferSizeCallback: aWindow with: aBlock]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setGamma: monitor with: gamma [

	self init ifTrue: [
		^ self setGamma: monitor with: gamma]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setGammaRamp: monitor with: ramp [

	self init ifTrue: [
		^ self setGammaRamp: monitor with: ramp]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setInputMode: window with: mode with: value [

	self init ifTrue: [
		^ self setInputMode: window with: mode with: value]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setJoystickCallback: aBlock [

	self init ifTrue: [
		^ self setJoystickCallback: aBlock]
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setJoystickUserPointer: jid with: pointer [

	self init ifTrue: [
		^ self setJoystickUserPointer: jid with: pointer]
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setKeyCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setKeyCallback: aWindow with: aBlock]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setMonitorCallback: aBlock [

	self init ifTrue: [
		^ self setMonitorCallback: aBlock]
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setMonitorUserPointer: monitor with: pointer [

	self init ifTrue: [
		^ self setMonitorUserPointer: monitor with: pointer]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setMouseButtonCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setMouseButtonCallback: aWindow with: aBlock]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setScrollCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setScrollCallback: aWindow with: aBlock]
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setTime: time [

	self init ifTrue: [
		^ self setTime: time]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowAspectRatio: window with: numer with: denom [

	self init ifTrue: [
		^ self setWindowAspectRatio: window with: numer with: denom]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowAttrib: window with: attrib with: value [

	self init ifTrue: [
		^ self setWindowAttrib: window with: attrib with: value]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowCloseCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowCloseCallback: aWindow with: aBlock]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowContentScaleCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowContentScaleCallback: aWindow with: aBlock]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowFocusCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowFocusCallback: aWindow with: aBlock]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowIcon: window with: count with: images [

	self init ifTrue: [
		^ self setWindowIcon: window with: count with: images]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowIconifyCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowIconifyCallback: aWindow with: aBlock]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowMaximizeCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowMaximizeCallback: aWindow with: aBlock]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowMonitor: window with: monitor with: xpos with: ypos with: width with: height with: refreshRate [

	self init ifTrue: [
		^ self setWindowMonitor: window with: monitor with: xpos with: ypos with: width with: height with: refreshRate]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowOpacity: window with: opacity [

	self init ifTrue: [
		^ self setWindowOpacity: window with: opacity]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowPos: window with: xpos with: ypos [

	self init ifTrue: [
		^ self setWindowPos: window with: xpos with: ypos]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowPosCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowPosCallback: aWindow with: aBlock]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowRefreshCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowRefreshCallback: aWindow with: aBlock]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowShouldClose: window with: value [

	self init ifTrue: [
		^ self setWindowShouldClose: window with: value]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowSize: window with: width with: height [

	self init ifTrue: [
		^ self setWindowSize: window with: width with: height]
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowSizeCallback: aWindow with: aBlock [

	self init ifTrue: [
		^ self setWindowSizeCallback: aWindow with: aBlock]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowSizeLimits: window with: minWidth with: minHeight with: maxWidth with: maxHeight [

	self init ifTrue: [
		^ self setWindowSizeLimits: window with: minWidth with: minHeight with: maxWidth with: maxHeight]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowTitle: window with: title [

	self init ifTrue: [
		^ self setWindowTitle: window with: title]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> setWindowUserPointer: window with: pointer [

	self init ifTrue: [
		^ self setWindowUserPointer: window with: pointer]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> showWindow: window [

	self init ifTrue: [
		^ self showWindow: window]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> swapBuffers: window [

	self init ifTrue: [
		^ self swapBuffers: window]
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> swapInterval: aNumber [

	self init ifTrue: [
		^ self swapInterval: aNumber]
]

{
	#category : #helpers,
	#'squeak_changestamp' : 'stlu 4/16/2021 10:31'
}
GLFWUninitializedLibrary >> targetVersion: aGLVersion [

	aGLVersion api caseOf: {
		[#gl] -> [self hintGLAPI].
		[#gles1] -> [self hintGLES1API].
		[#gles2] -> [self hintGLES2API]
	} otherwise: [^ self error: 'API not supported by GLFW'].
	
	self hintMajorVersion: aGLVersion major.
	self hintMinorVersion: aGLVersion minor.
	
	"If requesting an OpenGL version below 3.2, 'any profile' must be used."
	(aGLVersion api = #gl and: [aGLVersion asNumber < 32]) ifTrue: [
		^ self hintAnyProfile].
	
	aGLVersion profile caseOf: {
		[#core] -> [self hintCoreProfile].
		[#compatibility] -> [self hintCompatibilityProfile]
	} otherwise: [self hintAnyProfile].
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:14'
}
GLFWUninitializedLibrary >> terminate [

	"do nothing"
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> updateGamepadMappings: string [

	self init ifTrue: [
		^ self updateGamepadMappings: string]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> version [

	| major minor revision |
	major := IntegerArray new: 1.
	minor := IntegerArray new: 1.
	revision := IntegerArray new: 1.
	self getVersion: major with: minor with: revision.
	^ { major first . minor first . revision first }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWUninitializedLibrary >> versionString [

	^ self getVersionString
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> vulkanSupported [

	self init ifTrue: [
		^ self vulkanSupported]
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> waitEvents [

	self init ifTrue: [
		^ self waitEvents]
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> waitEventsTimeout: timeout [

	self init ifTrue: [
		^ self waitEventsTimeout: timeout]
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> windowHint: hint with: value [

	self init ifTrue: [
		^ self windowHint: hint with: value]
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> windowHintString: hint with: value [

	self init ifTrue: [
		^ self windowHintString: hint with: value]
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 4/21/2021 10:20'
}
GLFWUninitializedLibrary >> windowShouldClose: window [

	self init ifTrue: [
		^ self windowShouldClose: window]
]
