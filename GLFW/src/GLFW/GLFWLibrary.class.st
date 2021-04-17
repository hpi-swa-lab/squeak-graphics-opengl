"
3.3.3
"
Class {
	#name : #GLFWLibrary,
	#superclass : #ExternalLibrary,
	#instVars : [
		'callbacks',
		'contexts'
	],
	#classVars : [
		'ErrorMessages'
	],
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#commentStamp : 'stlu 2/12/2021 21:09'
}

{
	#category : #'class initialization',
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary class >> compileConstantAccessors [

	GLFWConstants classVarNames do: [:aSymbol |
		| selector source |
		selector := aSymbol allButFirst: 5.
		source := '{1}

	<generated>
	^ {2}' format: {
			selector.
			aSymbol asString.
		}.
		self compile: source classified: 'constants']
]

{
	#category : #'instance management',
	#timestamp : 'stlu 4/16/2021 14:42'
}
GLFWLibrary class >> example [
	" self example "
	| window context |
	window := GLFWWindow extent: 100 asPoint title: 'My pretty window'.
	window ifNil: [^ self error: 'GLFW Error'].
	context := window context.
	
	[context library makeCurrentDuring: [
		[window shouldClose] whileFalse: [
			GL clear: GL COLOR_BUFFER_BIT.
			"your OpenGL code here"
			context swapBuffers.
			GLFW pollEvents]]
	] ensure: [context destroy]
]

