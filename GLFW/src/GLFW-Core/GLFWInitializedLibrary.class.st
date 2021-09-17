"
3.3.x
"
Class {
	#name : #GLFWInitializedLibrary,
	#superclass : #GLFWUninitializedLibrary,
	#category : #'GLFW-Core',
	#'squeak_changestamp' : '<historical>'
}

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 4/21/2021 10:58'
}
GLFWInitializedLibrary >> beInitializedLibrary [

	"do nothing"
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 4/21/2021 10:58'
}
GLFWInitializedLibrary >> beUninitializedLibrary [

	self changeClassTo: GLFWUninitializedLibrary.
	callbacks := nil.
	contexts := nil.
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> callbacksForWindow: aWindow [

	^ callbacks
		at: aWindow
		ifAbsentPut: [Dictionary new]
]

{
	#category : #contexts,
	#'squeak_changestamp' : 'stlu 11/11/2020 14:15'
}
GLFWInitializedLibrary >> contextForWindow: aWindow [

	^ GLFWContext window: aWindow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/11/2020 13:58'
}
GLFWInitializedLibrary >> contexts [

	^ contexts
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 8/28/2021 15:11'
}
GLFWInitializedLibrary >> createCallback: aBlockOrNil signature: aString named: aSymbol during: oneArgBlock [
	"for global callbacks"
	^ self
		createCallback: aBlockOrNil
		signature: aString
		named: aSymbol
		forWindow: self
		during: oneArgBlock
]

{
	#category : #callbacks,
	#'squeak_changestamp' : 'stlu 8/28/2021 15:08'
}
GLFWInitializedLibrary >> createCallback: callbackBlockOrNil signature: callbackSignature named: aSymbol forWindow: aWindow during: oneArgBlock [

	| windowCallbacks newCallback oldCallback |
	windowCallbacks := self callbacksForWindow: aWindow.
	oldCallback := windowCallbacks at: aSymbol ifAbsent: nil.
	newCallback := callbackBlockOrNil ifNotNil: [:block | block signature: callbackSignature].
	^ [oneArgBlock value: newCallback] ensure: [
		oldCallback ifNotNil: [oldCallback free].
		windowCallbacks at: aSymbol put: newCallback]
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:43'
}
GLFWInitializedLibrary >> createCursor: window with: xpos with: ypos [

	<apicall: GLFWCursor* 'glfwCreateCursor' (GLFWImage* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:44'
}
GLFWInitializedLibrary >> createStandardCursor: shape [

	<apicall: GLFWCursor* 'glfwCreateStandardCursor' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 8/28/2021 13:52'
}
GLFWInitializedLibrary >> createWindow: width with: height with: title with: monitor with: share [

	| window |
	window := self
		privateCreateWindow: width asInteger
		with: height asInteger
		with: title
		with: monitor
		with: share.
	window isNull ifTrue: [^ nil].
	^ window
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:24'
}
GLFWInitializedLibrary >> createWindowSurface: instance with: window with: allocator with: surface [

	"<apicall: VkResult 'glfwCreateWindowSurface' (VkInstance GLFWWindow* VkAllocationCallbacks* VkSurfaceKHR*)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> defaultWindowHints [

	<apicall: void 'glfwDefaultWindowHints' ()>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:44'
}
GLFWInitializedLibrary >> destroyCursor: cursor [

	<apicall: void 'glfwDestroyCursor' (GLFWCursor*)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 8/28/2021 13:36'
}
GLFWInitializedLibrary >> destroyWindow: aWindow [

	self privateDestroyWindow: aWindow.
	(callbacks removeKey: aWindow ifAbsent: nil) ifNotNil: [:windowCallbacks |
		windowCallbacks valuesDo: [:callback |
			callback free]].
	contexts removeKey: aWindow ifAbsent: nil.
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:28'
}
GLFWInitializedLibrary >> extensionSupported: extension [

	<apicall: bool 'glfwExtensionSupported' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:05'
}
GLFWInitializedLibrary >> focusWindow: window [

	<apicall: void 'glfwFocusWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - clipboard',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:12'
}
GLFWInitializedLibrary >> getClipboardString: window [

	<apicall: string 'glfwGetClipboardString' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> getCurrentContext [

	<apicall: GLFWWindow* 'glfwGetCurrentContext' ()>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:42'
}
GLFWInitializedLibrary >> getCursorPos: window with: xpos with: ypos [

	<apicall: void 'glfwGetCursorPos' (GLFWWindow* double* double*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 20:34'
}
GLFWInitializedLibrary >> getFramebufferSize: window with: width with: height [

	<apicall: void 'glfwGetFramebufferSize' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:07'
}
GLFWInitializedLibrary >> getGamepadName: jid [

	<apicall: string 'glfwGetGamepadName' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:08'
}
GLFWInitializedLibrary >> getGamepadState: jid with: state [

	<apicall: int 'glfwGetGamepadState' (int GLFWGamepadState*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:42'
}
GLFWInitializedLibrary >> getGammaRamp: monitor [

	<apicall: GLFWGammaRamp* 'glfwGetGammaRamp' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 2/7/2021 15:10'
}
GLFWInitializedLibrary >> getInputMode: window with: mode [

	<apicall: int 'glfwGetInputMode' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:23'
}
GLFWInitializedLibrary >> getInstanceProcAddress: instance with: procname [

	"<apicall: GLFWVkProc* 'glfwGetInstanceProcAddress' (VkInstance string)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 17:56'
}
GLFWInitializedLibrary >> getJoystickAxes: jid with: count [

	<apicall: float* 'glfwGetJoystickAxes' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 17:58'
}
GLFWInitializedLibrary >> getJoystickButtons: jid with: count [

	<apicall: unsignedChar* 'glfwGetJoystickButtons' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:00'
}
GLFWInitializedLibrary >> getJoystickGUID: jid [

	<apicall: string 'glfwGetJoystickGUID' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 17:58'
}
GLFWInitializedLibrary >> getJoystickHats: jid with: count [

	<apicall: unsignedChar* 'glfwGetJoystickHats' (int int*)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 17:59'
}
GLFWInitializedLibrary >> getJoystickName: jid [

	<apicall: string 'glfwGetJoystickName' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:01'
}
GLFWInitializedLibrary >> getJoystickUserPointer: jid [

	<apicall: void* 'glfwGetJoystickUserPointer' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> getKey: window with: key [

	<apicall: int 'glfwGetKey' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:36'
}
GLFWInitializedLibrary >> getKeyName: key with: scancode [

	<apicall: string 'glfwGetKeyName' (int int)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 9/17/2021 11:37'
}
GLFWInitializedLibrary >> getKeyScancode: key [

	<apicall: int 'glfwGetKeyScancode' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:28'
}
GLFWInitializedLibrary >> getMonitorContentScale: monitor with: xscale with: yscale [

	<apicall: void 'glfwGetMonitorContentScale' (GLFWMonitor* float* float*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:29'
}
GLFWInitializedLibrary >> getMonitorName: monitor [

	<apicall: string 'glfwGetMonitorName' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:28'
}
GLFWInitializedLibrary >> getMonitorPhysicalSize: monitor with: widthMM with: heightMM [

	<apicall: void 'glfwGetMonitorPhysicalSize' (GLFWMonitor* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:25'
}
GLFWInitializedLibrary >> getMonitorPos: monitor with: xpos with: ypos [

	<apicall: void 'glfwGetMonitorPos' (GLFWMonitor* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:31'
}
GLFWInitializedLibrary >> getMonitorUserPointer: monitor [

	<apicall: void* 'glfwGetMonitorUserPointer' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:27'
}
GLFWInitializedLibrary >> getMonitorWorkarea: monitor with: xpos with: ypos with: width with: height [

	<apicall: void 'glfwGetMonitorWorkarea' (GLFWMonitor* int* int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:22'
}
GLFWInitializedLibrary >> getMonitors: count [

	<apicall: GLFWMonitor* 'glfwGetMonitors' (int*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:39'
}
GLFWInitializedLibrary >> getMouseButton: window with: button [

	<apicall: int 'glfwGetMouseButton' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:23'
}
GLFWInitializedLibrary >> getPhysicalDevicePresentationSupport: instance with: device with: queuefamily [

	"<apicall: int 'glfwGetPhysicalDevicePresentationSupport' (VkInstance VkPhysicalDevice unit32_t)>
	^ self externalCallFailed"
	self notYetImplemented
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:58'
}
GLFWInitializedLibrary >> getPrimaryMonitor [

	<apicall: GLFWMonitor* 'glfwGetPrimaryMonitor' ()>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:30'
}
GLFWInitializedLibrary >> getProcAddress: procname [

	<apicall: void* 'glfwGetProcAddress' (string)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 2/12/2021 16:17'
}
GLFWInitializedLibrary >> getRequiredInstanceExtensions: count [

	<apicall: string* 'glfwGetRequiredInstanceExtensions' (uint32_t)>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 1/7/2021 11:55'
}
GLFWInitializedLibrary >> getTime [

	<apicall: double 'glfwGetTime' ()>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:26'
}
GLFWInitializedLibrary >> getTimerFrequency [

	<apicall: uint64_t 'glfwGetTimerFrequency' ()>
	^ self externalCallFailed
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:25'
}
GLFWInitializedLibrary >> getTimerValue [

	<apicall: uint64_t 'glfwGetTimerValue' ()>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:39'
}
GLFWInitializedLibrary >> getVideoMode: monitor [

	<apicall: GLFWVidMode* 'glfwGetVideoMode' (GLFWMonitor*)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:38'
}
GLFWInitializedLibrary >> getVideoModes: monitor with: count [

	<apicall: GLFWVidMode* 'glfwGetVideoModes' (GLFWMonitor* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:53'
}
GLFWInitializedLibrary >> getWindowAttrib: window with: attrib [

	<apicall: int 'glfwGetWindowAttrib' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 20:50'
}
GLFWInitializedLibrary >> getWindowContentScale: window with: xscale with: yscale [

	<apicall: void 'glfwGetWindowContentScale' (GLFWWindow* float* float*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 20:39'
}
GLFWInitializedLibrary >> getWindowFrameSize: window with: left with: top with: right with: bottom [

	<apicall: void 'glfwGetWindowFrameSize' (GLFWWindow* int* int* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:32'
}
GLFWInitializedLibrary >> getWindowMonitor: window [

	<apicall: GLFWMonitor* 'glfwGetWindowMonitor' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 20:54'
}
GLFWInitializedLibrary >> getWindowOpacity: window [

	<apicall: float 'glfwGetWindowOpacity' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:12'
}
GLFWInitializedLibrary >> getWindowPos: window with: xpos with: ypos [

	<apicall: void 'glfwGetWindowPos' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:17'
}
GLFWInitializedLibrary >> getWindowSize: window with: width with: height [

	<apicall: void 'glfwGetWindowSize' (GLFWWindow* int* int*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:00'
}
GLFWInitializedLibrary >> getWindowUserPointer: window [

	<apicall: void* 'glfwGetWindowUserPointer' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:04'
}
GLFWInitializedLibrary >> hideWindow: window [

	<apicall: void 'glfwHideWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:04'
}
GLFWInitializedLibrary >> iconifyWindow: window [

	<apicall: void 'glfwIconifyWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 4/21/2021 09:51'
}
GLFWInitializedLibrary >> init [

	^ true
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:02'
}
GLFWInitializedLibrary >> joystickIsGamepad: jid [

	<apicall: int 'glfwJoystickIsGamepad' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 17:56'
}
GLFWInitializedLibrary >> joystickPresent: jid [

	<apicall: int 'glfwJoystickPresent' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 10/26/2020 18:03'
}
GLFWInitializedLibrary >> makeContextCurrent: window [

	<apicall: void 'glfwMakeContextCurrent' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:04'
}
GLFWInitializedLibrary >> maximizeWindow: window [

	<apicall: void 'glfwMaximizeWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> pollEvents [

	<apicall: int 'glfwPollEvents' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:23'
}
GLFWInitializedLibrary >> postEmptyEvent [

	<apicall: void 'glfwPostEmptyEvent' ()>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 8/28/2021 13:47'
}
GLFWInitializedLibrary >> privateCreateWindow: width with: height with: title with: monitor with: share [

	<apicall: GLFWWindow* 'glfwCreateWindow' (int int string GLFWMonitor* GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 8/28/2021 13:23'
}
GLFWInitializedLibrary >> privateDestroyWindow: handle [

	<apicall: void 'glfwDestroyWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:36'
}
GLFWInitializedLibrary >> privateSetCharCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCharCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:36'
}
GLFWInitializedLibrary >> privateSetCharModsCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCharModsCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:36'
}
GLFWInitializedLibrary >> privateSetCursorEnterCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCursorEnterCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetCursorPosCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetCursorPosCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetDropCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetDropCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetFramebufferSizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetFramebufferSizeCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetJoystickCallback: anFFICallback [

	<apicall: void* 'glfwSetJoystickCallback' (FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetKeyCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetKeyCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetMonitorCallback: anFFICallback [

	<apicall: void* 'glfwSetMonitorCallback' (FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetMouseButtonCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetMouseButtonCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetScrollCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetScrollCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowCloseCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowCloseCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowContentScaleCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowContentScaleCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowFocusCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowFocusCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowIconifyCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowIconifyCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowMaximizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowMaximizeCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:37'
}
GLFWInitializedLibrary >> privateSetWindowPosCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowPosCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:38'
}
GLFWInitializedLibrary >> privateSetWindowRefreshCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowRefreshCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 6/6/2021 15:38'
}
GLFWInitializedLibrary >> privateSetWindowSizeCallback: aWindow with: anFFICallback [

	<apicall: void* 'glfwSetWindowSizeCallback' (GLFWWindow* FFICallback*)>
	^ self externalCallFailed
]

{
	#category : #private,
	#'squeak_changestamp' : 'stlu 4/21/2021 09:50'
}
GLFWInitializedLibrary >> privateTerminate [

	<apicall: void 'glfwTerminate' ()>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/13/2021 00:12'
}
GLFWInitializedLibrary >> rawMouseMotionSupported [

	<apicall: bool 'glfwRawMouseMotionSupported' ()>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:05'
}
GLFWInitializedLibrary >> requestWindowAttention: window [

	<apicall: void 'glfwRequestWindowAttention' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:04'
}
GLFWInitializedLibrary >> restoreWindow: window [

	<apicall: void 'glfwRestoreWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:08'
}
GLFWInitializedLibrary >> setCharCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* uint)>'
			"GLFWwindow* window, unsigned int codepoint"
		named: #char
		forWindow: aWindow
		during: [:callback |
			self privateSetCharCallback: aWindow with: callback].
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:08'
}
GLFWInitializedLibrary >> setCharModsCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* uint int)>'
			"GLFWwindow* window, unsigned int codepoint, int mods"
		named: #charMods
		forWindow: aWindow
		during: [:callback |
			self privateSetCharModsCallback: aWindow with: callback].
]

{
	#category : #'api - clipboard',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:11'
}
GLFWInitializedLibrary >> setClipboardString: window with: string [

	<apicall: void 'glfwSetClipboardString' (GLFWWindow* string)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:46'
}
GLFWInitializedLibrary >> setCursor: window with: cursor [

	<apicall: void 'glfwSetCursor' (GLFWWindow* GLFWCursor*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:08'
}
GLFWInitializedLibrary >> setCursorEnterCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int)>'
			"GLFWwindow* window, int entered"
		named: #cursorEnter
		forWindow: aWindow
		during: [:callback |
			self privateSetCursorEnterCallback: aWindow with: callback].
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:42'
}
GLFWInitializedLibrary >> setCursorPos: window with: xpos with: ypos [

	<apicall: void 'glfwSetCursorPos' (GLFWWindow* double double)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:08'
}
GLFWInitializedLibrary >> setCursorPosCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* double double)>'
			"GLFWwindow* window, double xpos, double ypos"
		named: #cursorPos
		forWindow: aWindow
		during: [:callback |
			self privateSetCursorPosCallback: aWindow with: callback].
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setDropCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int string*)>'
			"GLFWwindow* window, int path_count, const char* paths[]"
		named: #drop
		forWindow: aWindow
		during: [:callback |
			self privateSetDropCallback: aWindow with: callback].
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setFramebufferSizeCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int int)>'
			"GLFWwindow* window, int width, int height"
		named: #framebufferSize
		forWindow: aWindow
		during: [:callback |
			self privateSetFramebufferSizeCallback: aWindow with: callback].
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:40'
}
GLFWInitializedLibrary >> setGamma: monitor with: gamma [

	<apicall: void 'glfwSetGamma' (GLFWMonitor* float)>
	^ self externalCallFailed
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:42'
}
GLFWInitializedLibrary >> setGammaRamp: monitor with: ramp [

	<apicall: void 'glfwSetGammaRamp' (GLFWMonitor* GLFWGammaRamp*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 2/1/2021 15:55'
}
GLFWInitializedLibrary >> setInputMode: window with: mode with: value [

	<apicall: void 'glfwSetInputMode' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setJoystickCallback: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(int int)>'
			"int jid, int event"
		named: #joystick
		during: [:callback |
			self privateSetJoystickCallback: callback].
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:01'
}
GLFWInitializedLibrary >> setJoystickUserPointer: jid with: pointer [

	<apicall: void 'glfwSetJoystickUserPointer' (int void*)>
	^ self externalCallFailed
]

{
	#category : #'api - keyboard input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setKeyCallback: aWindow with: aBlockOrNil [
	
	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int int int int)>'
			"GLFWwindow* window, int key, int scancode, int action, int mods"
		named: #key
		forWindow: aWindow
		during: [:callback |
			self privateSetKeyCallback: aWindow with: callback].
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setMonitorCallback: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWMonitor* int)>'
			"GLFWmonitor* monitor, int event"
		named: #monitor
		during: [:callback |
			self privateSetMonitorCallback: callback].
]

{
	#category : #'api - monitors',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:30'
}
GLFWInitializedLibrary >> setMonitorUserPointer: monitor with: pointer [

	<apicall: void 'glfwSetMonitorUserPointer' (GLFWMonitor* void*)>
	^ self externalCallFailed
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:09'
}
GLFWInitializedLibrary >> setMouseButtonCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int int int)>'
			"GLFWwindow* window, int button, int action, int mods"
		named: #mouseButton
		forWindow: aWindow
		during: [:callback |
			self privateSetMouseButtonCallback: aWindow with: callback].
]

{
	#category : #'api - mouse input',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setScrollCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* double double)>'
			"GLFWwindow* window, double xoffset, double yoffset"
		named: #scroll
		forWindow: aWindow
		during: [:callback |
			self privateSetScrollCallback: aWindow with: callback].
]

{
	#category : #'api - time',
	#'squeak_changestamp' : 'stlu 1/7/2021 11:55'
}
GLFWInitializedLibrary >> setTime: time [

	<apicall: void 'glfwSetTime' (double)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:24'
}
GLFWInitializedLibrary >> setWindowAspectRatio: window with: numer with: denom [

	<apicall: void 'glfwSetWindowAspectRatio' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:58'
}
GLFWInitializedLibrary >> setWindowAttrib: window with: attrib with: value [

	<apicall: void 'glfwSetWindowAttrib' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowCloseCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow*)>'
			"GLFWwindow* window"
		named: #windowClose
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowCloseCallback: aWindow with: callback].
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowContentScaleCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* float float)>'
			"GLFWwindow* window, float xscale, float yscale"
		named: #windowContentScale
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowContentScaleCallback: aWindow with: callback].
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowFocusCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int)>'
			"GLFWwindow* window, int focused"
		named: #windowFocus
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowFocusCallback: aWindow with: callback].
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 2/12/2021 20:24'
}
GLFWInitializedLibrary >> setWindowIcon: window with: count with: images [

	<apicall: void 'glfwSetWindowIcon' (GLFWWindow* int GLFWImage*)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowIconifyCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int)>'
			"GLFWwindow* window, int iconified"
		named: #windowIconify
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowIconifyCallback: aWindow with: callback].
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowMaximizeCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int)>'
			"GLFWwindow* window, int maximized"
		named: #windowMaximize
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowMaximizeCallback: aWindow with: callback].
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:38'
}
GLFWInitializedLibrary >> setWindowMonitor: window with: monitor with: xpos with: ypos with: width with: height with: refreshRate [

	<apicall: void 'glfwSetWindowMonitor' (GLFWWindow* GLFWMonitor* int int int int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 20:55'
}
GLFWInitializedLibrary >> setWindowOpacity: window with: opacity [

	<apicall: void 'glfwSetWindowOpacity' (GLFWWindow* float)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:15'
}
GLFWInitializedLibrary >> setWindowPos: window with: xpos with: ypos [

	<apicall: void 'glfwSetWindowPos' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowPosCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int int)>'
			"GLFWwindow* window, int xpos, int ypos"
		named: #windowPos
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowPosCallback: aWindow with: callback].
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:10'
}
GLFWInitializedLibrary >> setWindowRefreshCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow*)>'
			"GLFWwindow* window"
		named: #windowRefresh
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowRefreshCallback: aWindow with: callback].
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> setWindowShouldClose: window with: value [

	<apicall: void 'glfwSetWindowShouldClose' (GLFWWindow* int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:18'
}
GLFWInitializedLibrary >> setWindowSize: window with: width with: height [

	<apicall: void 'glfwSetWindowSize' (GLFWWindow* int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window callbacks',
	#'squeak_changestamp' : 'stlu 8/28/2021 15:11'
}
GLFWInitializedLibrary >> setWindowSizeCallback: aWindow with: aBlockOrNil [

	self
		createCallback: aBlockOrNil
		signature: '<callback: void (*)(GLFWWindow* int int)>'
			"GLFWwindow* window, int width, int height"
		named: #windowSize
		forWindow: aWindow
		during: [:callback |
			self privateSetWindowSizeCallback: aWindow with: callback].
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 14:21'
}
GLFWInitializedLibrary >> setWindowSizeLimits: window with: minWidth with: minHeight with: maxWidth with: maxHeight [

	<apicall: void 'glfwSetWindowSizeLimits' (GLFWWindow* int int int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> setWindowTitle: window with: title [

	<apicall: void 'glfwSetWindowTitle' (GLFWWindow* string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 2/12/2021 01:57'
}
GLFWInitializedLibrary >> setWindowUserPointer: window with: pointer [

	<apicall: void 'glfwSetWindowUserPointer' (GLFWWindow* void*)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 10/21/2020 21:04'
}
GLFWInitializedLibrary >> showWindow: window [

	<apicall: void 'glfwShowWindow' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> swapBuffers: window [

	<apicall: void 'glfwSwapBuffers' (GLFWWindow*)>
	^ self externalCallFailed
]

{
	#category : #'api - contexts',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> swapInterval: aNumber [

	<apicall: void 'glfwSwapInterval' (int)>
	^ self externalCallFailed
]

{
	#category : #'api - init',
	#'squeak_changestamp' : 'stlu 8/28/2021 14:57'
}
GLFWInitializedLibrary >> terminate [

	self privateTerminate.
	callbacks valuesDo: [:windowCallbacks |
		windowCallbacks valuesDo: [:callback |
			callback free]].
	self beUninitializedLibrary.
]

{
	#category : #'api - joystick input',
	#'squeak_changestamp' : 'stlu 2/12/2021 18:06'
}
GLFWInitializedLibrary >> updateGamepadMappings: string [

	<apicall: int 'glfwUpdateGamepadMappings' (string*)>
	^ self externalCallFailed
]

{
	#category : #'api - vulkan',
	#'squeak_changestamp' : 'stlu 2/12/2021 16:15'
}
GLFWInitializedLibrary >> vulkanSupported [

	<apicall: bool 'glfwVulkanSupported' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:22'
}
GLFWInitializedLibrary >> waitEvents [

	<apicall: void 'glfwWaitEvents' ()>
	^ self externalCallFailed
]

{
	#category : #'api - events',
	#'squeak_changestamp' : 'stlu 2/12/2021 02:23'
}
GLFWInitializedLibrary >> waitEventsTimeout: timeout [

	<apicall: void 'glfwWaitEventsTimeout' (double)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> windowHint: hint with: value [

	<apicall: void 'glfwWindowHint' (int int)>
	^ self externalCallFailed
]

{
	#category : #'api - window creation',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> windowHintString: hint with: value [

	<apicall: void 'glfwWindowHintString' (int string)>
	^ self externalCallFailed
]

{
	#category : #'api - window properties',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLFWInitializedLibrary >> windowShouldClose: window [

	<apicall: bool 'glfwWindowShouldClose' (GLFWWindow*)>
	^ self externalCallFailed
]
