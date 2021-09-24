# Squeak OpenGL
OpenGL (https://www.opengl.org/) bindings for [Squeak/Smalltalk].

The bindings provided in this project support all OpenGL APIs (OpenGL, OpenGL ES, OpenGL ES-SC), versions and extensions. They are generated from the official Khronos XML specification maintained under https://github.com/KhronosGroup/OpenGL-Registry.

Originally inspired by and forked from [CroquetGL], a lot of the glue code and book-keeping mechanisms were stripped away since they were enmeshed with a specific OpenGL API and version. An object-oriented interface to modern OpenGL based on this project's bindings can be found in [OpenGL Objects][OpenGLObjects].

## Installation

> Requires at least [metacello@`88e4d13`](https://github.com/Metacello/metacello/commit/88e4d1341906b1eb591ba4f05a5df10d021cc2a9) on Windows.

```smalltalk
Metacello new
	baseline: 'OpenGL';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/';
	load.
```

To see which dependencies will be installed or to find different load targets, look at the project's Metacello [baseline](./src/BaselineOfOpenGL/BaselineOfOpenGL.class.st).

## Usage
The OpenGL graphics library requires a context object for API calls. The following example creates a context via the `B3DAcceleratorPlugin` shipped with Squeak as an external plugin by default. Another option would have been [GLFW].

> **On Windows**: To create contexts via the `B3DAcceleratorPlugin`, make sure your VM is set to support OpenGL instead of D3D by default. To do this, press F2 or go to the system menu, into the "Display and Sound" section and ensure the preference "Use OpenGL (instead of D3D)" is ENABLED.

```smalltalk
| context library |
"The `B3DAcceleratorPlugin` creates a context overlaying an area of the native Squeak window."
context := B3DContext bounds: (0@0 extent: 400@400).
library := context library.
[
	"Activates the library's context and sets the global `GL` to library."
	library makeCurrentDuring: [
		"During this block, we can refer to our library using the global variable `GL`."
		"Users can now call API functions on the global variable `GL`."
		[Sensor anyButtonPressed] whileFalse: [
			"The library supports some convenience functions."
			GL clearColor: (Color h: Time utcMicrosecondClock / 2e4 \\ 360.0 s: 1.0 v: 1.0).
			"While using the shared pool `GLConstants` is the preferred way to access OpenGL enums,
			the library can also answer enums. This makes scripting easier."
			GL clear: GL COLOR_BUFFER_BIT.
			"..."
			context swapBuffers]]
] ensure: [context destroy].
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
All of OpenGL's APIs share a list of available commands (functions) and enums (constants). The same command/enum can belong to multiple APIs and extensions. These relationships as well as the commands and enums themselves are defined and maintained in the [OpenGL Registry]. The class `GLLibraryMethods` contains a partial Smalltalk mirror of this specification derived by code generation.

Access to enums should preferably be made through the shared pool `GLConstants`.

#### Loading registry methods
Users are required to specify which commands and enums of the OpenGL standard they actually use.

```smalltalk
GLLibraryMethods
	loadAll;
	loadAPI: #gl;
	loadVersion: (GL33 profile: #core);

	loadExtensions: #(GL_ARB_separate_shader_objects GL_KHR_debug);
	loadExtension: #GL_ARB_separate_shader_objects;

	loadAllCommands;
	loadCommands: #(glBegin glEnd);
	loadCommand: #glGetError;

	loadAllEnums;
	loadEnums: #(GL_COLOR_BUFFER_BIT GL_DEPTH_BUFFER_BIT);
	loadEnum: #GL_BLEND;

	loadElementsSatisfying: [:each |
		"see `GLRegistryElement`"
		each isOnlyDefinedInExtensions not ].
```

#### Configuring code generation
The code generation used when loading registry methods can be configured using preferences:
* `GLLibraryMethods >> #silentCompilationEnabled`
* `GLLibraryMethods >> #definitionPragmasEnabled`
* `GLLibraryMethods >> #descriptionPragmasEnabled`
* `GLRegistry >> #defaultUrlToRetrieveXML`
* `GLRegistry >> #clearCurrentOnSave`

#### Example command
```smalltalk
GLLibraryMethods >> clear: mask "Selector to call this command. No 'gl' prefix and lower-case."

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
GLLibraryMethods >> STACK_OVERFLOW "Selector to get enum value. No 'GL_' prefix (some exceptions)"

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
	^ GL_STACK_OVERFLOW "Access to shared pool GLConstants"
```

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[CroquetGL]: http://www.squeaksource.com/CroquetGL.html
[OpenGLObjects]: ../OpenGLObjects
[GLFW]: ../GLFW
[OpenGL Registry]: https://github.com/KhronosGroup/OpenGL-Registry