{
	#category : #examples,
	#timestamp : 'stlu 1/6/2021 14:00'
}
GLFWLibrary class >> example1 [ "self example1"
	"A minimal GLFW example window. Dismiss by clicking anywhere inside Squeak.
	Do NOT force quit the window (unless you want your Squeak to force quit too)."
	| window |
	window := GLFWWindow
					extent: 400 @ 400
					title: 'GLFW example1'.
	window ifNil: [^ self error: 'GLFW Error'].
	[[Sensor anyButtonPressed] whileFalse]
		ensure: [window destroy]
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 4/16/2021 11:10'
}
GLFWLibrary class >> initialize [

	Smalltalk addToShutDownList: self after: GLContext. "hard dependency on OpenGL"
	Smalltalk addToStartUpList: self.
	self initializeErrorMessages.
	self registerNewInstance.
	self startUp
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 4/16/2021 11:09'
}
GLFWLibrary class >> initializeErrorMessages [

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
	#category : #'instance management',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary class >> initializeInstance [

	Environment current
		at: #GLFW
		ifPresent: [:lib |
			[
				lib
					reset;
					init;
					hintGLAPI;
					hintAnyProfile
			] ifError: [self notify: 'Initialization of GLFW failed']]
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary class >> moduleName [

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
	#category : #'instance management',
	#timestamp : 'stlu 10/16/2020 12:06'
}
GLFWLibrary class >> registerNewInstance [

	Environment current at: #GLFW put: self new
]

{
	#category : #'system startup',
	#timestamp : 'stlu 11/12/2020 16:07'
}
GLFWLibrary class >> shutDown: quitting [

	quitting ifTrue: [self terminateInstance]
]

{
	#category : #'system startup',
	#timestamp : 'stlu 10/26/2020 19:51'
}
GLFWLibrary class >> startUp: resuming [

	resuming ifTrue: [self initializeInstance]
]

{
	#category : #'instance management',
	#timestamp : 'stlu 10/26/2020 19:51'
}
GLFWLibrary class >> terminateInstance [

	Environment current
		at: #GLFW
		ifPresent: [:lib |
			[lib terminate] ifError: [self notify: 'Termination of GLFW failed']]
]

{
	#category : #'instance management',
	#timestamp : 'stlu 10/26/2020 19:52'
}
GLFWLibrary class >> updateInstance [

	self terminateInstance.
	self registerNewInstance.
	self initializeInstance
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ACCUM_ALPHA_BITS [

	<generated>
	^ GLFW_ACCUM_ALPHA_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ACCUM_BLUE_BITS [

	<generated>
	^ GLFW_ACCUM_BLUE_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ACCUM_GREEN_BITS [

	<generated>
	^ GLFW_ACCUM_GREEN_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ACCUM_RED_BITS [

	<generated>
	^ GLFW_ACCUM_RED_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ALPHA_BITS [

	<generated>
	^ GLFW_ALPHA_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_D3D11 [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_D3D11
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_D3D9 [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_D3D9
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_METAL [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_METAL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_NONE [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_NONE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_OPENGL [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_OPENGL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_OPENGLES [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_OPENGLES
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANGLE_PLATFORM_TYPE_VULKAN [

	<generated>
	^ GLFW_ANGLE_PLATFORM_TYPE_VULKAN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ANY_RELEASE_BEHAVIOR [

	<generated>
	^ GLFW_ANY_RELEASE_BEHAVIOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> API_UNAVAILABLE [

	<generated>
	^ GLFW_API_UNAVAILABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ARROW_CURSOR [

	<generated>
	^ GLFW_ARROW_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> AUTO_ICONIFY [

	<generated>
	^ GLFW_AUTO_ICONIFY
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> AUX_BUFFERS [

	<generated>
	^ GLFW_AUX_BUFFERS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> BLUE_BITS [

	<generated>
	^ GLFW_BLUE_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CENTER_CURSOR [

	<generated>
	^ GLFW_CENTER_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CLIENT_API [

	<generated>
	^ GLFW_CLIENT_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> COCOA_CHDIR_RESOURCES [

	<generated>
	^ GLFW_COCOA_CHDIR_RESOURCES
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> COCOA_FRAME_NAME [

	<generated>
	^ GLFW_COCOA_FRAME_NAME
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> COCOA_GRAPHICS_SWITCHING [

	<generated>
	^ GLFW_COCOA_GRAPHICS_SWITCHING
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> COCOA_MENUBAR [

	<generated>
	^ GLFW_COCOA_MENUBAR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> COCOA_RETINA_FRAMEBUFFER [

	<generated>
	^ GLFW_COCOA_RETINA_FRAMEBUFFER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONNECTED [

	<generated>
	^ GLFW_CONNECTED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_CREATION_API [

	<generated>
	^ GLFW_CONTEXT_CREATION_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_DEBUG [

	<generated>
	^ GLFW_CONTEXT_DEBUG
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_NO_ERROR [

	<generated>
	^ GLFW_CONTEXT_NO_ERROR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_RELEASE_BEHAVIOR [

	<generated>
	^ GLFW_CONTEXT_RELEASE_BEHAVIOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_REVISION [

	<generated>
	^ GLFW_CONTEXT_REVISION
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_ROBUSTNESS [

	<generated>
	^ GLFW_CONTEXT_ROBUSTNESS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_VERSION_MAJOR [

	<generated>
	^ GLFW_CONTEXT_VERSION_MAJOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CONTEXT_VERSION_MINOR [

	<generated>
	^ GLFW_CONTEXT_VERSION_MINOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CROSSHAIR_CURSOR [

	<generated>
	^ GLFW_CROSSHAIR_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CURSOR [

	<generated>
	^ GLFW_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CURSOR_DISABLED [

	<generated>
	^ GLFW_CURSOR_DISABLED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CURSOR_HIDDEN [

	<generated>
	^ GLFW_CURSOR_HIDDEN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CURSOR_NORMAL [

	<generated>
	^ GLFW_CURSOR_NORMAL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> CURSOR_UNAVAILABLE [

	<generated>
	^ GLFW_CURSOR_UNAVAILABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> DECORATED [

	<generated>
	^ GLFW_DECORATED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> DEPTH_BITS [

	<generated>
	^ GLFW_DEPTH_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> DISCONNECTED [

	<generated>
	^ GLFW_DISCONNECTED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> DONT_CARE [

	<generated>
	^ GLFW_DONT_CARE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> DOUBLEBUFFER [

	<generated>
	^ GLFW_DOUBLEBUFFER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> EGL_CONTEXT_API [

	<generated>
	^ GLFW_EGL_CONTEXT_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FEATURE_UNAVAILABLE [

	<generated>
	^ GLFW_FEATURE_UNAVAILABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FEATURE_UNIMPLEMENTED [

	<generated>
	^ GLFW_FEATURE_UNIMPLEMENTED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FLOATING [

	<generated>
	^ GLFW_FLOATING
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FOCUSED [

	<generated>
	^ GLFW_FOCUSED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FOCUS_ON_SHOW [

	<generated>
	^ GLFW_FOCUS_ON_SHOW
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> FORMAT_UNAVAILABLE [

	<generated>
	^ GLFW_FORMAT_UNAVAILABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_LAST [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LAST
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_LEFT_TRIGGER [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_TRIGGER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_LEFT_X [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_X
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_LEFT_Y [

	<generated>
	^ GLFW_GAMEPAD_AXIS_LEFT_Y
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_RIGHT_TRIGGER [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_RIGHT_X [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_X
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_AXIS_RIGHT_Y [

	<generated>
	^ GLFW_GAMEPAD_AXIS_RIGHT_Y
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_A [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_A
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_B [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_B
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_BACK [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_BACK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_CIRCLE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_CIRCLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_CROSS [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_CROSS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_DPAD_DOWN [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_DPAD_LEFT [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_LEFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_DPAD_RIGHT [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_RIGHT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_DPAD_UP [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_DPAD_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_GUIDE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_GUIDE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_LAST [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LAST
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_LEFT_BUMPER [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LEFT_BUMPER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_LEFT_THUMB [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_LEFT_THUMB
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_RIGHT_BUMPER [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_RIGHT_THUMB [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_RIGHT_THUMB
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_SQUARE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_SQUARE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_START [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_START
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_TRIANGLE [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_TRIANGLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_X [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_X
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GAMEPAD_BUTTON_Y [

	<generated>
	^ GLFW_GAMEPAD_BUTTON_Y
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> GREEN_BITS [

	<generated>
	^ GLFW_GREEN_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAND_CURSOR [

	<generated>
	^ GLFW_HAND_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_CENTERED [

	<generated>
	^ GLFW_HAT_CENTERED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_DOWN [

	<generated>
	^ GLFW_HAT_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_LEFT [

	<generated>
	^ GLFW_HAT_LEFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_LEFT_DOWN [

	<generated>
	^ GLFW_HAT_LEFT_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_LEFT_UP [

	<generated>
	^ GLFW_HAT_LEFT_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_RIGHT [

	<generated>
	^ GLFW_HAT_RIGHT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_RIGHT_DOWN [

	<generated>
	^ GLFW_HAT_RIGHT_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_RIGHT_UP [

	<generated>
	^ GLFW_HAT_RIGHT_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HAT_UP [

	<generated>
	^ GLFW_HAT_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HOVERED [

	<generated>
	^ GLFW_HOVERED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> HRESIZE_CURSOR [

	<generated>
	^ GLFW_HRESIZE_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> IBEAM_CURSOR [

	<generated>
	^ GLFW_IBEAM_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> ICONIFIED [

	<generated>
	^ GLFW_ICONIFIED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> INVALID_ENUM [

	<generated>
	^ GLFW_INVALID_ENUM
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> INVALID_VALUE [

	<generated>
	^ GLFW_INVALID_VALUE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_1 [

	<generated>
	^ GLFW_JOYSTICK_1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_10 [

	<generated>
	^ GLFW_JOYSTICK_10
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_11 [

	<generated>
	^ GLFW_JOYSTICK_11
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_12 [

	<generated>
	^ GLFW_JOYSTICK_12
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_13 [

	<generated>
	^ GLFW_JOYSTICK_13
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_14 [

	<generated>
	^ GLFW_JOYSTICK_14
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_15 [

	<generated>
	^ GLFW_JOYSTICK_15
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_16 [

	<generated>
	^ GLFW_JOYSTICK_16
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_2 [

	<generated>
	^ GLFW_JOYSTICK_2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_3 [

	<generated>
	^ GLFW_JOYSTICK_3
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_4 [

	<generated>
	^ GLFW_JOYSTICK_4
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_5 [

	<generated>
	^ GLFW_JOYSTICK_5
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_6 [

	<generated>
	^ GLFW_JOYSTICK_6
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_7 [

	<generated>
	^ GLFW_JOYSTICK_7
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_8 [

	<generated>
	^ GLFW_JOYSTICK_8
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_9 [

	<generated>
	^ GLFW_JOYSTICK_9
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_HAT_BUTTONS [

	<generated>
	^ GLFW_JOYSTICK_HAT_BUTTONS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> JOYSTICK_LAST [

	<generated>
	^ GLFW_JOYSTICK_LAST
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_0 [

	<generated>
	^ GLFW_KEY_0
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_1 [

	<generated>
	^ GLFW_KEY_1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_2 [

	<generated>
	^ GLFW_KEY_2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_3 [

	<generated>
	^ GLFW_KEY_3
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_4 [

	<generated>
	^ GLFW_KEY_4
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_5 [

	<generated>
	^ GLFW_KEY_5
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_6 [

	<generated>
	^ GLFW_KEY_6
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_7 [

	<generated>
	^ GLFW_KEY_7
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_8 [

	<generated>
	^ GLFW_KEY_8
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_9 [

	<generated>
	^ GLFW_KEY_9
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_A [

	<generated>
	^ GLFW_KEY_A
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_APOSTROPHE [

	<generated>
	^ GLFW_KEY_APOSTROPHE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_B [

	<generated>
	^ GLFW_KEY_B
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_BACKSLASH [

	<generated>
	^ GLFW_KEY_BACKSLASH
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_BACKSPACE [

	<generated>
	^ GLFW_KEY_BACKSPACE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_C [

	<generated>
	^ GLFW_KEY_C
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_CAPS_LOCK [

	<generated>
	^ GLFW_KEY_CAPS_LOCK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_COMMA [

	<generated>
	^ GLFW_KEY_COMMA
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_D [

	<generated>
	^ GLFW_KEY_D
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_DELETE [

	<generated>
	^ GLFW_KEY_DELETE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_DOWN [

	<generated>
	^ GLFW_KEY_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_E [

	<generated>
	^ GLFW_KEY_E
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_END [

	<generated>
	^ GLFW_KEY_END
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_ENTER [

	<generated>
	^ GLFW_KEY_ENTER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_EQUAL [

	<generated>
	^ GLFW_KEY_EQUAL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_ESCAPE [

	<generated>
	^ GLFW_KEY_ESCAPE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F [

	<generated>
	^ GLFW_KEY_F
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F1 [

	<generated>
	^ GLFW_KEY_F1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F10 [

	<generated>
	^ GLFW_KEY_F10
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F11 [

	<generated>
	^ GLFW_KEY_F11
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F12 [

	<generated>
	^ GLFW_KEY_F12
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F13 [

	<generated>
	^ GLFW_KEY_F13
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F14 [

	<generated>
	^ GLFW_KEY_F14
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F15 [

	<generated>
	^ GLFW_KEY_F15
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F16 [

	<generated>
	^ GLFW_KEY_F16
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F17 [

	<generated>
	^ GLFW_KEY_F17
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F18 [

	<generated>
	^ GLFW_KEY_F18
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F19 [

	<generated>
	^ GLFW_KEY_F19
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F2 [

	<generated>
	^ GLFW_KEY_F2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F20 [

	<generated>
	^ GLFW_KEY_F20
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F21 [

	<generated>
	^ GLFW_KEY_F21
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F22 [

	<generated>
	^ GLFW_KEY_F22
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F23 [

	<generated>
	^ GLFW_KEY_F23
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F24 [

	<generated>
	^ GLFW_KEY_F24
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F25 [

	<generated>
	^ GLFW_KEY_F25
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F3 [

	<generated>
	^ GLFW_KEY_F3
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F4 [

	<generated>
	^ GLFW_KEY_F4
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F5 [

	<generated>
	^ GLFW_KEY_F5
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F6 [

	<generated>
	^ GLFW_KEY_F6
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F7 [

	<generated>
	^ GLFW_KEY_F7
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F8 [

	<generated>
	^ GLFW_KEY_F8
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_F9 [

	<generated>
	^ GLFW_KEY_F9
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_G [

	<generated>
	^ GLFW_KEY_G
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_GRAVE_ACCENT [

	<generated>
	^ GLFW_KEY_GRAVE_ACCENT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_H [

	<generated>
	^ GLFW_KEY_H
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_HOME [

	<generated>
	^ GLFW_KEY_HOME
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_I [

	<generated>
	^ GLFW_KEY_I
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_INSERT [

	<generated>
	^ GLFW_KEY_INSERT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_J [

	<generated>
	^ GLFW_KEY_J
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_K [

	<generated>
	^ GLFW_KEY_K
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_0 [

	<generated>
	^ GLFW_KEY_KP_0
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_1 [

	<generated>
	^ GLFW_KEY_KP_1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_2 [

	<generated>
	^ GLFW_KEY_KP_2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_3 [

	<generated>
	^ GLFW_KEY_KP_3
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_4 [

	<generated>
	^ GLFW_KEY_KP_4
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_5 [

	<generated>
	^ GLFW_KEY_KP_5
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_6 [

	<generated>
	^ GLFW_KEY_KP_6
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_7 [

	<generated>
	^ GLFW_KEY_KP_7
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_8 [

	<generated>
	^ GLFW_KEY_KP_8
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_9 [

	<generated>
	^ GLFW_KEY_KP_9
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_ADD [

	<generated>
	^ GLFW_KEY_KP_ADD
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_DECIMAL [

	<generated>
	^ GLFW_KEY_KP_DECIMAL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_DIVIDE [

	<generated>
	^ GLFW_KEY_KP_DIVIDE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_ENTER [

	<generated>
	^ GLFW_KEY_KP_ENTER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_EQUAL [

	<generated>
	^ GLFW_KEY_KP_EQUAL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_MULTIPLY [

	<generated>
	^ GLFW_KEY_KP_MULTIPLY
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_KP_SUBTRACT [

	<generated>
	^ GLFW_KEY_KP_SUBTRACT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_L [

	<generated>
	^ GLFW_KEY_L
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LAST [

	<generated>
	^ GLFW_KEY_LAST
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT [

	<generated>
	^ GLFW_KEY_LEFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT_ALT [

	<generated>
	^ GLFW_KEY_LEFT_ALT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT_BRACKET [

	<generated>
	^ GLFW_KEY_LEFT_BRACKET
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT_CONTROL [

	<generated>
	^ GLFW_KEY_LEFT_CONTROL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT_SHIFT [

	<generated>
	^ GLFW_KEY_LEFT_SHIFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_LEFT_SUPER [

	<generated>
	^ GLFW_KEY_LEFT_SUPER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_M [

	<generated>
	^ GLFW_KEY_M
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_MENU [

	<generated>
	^ GLFW_KEY_MENU
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_MINUS [

	<generated>
	^ GLFW_KEY_MINUS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_N [

	<generated>
	^ GLFW_KEY_N
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_NUM_LOCK [

	<generated>
	^ GLFW_KEY_NUM_LOCK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_O [

	<generated>
	^ GLFW_KEY_O
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_P [

	<generated>
	^ GLFW_KEY_P
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_PAGE_DOWN [

	<generated>
	^ GLFW_KEY_PAGE_DOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_PAGE_UP [

	<generated>
	^ GLFW_KEY_PAGE_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_PAUSE [

	<generated>
	^ GLFW_KEY_PAUSE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_PERIOD [

	<generated>
	^ GLFW_KEY_PERIOD
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_PRINT_SCREEN [

	<generated>
	^ GLFW_KEY_PRINT_SCREEN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_Q [

	<generated>
	^ GLFW_KEY_Q
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_R [

	<generated>
	^ GLFW_KEY_R
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT [

	<generated>
	^ GLFW_KEY_RIGHT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT_ALT [

	<generated>
	^ GLFW_KEY_RIGHT_ALT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT_BRACKET [

	<generated>
	^ GLFW_KEY_RIGHT_BRACKET
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT_CONTROL [

	<generated>
	^ GLFW_KEY_RIGHT_CONTROL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT_SHIFT [

	<generated>
	^ GLFW_KEY_RIGHT_SHIFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_RIGHT_SUPER [

	<generated>
	^ GLFW_KEY_RIGHT_SUPER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_S [

	<generated>
	^ GLFW_KEY_S
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_SCROLL_LOCK [

	<generated>
	^ GLFW_KEY_SCROLL_LOCK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_SEMICOLON [

	<generated>
	^ GLFW_KEY_SEMICOLON
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_SLASH [

	<generated>
	^ GLFW_KEY_SLASH
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_SPACE [

	<generated>
	^ GLFW_KEY_SPACE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_T [

	<generated>
	^ GLFW_KEY_T
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_TAB [

	<generated>
	^ GLFW_KEY_TAB
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_U [

	<generated>
	^ GLFW_KEY_U
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_UNKNOWN [

	<generated>
	^ GLFW_KEY_UNKNOWN
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_UP [

	<generated>
	^ GLFW_KEY_UP
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_V [

	<generated>
	^ GLFW_KEY_V
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_W [

	<generated>
	^ GLFW_KEY_W
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_WORLD_1 [

	<generated>
	^ GLFW_KEY_WORLD_1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_WORLD_2 [

	<generated>
	^ GLFW_KEY_WORLD_2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_X [

	<generated>
	^ GLFW_KEY_X
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_Y [

	<generated>
	^ GLFW_KEY_Y
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> KEY_Z [

	<generated>
	^ GLFW_KEY_Z
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> LOCK_KEY_MODS [

	<generated>
	^ GLFW_LOCK_KEY_MODS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> LOSE_CONTEXT_ON_RESET [

	<generated>
	^ GLFW_LOSE_CONTEXT_ON_RESET
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MAXIMIZED [

	<generated>
	^ GLFW_MAXIMIZED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_ALT [

	<generated>
	^ GLFW_MOD_ALT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_CAPS_LOCK [

	<generated>
	^ GLFW_MOD_CAPS_LOCK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_CONTROL [

	<generated>
	^ GLFW_MOD_CONTROL
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_NUM_LOCK [

	<generated>
	^ GLFW_MOD_NUM_LOCK
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_SHIFT [

	<generated>
	^ GLFW_MOD_SHIFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOD_SUPER [

	<generated>
	^ GLFW_MOD_SUPER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_1 [

	<generated>
	^ GLFW_MOUSE_BUTTON_1
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_2 [

	<generated>
	^ GLFW_MOUSE_BUTTON_2
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_3 [

	<generated>
	^ GLFW_MOUSE_BUTTON_3
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_4 [

	<generated>
	^ GLFW_MOUSE_BUTTON_4
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_5 [

	<generated>
	^ GLFW_MOUSE_BUTTON_5
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_6 [

	<generated>
	^ GLFW_MOUSE_BUTTON_6
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_7 [

	<generated>
	^ GLFW_MOUSE_BUTTON_7
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_8 [

	<generated>
	^ GLFW_MOUSE_BUTTON_8
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_LAST [

	<generated>
	^ GLFW_MOUSE_BUTTON_LAST
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_LEFT [

	<generated>
	^ GLFW_MOUSE_BUTTON_LEFT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_MIDDLE [

	<generated>
	^ GLFW_MOUSE_BUTTON_MIDDLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_BUTTON_RIGHT [

	<generated>
	^ GLFW_MOUSE_BUTTON_RIGHT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> MOUSE_PASSTHROUGH [

	<generated>
	^ GLFW_MOUSE_PASSTHROUGH
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NATIVE_CONTEXT_API [

	<generated>
	^ GLFW_NATIVE_CONTEXT_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NOT_ALLOWED_CURSOR [

	<generated>
	^ GLFW_NOT_ALLOWED_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NOT_INITIALIZED [

	<generated>
	^ GLFW_NOT_INITIALIZED
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_API [

	<generated>
	^ GLFW_NO_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_CURRENT_CONTEXT [

	<generated>
	^ GLFW_NO_CURRENT_CONTEXT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_ERROR [

	<generated>
	^ GLFW_NO_ERROR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_RESET_NOTIFICATION [

	<generated>
	^ GLFW_NO_RESET_NOTIFICATION
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_ROBUSTNESS [

	<generated>
	^ GLFW_NO_ROBUSTNESS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> NO_WINDOW_CONTEXT [

	<generated>
	^ GLFW_NO_WINDOW_CONTEXT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_ANY_PROFILE [

	<generated>
	^ GLFW_OPENGL_ANY_PROFILE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_API [

	<generated>
	^ GLFW_OPENGL_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_COMPAT_PROFILE [

	<generated>
	^ GLFW_OPENGL_COMPAT_PROFILE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_CORE_PROFILE [

	<generated>
	^ GLFW_OPENGL_CORE_PROFILE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_DEBUG_CONTEXT [

	<generated>
	^ GLFW_OPENGL_DEBUG_CONTEXT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_ES_API [

	<generated>
	^ GLFW_OPENGL_ES_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_FORWARD_COMPAT [

	<generated>
	^ GLFW_OPENGL_FORWARD_COMPAT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OPENGL_PROFILE [

	<generated>
	^ GLFW_OPENGL_PROFILE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OSMESA_CONTEXT_API [

	<generated>
	^ GLFW_OSMESA_CONTEXT_API
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> OUT_OF_MEMORY [

	<generated>
	^ GLFW_OUT_OF_MEMORY
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> PLATFORM_ERROR [

	<generated>
	^ GLFW_PLATFORM_ERROR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> POINTING_HAND_CURSOR [

	<generated>
	^ GLFW_POINTING_HAND_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> PRESS [

	<generated>
	^ GLFW_PRESS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RAW_MOUSE_MOTION [

	<generated>
	^ GLFW_RAW_MOUSE_MOTION
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RED_BITS [

	<generated>
	^ GLFW_RED_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> REFRESH_RATE [

	<generated>
	^ GLFW_REFRESH_RATE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RELEASE [

	<generated>
	^ GLFW_RELEASE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RELEASE_BEHAVIOR_FLUSH [

	<generated>
	^ GLFW_RELEASE_BEHAVIOR_FLUSH
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RELEASE_BEHAVIOR_NONE [

	<generated>
	^ GLFW_RELEASE_BEHAVIOR_NONE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> REPEAT [

	<generated>
	^ GLFW_REPEAT
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZABLE [

	<generated>
	^ GLFW_RESIZABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZE_ALL_CURSOR [

	<generated>
	^ GLFW_RESIZE_ALL_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZE_EW_CURSOR [

	<generated>
	^ GLFW_RESIZE_EW_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZE_NESW_CURSOR [

	<generated>
	^ GLFW_RESIZE_NESW_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZE_NS_CURSOR [

	<generated>
	^ GLFW_RESIZE_NS_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> RESIZE_NWSE_CURSOR [

	<generated>
	^ GLFW_RESIZE_NWSE_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> SAMPLES [

	<generated>
	^ GLFW_SAMPLES
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> SCALE_TO_MONITOR [

	<generated>
	^ GLFW_SCALE_TO_MONITOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> SRGB_CAPABLE [

	<generated>
	^ GLFW_SRGB_CAPABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> STENCIL_BITS [

	<generated>
	^ GLFW_STENCIL_BITS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> STEREO [

	<generated>
	^ GLFW_STEREO
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> STICKY_KEYS [

	<generated>
	^ GLFW_STICKY_KEYS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> STICKY_MOUSE_BUTTONS [

	<generated>
	^ GLFW_STICKY_MOUSE_BUTTONS
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> TRANSPARENT_FRAMEBUFFER [

	<generated>
	^ GLFW_TRANSPARENT_FRAMEBUFFER
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> VERSION_UNAVAILABLE [

	<generated>
	^ GLFW_VERSION_UNAVAILABLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> VISIBLE [

	<generated>
	^ GLFW_VISIBLE
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> VRESIZE_CURSOR [

	<generated>
	^ GLFW_VRESIZE_CURSOR
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> WIN32_KEYBOARD_MENU [

	<generated>
	^ GLFW_WIN32_KEYBOARD_MENU
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> X11_CLASS_NAME [

	<generated>
	^ GLFW_X11_CLASS_NAME
]

{
	#category : #constants,
	#timestamp : 'stlu 2/12/2021 00:19'
}
GLFWLibrary >> X11_INSTANCE_NAME [

	<generated>
	^ GLFW_X11_INSTANCE_NAME
]

{
	#category : #callbacks,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> callbacksForWindow: aWindow [

	^ callbacks
		at: aWindow
		ifAbsentPut: [Dictionary new]
]

{
	#category : #helpers,
	#timestamp : 'stlu 4/14/2021 18:07'
}
GLFWLibrary >> checkForError [
	"Check for any GLFW errors, and raise an Error if any exist."
	| errorCode |
	errorCode := self getError.
	errorCode ~= GLFW_NO_ERROR ifTrue: [
		self error: (self messageForErrorCode: errorCode)]
]

{
	#category : #contexts,
	#timestamp : 'stlu 11/11/2020 14:15'
}
GLFWLibrary >> contextForWindow: aWindow [

	^ GLFWContext window: aWindow
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/11/2020 13:58'
}
GLFWLibrary >> contexts [

	^ contexts
]

{
	#category : #callbacks,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> createCallback: aBlock signature: aString named: aSymbol [

	^ self
		createCallback: aBlock
		signature: aString
		named: aSymbol
		forWindow: self
]

{
	#category : #callbacks,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> createCallback: aBlock signature: aString named: aSymbol forWindow: aWindow [

	^ (self callbacksForWindow: aWindow)
		at: aSymbol
		put: (FFICallback
				signature: aString
				block: aBlock)
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:43'
}
GLFWLibrary >> createCursor: window with: xpos with: ypos [

	<apicall: GLFWCursor* 'glfwCreateCursor' (GLFWImage* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:44'
}
GLFWLibrary >> createStandardCursor: shape [

	<apicall: GLFWCursor* 'glfwCreateStandardCursor' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> createWindow: width with: height with: title with: monitor with: share [

	<apicall: GLFWWindow* 'glfwCreateWindow' (int int string GLFWMonitor* GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#timestamp : 'stlu 2/12/2021 18:24'
}
GLFWLibrary >> createWindowSurface: instance with: window with: allocator with: surface [

	"<apicall: VkResult 'glfwCreateWindowSurface' (VkInstance GLFWWindow* VkAllocationCallbacks* VkSurfaceKHR*)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - window creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> defaultWindowHints [

	<apicall: void 'glfwDefaultWindowHints' ()>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:44'
}
GLFWLibrary >> destroyCursor: cursor [

	<apicall: void 'glfwDestroyCursor' (GLFWCursor*)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> destroyWindow: handle [

	<apicall: void 'glfwDestroyWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 2/12/2021 18:28'
}
GLFWLibrary >> extensionSupported: extension [

	<apicall: bool 'glfwExtensionSupported' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:05'
}
GLFWLibrary >> focusWindow: window [

	<apicall: void 'glfwFocusWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - clipboard',
	#timestamp : 'stlu 2/12/2021 18:13'
}
GLFWLibrary >> getClipboardString [

	^ self getClipboardString: nil
]

{
	#category : #'api - clipboard',
	#timestamp : 'stlu 2/12/2021 18:12'
}
GLFWLibrary >> getClipboardString: window [

	<apicall: string 'glfwGetClipboardString' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getCurrentContext [

	<apicall: GLFWWindow* 'glfwGetCurrentContext' ()>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:42'
}
GLFWLibrary >> getCursorPos: window with: xpos with: ypos [

	<apicall: void 'glfwGetCursorPos' (GLFWWindow* double* double*)>
	^ self externalCallFailed
]

{
	#category : #helpers,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getError [

	^ self getError: nil
]

{
	#category : #'api - init',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getError: stringOrNil [

	<apicall: int 'glfwGetError' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 20:34'
}
GLFWLibrary >> getFramebufferSize: window with: width with: height [

	<apicall: void 'glfwGetFramebufferSize' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:07'
}
GLFWLibrary >> getGamepadName: jid [

	<apicall: string 'glfwGetGamepadName' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:08'
}
GLFWLibrary >> getGamepadState: jid with: state [

	<apicall: int 'glfwGetGamepadState' (int GLFWGamepadState*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:42'
}
GLFWLibrary >> getGammaRamp: monitor [

	<apicall: GLFWGammaRamp* 'glfwGetGammaRamp' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/7/2021 15:10'
}
GLFWLibrary >> getInputMode: window with: mode [

	<apicall: int 'glfwGetInputMode' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#timestamp : 'stlu 2/12/2021 18:23'
}
GLFWLibrary >> getInstanceProcAddress: instance with: procname [

	"<apicall: GLFWVkProc* 'glfwGetInstanceProcAddress' (VkInstance string)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 17:56'
}
GLFWLibrary >> getJoystickAxes: jid with: count [

	<apicall: float* 'glfwGetJoystickAxes' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 17:58'
}
GLFWLibrary >> getJoystickButtons: jid with: count [

	<apicall: unsignedChar* 'glfwGetJoystickButtons' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:00'
}
GLFWLibrary >> getJoystickGUID: jid [

	<apicall: string 'glfwGetJoystickGUID' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 17:58'
}
GLFWLibrary >> getJoystickHats: jid with: count [

	<apicall: unsignedChar* 'glfwGetJoystickHats' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 17:59'
}
GLFWLibrary >> getJoystickName: jid [

	<apicall: string 'glfwGetJoystickName' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:01'
}
GLFWLibrary >> getJoystickUserPointer: jid [

	<apicall: void* 'glfwGetJoystickUserPointer' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getKey: window with: key [

	<apicall: int 'glfwGetKey' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/12/2021 02:36'
}
GLFWLibrary >> getKeyName: key with: scancode [

	<apicall: string 'glfwGetKeyName' (int int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/12/2021 02:36'
}
GLFWLibrary >> getKeyScancode: key [

	<apicall: string 'glfwGetKeyScancode' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:28'
}
GLFWLibrary >> getMonitorContentScale: monitor with: xscale with: yscale [

	<apicall: void 'glfwGetMonitorContentScale' (GLFWMonitor* float* float*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:29'
}
GLFWLibrary >> getMonitorName: monitor [

	<apicall: string 'glfwGetMonitorName' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:28'
}
GLFWLibrary >> getMonitorPhysicalSize: monitor with: widthMM with: heightMM [

	<apicall: void 'glfwGetMonitorPhysicalSize' (GLFWMonitor* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:25'
}
GLFWLibrary >> getMonitorPos: monitor with: xpos with: ypos [

	<apicall: void 'glfwGetMonitorPos' (GLFWMonitor* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:31'
}
GLFWLibrary >> getMonitorUserPointer: monitor [

	<apicall: void* 'glfwGetMonitorUserPointer' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:27'
}
GLFWLibrary >> getMonitorWorkarea: monitor with: xpos with: ypos with: width with: height [

	<apicall: void 'glfwGetMonitorWorkarea' (GLFWMonitor* int* int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:22'
}
GLFWLibrary >> getMonitors: count [

	<apicall: GLFWMonitor* 'glfwGetMonitors' (int*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:39'
}
GLFWLibrary >> getMouseButton: window with: button [

	<apicall: int 'glfwGetMouseButton' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#timestamp : 'stlu 2/12/2021 18:23'
}
GLFWLibrary >> getPhysicalDevicePresentationSupport: instance with: device with: queuefamily [

	"<apicall: int 'glfwGetPhysicalDevicePresentationSupport' (VkInstance VkPhysicalDevice unit32_t)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 18:58'
}
GLFWLibrary >> getPrimaryMonitor [

	<apicall: GLFWMonitor* 'glfwGetPrimaryMonitor' ()>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 2/12/2021 18:30'
}
GLFWLibrary >> getProcAddress: procname [

	<apicall: void* 'glfwGetProcAddress' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#timestamp : 'stlu 2/12/2021 16:17'
}
GLFWLibrary >> getRequiredInstanceExtensions: count [

	<apicall: string* 'glfwGetRequiredInstanceExtensions' (uint32_t)>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#timestamp : 'stlu 1/7/2021 11:55'
}
GLFWLibrary >> getTime [

	<apicall: double 'glfwGetTime' ()>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#timestamp : 'stlu 2/12/2021 18:26'
}
GLFWLibrary >> getTimerFrequency [

	<apicall: uint64_t 'glfwGetTimerFrequency' ()>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#timestamp : 'stlu 2/12/2021 18:25'
}
GLFWLibrary >> getTimerValue [

	<apicall: uint64_t 'glfwGetTimerValue' ()>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getVersion: major with: minor with: rev [

	<apicall: void 'glfwGetVersion' (int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> getVersionString [

	<apicall: char* 'glfwGetVersionString' ()>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:39'
}
GLFWLibrary >> getVideoMode: monitor [

	<apicall: GLFWVidMode* 'glfwGetVideoMode' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:38'
}
GLFWLibrary >> getVideoModes: monitor with: count [

	<apicall: GLFWVidMode* 'glfwGetVideoModes' (GLFWMonitor* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 2/12/2021 01:53'
}
GLFWLibrary >> getWindowAttrib: window with: attrib [

	<apicall: int 'glfwGetWindowAttrib' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 20:50'
}
GLFWLibrary >> getWindowContentScale: window with: xscale with: yscale [

	<apicall: void 'glfwGetWindowContentScale' (GLFWWindow* float* float*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 20:39'
}
GLFWLibrary >> getWindowFrameSize: window with: left with: top with: right with: bottom [

	<apicall: void 'glfwGetWindowFrameSize' (GLFWWindow* int* int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:32'
}
GLFWLibrary >> getWindowMonitor: window [

	<apicall: GLFWMonitor* 'glfwGetWindowMonitor' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 20:54'
}
GLFWLibrary >> getWindowOpacity: window [

	<apicall: float 'glfwGetWindowOpacity' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:12'
}
GLFWLibrary >> getWindowPos: window with: xpos with: ypos [

	<apicall: void 'glfwGetWindowPos' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:17'
}
GLFWLibrary >> getWindowSize: window with: width with: height [

	<apicall: void 'glfwGetWindowSize' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 2/12/2021 02:00'
}
GLFWLibrary >> getWindowUserPointer: window [

	<apicall: void* 'glfwGetWindowUserPointer' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:04'
}
GLFWLibrary >> hideWindow: window [

	<apicall: void 'glfwHideWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 00:46'
}
GLFWLibrary >> hintAnyProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_ANY_PROFILE
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 21:53'
}
GLFWLibrary >> hintClientAPI: apiEnum [

	self windowHint: GLFW_CLIENT_API with: apiEnum
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 00:47'
}
GLFWLibrary >> hintCompatibilityProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_COMPAT_PROFILE
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 00:47'
}
GLFWLibrary >> hintCoreProfile [

	self windowHint: GLFW_OPENGL_PROFILE with: GLFW_OPENGL_CORE_PROFILE
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 21:57'
}
GLFWLibrary >> hintGLAPI [

	self hintClientAPI: GLFW_OPENGL_API
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 21:57'
}
GLFWLibrary >> hintGLES1API [

	self hintClientAPI: GLFW_OPENGL_ES_API
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 21:57'
}
GLFWLibrary >> hintGLES2API [

	self hintClientAPI: GLFW_OPENGL_ES_API
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 00:45'
}
GLFWLibrary >> hintMajorVersion: anInteger [

	self windowHint: GLFW_CONTEXT_VERSION_MAJOR with: anInteger
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 00:47'
}
GLFWLibrary >> hintMinorVersion: anInteger [

	self windowHint: GLFW_CONTEXT_VERSION_MINOR with: anInteger
]

{
	#category : #helpers,
	#timestamp : 'stlu 2/12/2021 21:57'
}
GLFWLibrary >> hintNoAPI [

	self hintClientAPI: GLFW_NO_API
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:04'
}
GLFWLibrary >> iconifyWindow: window [

	<apicall: void 'glfwIconifyWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#timestamp : 'stlu 10/19/2020 16:34'
}
GLFWLibrary >> init [

	<apicall: bool 'glfwInit' ()>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> initHint: hint with: value [

	<apicall: void 'glfwInitHint' (int int)>
	^ self externalCallFailed
]

{
	#category : #initialization,
	#timestamp : 'stlu 10/19/2020 16:32'
}
GLFWLibrary >> initialize [

	super initialize.
	self reset
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:02'
}
GLFWLibrary >> joystickIsGamepad: jid [

	<apicall: int 'glfwJoystickIsGamepad' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 17:56'
}
GLFWLibrary >> joystickPresent: jid [

	<apicall: int 'glfwJoystickPresent' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 10/26/2020 18:03'
}
GLFWLibrary >> makeContextCurrent: window [

	<apicall: void 'glfwMakeContextCurrent' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:04'
}
GLFWLibrary >> maximizeWindow: window [

	<apicall: void 'glfwMaximizeWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #helpers,
	#timestamp : 'stlu 4/14/2021 18:09'
}
GLFWLibrary >> messageForErrorCode: anInteger [

	^ ErrorMessages
		at: anInteger
		ifAbsent: ['Unknown error ' , anInteger asString]
]

{
	#category : #'api - events',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> pollEvents [

	<apicall: int 'glfwPollEvents' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#timestamp : 'stlu 2/12/2021 02:23'
}
GLFWLibrary >> postEmptyEvent [

	<apicall: void 'glfwPostEmptyEvent' ()>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:55'
}
GLFWLibrary >> privateSetCharCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCharCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:55'
}
GLFWLibrary >> privateSetCharModsCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCharModsCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:56'
}
GLFWLibrary >> privateSetCursorEnterCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCursorEnterCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:36'
}
GLFWLibrary >> privateSetCursorPosCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCursorPosCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:56'
}
GLFWLibrary >> privateSetDropCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetDropCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:36'
}
GLFWLibrary >> privateSetErrorCallback: anFFICallback [

	<apicall: void* 'glfwSetErrorCallback' (void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:36'
}
GLFWLibrary >> privateSetFramebufferSizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetFramebufferSizeCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 18:03'
}
GLFWLibrary >> privateSetJoystickCallback: anFFICallback [

	<apicall: void* 'glfwSetJoystickCallback' (void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:37'
}
GLFWLibrary >> privateSetKeyCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetKeyCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:37'
}
GLFWLibrary >> privateSetMonitorCallback: anFFICallback [

	<apicall: void* 'glfwSetMonitorCallback' (void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:56'
}
GLFWLibrary >> privateSetMouseButtonCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetMouseButtonCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 01:37'
}
GLFWLibrary >> privateSetScrollCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetScrollCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:11'
}
GLFWLibrary >> privateSetWindowCloseCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowCloseCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:17'
}
GLFWLibrary >> privateSetWindowContentScaleCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowContentScaleCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:14'
}
GLFWLibrary >> privateSetWindowFocusCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowFocusCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:16'
}
GLFWLibrary >> privateSetWindowIconifyCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowIconifyCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:16'
}
GLFWLibrary >> privateSetWindowMaximizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowMaximizeCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:04'
}
GLFWLibrary >> privateSetWindowPosCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowPosCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:12'
}
GLFWLibrary >> privateSetWindowRefreshCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowRefreshCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#timestamp : 'stlu 2/12/2021 02:07'
}
GLFWLibrary >> privateSetWindowSizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowSizeCallback' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/13/2021 00:12'
}
GLFWLibrary >> rawMouseMotionSupported [

	<apicall: bool 'glfwRawMouseMotionSupported' ()>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:05'
}
GLFWLibrary >> requestWindowAttention: window [

	<apicall: void 'glfwRequestWindowAttention' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/16/2021 17:24'
}
GLFWLibrary >> reset [

	callbacks := WeakKeyDictionary new.
	contexts := Dictionary new
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:04'
}
GLFWLibrary >> restoreWindow: window [

	<apicall: void 'glfwRestoreWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/12/2021 02:59'
}
GLFWLibrary >> setCharCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* uint)>'
						"GLFWwindow* window, unsigned int codepoint"
					named: #char
					forWindow: aWindow.
	self
		privateSetCharCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/12/2021 03:00'
}
GLFWLibrary >> setCharModsCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* uint int)>'
						"GLFWwindow* window, unsigned int codepoint, int mods"
					named: #charMods
					forWindow: aWindow.
	self
		privateSetCharModsCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - clipboard',
	#timestamp : 'stlu 2/12/2021 18:14'
}
GLFWLibrary >> setClipboardString: string [

	self setClipboardString: nil with: string
]

{
	#category : #'api - clipboard',
	#timestamp : 'stlu 2/12/2021 18:11'
}
GLFWLibrary >> setClipboardString: window with: string [

	<apicall: void 'glfwSetClipboardString' (GLFWWindow* string)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:46'
}
GLFWLibrary >> setCursor: window with: cursor [

	<apicall: void 'glfwSetCursor' (GLFWWindow* GLFWCursor*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 03:05'
}
GLFWLibrary >> setCursorEnterCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int)>'
						"GLFWwindow* window, int entered"
					named: #cursorEnter
					forWindow: aWindow.
	self
		privateSetCursorEnterCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 02:42'
}
GLFWLibrary >> setCursorPos: window with: xpos with: ypos [

	<apicall: void 'glfwSetCursorPos' (GLFWWindow* double double)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 03:03'
}
GLFWLibrary >> setCursorPosCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* double double)>'
						"GLFWwindow* window, double xpos, double ypos"
					named: #cursorPos
					forWindow: aWindow.
	self
		privateSetCursorPosCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 03:07'
}
GLFWLibrary >> setDropCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int string*)>'
						"GLFWwindow* window, int path_count, const char* paths[]"
					named: #drop
					forWindow: aWindow.
	self
		privateSetDropCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - init',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> setErrorCallback: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(int string)>'
					named: #error.
	self privateSetErrorCallback: callback thunk
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:34'
}
GLFWLibrary >> setFramebufferSizeCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int int)>'
						"GLFWwindow* window, int width, int height"
					named: #framebufferSize
					forWindow: aWindow.
	self
		privateSetFramebufferSizeCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:40'
}
GLFWLibrary >> setGamma: monitor with: gamma [

	<apicall: void 'glfwSetGamma' (GLFWMonitor* float)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:42'
}
GLFWLibrary >> setGammaRamp: monitor with: ramp [

	<apicall: void 'glfwSetGammaRamp' (GLFWMonitor* GLFWGammaRamp*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 2/1/2021 15:55'
}
GLFWLibrary >> setInputMode: window with: mode with: value [

	<apicall: void 'glfwSetInputMode' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:04'
}
GLFWLibrary >> setJoystickCallback: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(int int)>'
						"int jid, int event"
					named: #joystick.
	self privateSetJoystickCallback: callback thunk
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:01'
}
GLFWLibrary >> setJoystickUserPointer: jid with: pointer [

	<apicall: void 'glfwSetJoystickUserPointer' (int void*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#timestamp : 'stlu 1/7/2021 17:15'
}
GLFWLibrary >> setKeyCallback: aWindow with: aBlock [
	
	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int int int int)>'
						"GLFWwindow* window, int key, int scancode, int action, int mods"
					named: #key
					forWindow: aWindow.
	self
		privateSetKeyCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 19:47'
}
GLFWLibrary >> setMonitorCallback: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWMonitor* int)>'
						"GLFWmonitor* monitor, int event"
					named: #monitor.
	self privateSetMonitorCallback: callback thunk
]

{
	#category : #'api - monitors',
	#timestamp : 'stlu 2/12/2021 01:30'
}
GLFWLibrary >> setMonitorUserPointer: monitor with: pointer [

	<apicall: void 'glfwSetMonitorUserPointer' (GLFWMonitor* void*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 03:03'
}
GLFWLibrary >> setMouseButtonCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int int int)>'
						"GLFWwindow* window, int button, int action, int mods"
					named: #mouseButton
					forWindow: aWindow.
	self
		privateSetMouseButtonCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - mouse input',
	#timestamp : 'stlu 2/12/2021 03:05'
}
GLFWLibrary >> setScrollCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* double double)>'
						"GLFWwindow* window, double xoffset, double yoffset"
					named: #scroll
					forWindow: aWindow.
	self
		privateSetScrollCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - time',
	#timestamp : 'stlu 1/7/2021 11:55'
}
GLFWLibrary >> setTime: time [

	<apicall: void 'glfwSetTime' (double)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:24'
}
GLFWLibrary >> setWindowAspectRatio: window with: numer with: denom [

	<apicall: void 'glfwSetWindowAspectRatio' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 2/12/2021 01:58'
}
GLFWLibrary >> setWindowAttrib: window with: attrib with: value [

	<apicall: void 'glfwSetWindowAttrib' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:35'
}
GLFWLibrary >> setWindowCloseCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow*)>'
						"GLFWwindow* window"
					named: #windowClose
					forWindow: aWindow.
	self
		privateSetWindowCloseCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:35'
}
GLFWLibrary >> setWindowContentScaleCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* float float)>'
						"GLFWwindow* window, float xscale, float yscale"
					named: #windowContentScale
					forWindow: aWindow.
	self
		privateSetWindowContentScaleCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:37'
}
GLFWLibrary >> setWindowFocusCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int)>'
						"GLFWwindow* window, int focused"
					named: #windowFocus
					forWindow: aWindow.
	self
		privateSetWindowFocusCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 2/12/2021 20:24'
}
GLFWLibrary >> setWindowIcon: window with: count with: images [

	<apicall: void 'glfwSetWindowIcon' (GLFWWindow* int GLFWImage*)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:37'
}
GLFWLibrary >> setWindowIconifyCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int)>'
						"GLFWwindow* window, int iconified"
					named: #windowIconify
					forWindow: aWindow.
	self
		privateSetWindowIconifyCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:37'
}
GLFWLibrary >> setWindowMaximizeCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int)>'
						"GLFWwindow* window, int maximized"
					named: #windowMaximize
					forWindow: aWindow.
	self
		privateSetWindowMaximizeCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:38'
}
GLFWLibrary >> setWindowMonitor: window with: monitor with: xpos with: ypos with: width with: height with: refreshRate [

	<apicall: void 'glfwSetWindowMonitor' (GLFWWindow* GLFWMonitor* int int int int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 20:55'
}
GLFWLibrary >> setWindowOpacity: window with: opacity [

	<apicall: void 'glfwSetWindowOpacity' (GLFWWindow* float)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:15'
}
GLFWLibrary >> setWindowPos: window with: xpos with: ypos [

	<apicall: void 'glfwSetWindowPos' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:31'
}
GLFWLibrary >> setWindowPosCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int int)>'
						"GLFWwindow* window, int xpos, int ypos"
					named: #windowPos
					forWindow: aWindow.
	self
		privateSetWindowPosCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:32'
}
GLFWLibrary >> setWindowRefreshCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow*)>'
						"GLFWwindow* window"
					named: #windowRefresh
					forWindow: aWindow.
	self
		privateSetWindowRefreshCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> setWindowShouldClose: window with: value [

	<apicall: void 'glfwSetWindowShouldClose' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:18'
}
GLFWLibrary >> setWindowSize: window with: width with: height [

	<apicall: void 'glfwSetWindowSize' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#timestamp : 'stlu 2/12/2021 15:31'
}
GLFWLibrary >> setWindowSizeCallback: aWindow with: aBlock [

	| callback |
	callback := self
					createCallback: aBlock
					signature: '<callback: void (*)(GLFWWindow* int int)>'
						"GLFWwindow* window, int width, int height"
					named: #windowSize
					forWindow: aWindow.
	self
		privateSetWindowSizeCallback: aWindow
		with: callback thunk
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 14:21'
}
GLFWLibrary >> setWindowSizeLimits: window with: minWidth with: minHeight with: maxWidth with: maxHeight [

	<apicall: void 'glfwSetWindowSizeLimits' (GLFWWindow* int int int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> setWindowTitle: window with: title [

	<apicall: void 'glfwSetWindowTitle' (GLFWWindow* string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 2/12/2021 01:57'
}
GLFWLibrary >> setWindowUserPointer: window with: pointer [

	<apicall: void 'glfwSetWindowUserPointer' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 10/21/2020 21:04'
}
GLFWLibrary >> showWindow: window [

	<apicall: void 'glfwShowWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> swapBuffers: window [

	<apicall: void 'glfwSwapBuffers' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> swapInterval: aNumber [

	<apicall: void 'glfwSwapInterval' (int)>
	^ self externalCallFailed
]

{
	#category : #helpers,
	#timestamp : 'stlu 4/16/2021 10:31'
}
GLFWLibrary >> targetVersion: aGLVersion [

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
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> terminate [

	<apicall: void 'glfwTerminate' ()>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#timestamp : 'stlu 2/12/2021 18:06'
}
GLFWLibrary >> updateGamepadMappings: string [

	<apicall: int 'glfwUpdateGamepadMappings' (string*)>
	^ self externalCallFailed
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> version [

	| major minor revision |
	major := IntegerArray new: 1.
	minor := IntegerArray new: 1.
	revision := IntegerArray new: 1.
	self getVersion: major with: minor with: revision.
	^ { major first . minor first . revision first }
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> versionString [

	^ self getVersionString
]

{
	#category : #'api - vulkan',
	#timestamp : 'stlu 2/12/2021 16:15'
}
GLFWLibrary >> vulkanSupported [

	<apicall: bool 'glfwVulkanSupported' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#timestamp : 'stlu 2/12/2021 02:22'
}
GLFWLibrary >> waitEvents [

	<apicall: void 'glfwWaitEvents' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#timestamp : 'stlu 2/12/2021 02:23'
}
GLFWLibrary >> waitEventsTimeout: timeout [

	<apicall: void 'glfwWaitEventsTimeout' (double)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> windowHint: hint with: value [

	<apicall: void 'glfwWindowHint' (int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> windowHintString: hint with: value [

	<apicall: void 'glfwWindowHintString' (int string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#timestamp : 'stlu 11/13/2020 18:20'
}
GLFWLibrary >> windowShouldClose: window [

	<apicall: bool 'glfwWindowShouldClose' (GLFWWindow*)>
	^ self externalCallFailed
]
