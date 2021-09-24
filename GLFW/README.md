# Squeak GLFW
GLFW (https://www.glfw.org) bindings for Squeak/Smalltalk (https://squeak.org).

> GLFW is an Open Source, multi-platform library for OpenGL, OpenGL ES and Vulkan development on the desktop. It provides a simple API for creating windows, contexts and surfaces, receiving input and events.

Currently exclusively supports GLFW version 3.3.x (https://www.glfw.org/docs/3.3/). Older versions may or may not work.

GLFW source repository: https://github.com/glfw/glfw

## Installation

> Installs very experimental FFICallback implementation. Callbacks currently only work on Linux.

> By default also installs [OpenGL]. Alternatively, you can specify `load: #core` instead of `load` to only install GLFW

```smalltalk
Metacello new
	baseline: 'GLFW';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/GLFW/src/';
	load.
```

To see which dependencies will be installed or to find different load targets, look at the project's Metacello [baseline](./src/BaselineOfGLFW/BaselineOfGLFW.class.st).

## Usage
All GLFW functions can be accessed through the library object referred to by the global variable `GLFW`.

```smalltalk
GLFW pollEvents. "selectors drop the 'glfw' prefix and start lower-case"
```

---

All GLFW constants can also be accessed through the library object. However, when possible, the shared pool `GLFWConstants` should be used instead.

```smalltalk
GLFW CURSOR_HIDDEN. "answers 16r34002. selectors drop the 'GLFW_' prefix"
```

---

Many of GLFW's functions are essentially methods that require their first parameter to be the struct handle of the object they're operating on. In order to simplify interaction with GLFW, these methods were reified into Smalltalk classes.

```smalltalk
GLFWInitializedLibrary >> windowShouldClose: window

	<apicall: bool 'glfwWindowShouldClose' (GLFWWindow*)>
	^ self externalCallFailed
```
```smalltalk
GLFWWindow >> shouldClose

	^ GLFW windowShouldClose: self
```

---

Additionally,  **`init` and `terminate` do not need to be called manually**. The library initializes itself lazily when required and terminates when Squeak is shut down. Terminate can come in handy when dealing with leftover windows, though.

```smalltalk
GLFWUninitializedLibrary >> windowHint: hint with: value

	self init ifTrue: [
		^ self windowHint: hint with: value]
```

### Working example
```smalltalk
| window |
window := GLFWWindow extent: 400 @ 400 title: 'Example'.
window ifNil: [^ self error: 'GLFW Error'].

[[window shouldClose] whileFalse: [
	"..."
	window swapBuffers.
	GLFW pollEvents]
] ensure: [window destroy]
```

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[OpenGL]: ../OpenGL
