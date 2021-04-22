# Squeak OpenGL
OpenGL (https://www.opengl.org/) bindings for [Squeak/Smalltalk].

The bindings provided in this project support all OpenGL APIs (OpenGL, OpenGL ES, OpenGL ES-SC), versions and extensions. They are generated from the official Khronos XML specification maintained under https://github.com/KhronosGroup/OpenGL-Registry.

Originally inspired by and forked from [CroquetGL], a lot of the glue code and book-keeping mechanisms were stripped away since they were enmeshed with a specific OpenGL API and version. An object-oriented interface to modern OpenGL based on this project's bindings can be found in [OpenGL Objects][OpenGLObjects].

## Installation
> Note: This may take a while.

```smalltalk
Metacello new
	baseline: 'OpenGL';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/';
	load.
```

## Usage
The OpenGL graphics library requires a context object for API calls. The following example creates a context through [GLFW].

```smalltalk
| window library |
window := GLFWWindow extent: 400 @ 400 title: 'Example'.
window ifNil: [^ self error: 'GLFW Error'].
library := GLExternalLibrary context: window context.

[library makeCurrentDuring: ["Activates the library's context and sets `GL` to library."
	"During this block, library's context is activated and `GL` refers to library."
	"Users can now call API functions on the global variable `GL`."
	GL clearColor: Color red. "The library supports some useful convenience functions."
	[window shouldClose] whileFalse: [
		GL clear: GL COLOR_BUFFER_BIT. "The library can also answer enum values."
		"..."
		window context swapBuffers.
		GLFW pollEvents]]
] ensure: [window context destroy]
```

### Automatic error checking
Whenever an API call to OpenGL fails, OpenGL internally sets a flag to denote the kind of error that occurred. To retrieve this flag, users need to manually call the `glGetError` function. To avoid interspersing this error check into user code after every API call, and allow dynamic activation of this behavior, libraries can be wrapped with an error checking layer that ensures a call to `glGetError` after very API call.

```smalltalk
library withErrorChecking makeCurrentDuring: [
	"..."
	GL clear: GL Color. "Invalid argument enum. Throws error immediately."
	"..."]
```

### Automatic version checking
When writing user code meant to satisfy one or more specific OpenGL versions, it may be helpful to codify and assert this constraint. Libraries can be wrapped with a version checking layer that ensures all API calls are part of a specified version and/or list of extensions.

```smalltalk
(library withVersionChecking: (GL33 profile: #core) extensions: #()) makeCurrentDuring: [
	"..."
	GL clear: GL COLOR_BUFFER_BIT. "Available since OpenGL 1.0. Pass through."
	GL begin: GL_POLYGON. "Removed in OpenGL 3.2 Core Profile. Throws error."
	"..."]
```

### Registry
All of OpenGL's APIs share a list of available commands (functions) and enums (constants). The same command/enum can belong to multiple APIs and extensions. These relationships as well as the commands and enums themselves are defined and maintained in the [OpenGL Registry]. The class `GLRegistry` contains a Smalltalk mirror of this specification derived by code generation.

Access to enums should preferably be made through the shared pool `GLConstants`.

#### Example command
```smalltalk
GLRegistry >> clear: mask "Selector to call this command. No 'gl' prefix and lower-case."

	<glAPI: #gl since: '1.0'> "Command is in API OpenGL since version 1.0"
	<glAPI: #gles1 since: '1.0'> "Command is in API OpenGL ES 1.x since version 1.0"
	<glAPI: #gles2 since: '2.0'> "Command is in API OpenGL ES 2+ since version 2.0"
	<glAPI: #glsc2 since: '2.0'> "Command is in API OpenGL ES-SC 2+ since version 2.0"
	
	<glCommand: #glClear> "Real command name."
	<glReturn: 'void'> "Return value metadata"
	<glArg: 'mask' type: 'GLbitfield' group: #ClearBufferMask> "Parameter metadata"
	
	<apicall: void 'glClear' (GLbitfield)> "FFI pragma"
	^ self externalCallFailed
```

#### Example enum
```smalltalk
GLRegistry >> STACK_OVERFLOW "Selector to get enum value. No 'GL_' prefix (some exceptions)"

	<glAPI: #gl since: '1.0'>
	<glAPI: #gl profile: #core until: '3.2'> "Command was removed from core profile of API OpenGL in version 3.2"
	<glAPI: #gl profile: #core since: '4.3'> "Command was reintroduced in core profile of API OpenGL in version 4.3"
	<glAPI: #gles1 since: '1.0'>
	<glAPI: #gles2 since: '3.2'>
	<glAPI: #gl profile: #compatibility extension: #'GL_KHR_debug'>
	<glAPI: #gl profile: #core extension: #'GL_KHR_debug'> "Command available in core profile of API OpenGL through extension 'GL_KHR_debug"
	
	<glEnum: #'GL_STACK_OVERFLOW'> "Real enum name."
	<glValue: 16r503> "Enum value"
	<glGroups: #(#ErrorCode)> "Enum groups this enum belongs to. Sometimes part of a command's parameter or return value metadata."
	<glVendor: #ARB>
	^ GL_STACK_OVERFLOW "Access to shared pool GLConstants"
```

## (Re-)Generating the registry
The [OpenGL XML registry][OpenGL Registry] is constantly evolving, even now. Updating the Smalltalk mirror to reflect recent changes can be done by running the following code:

```smalltalk
| registry |
registry := GLGenRegistry fromWeb.
GLGenConstantsPoolGenerator new generate: registry. "updates GLConstants"
GLGenRegistryGenerator new generate: registry. "updates GLRegistry"
```

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[CroquetGL]: http://www.squeaksource.com/CroquetGL.html
[OpenGLObjects]: ../OpenGLObjects
[GLFW]: ../GLFW
[OpenGL Registry]: https://github.com/KhronosGroup/OpenGL-Registry