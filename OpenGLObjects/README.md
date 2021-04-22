# Squeak OpenGL Objects
Wrappers over OpenGL API objects for [Squeak/Smalltalk].

Still very much work in progress.


## Installation

> Requires Squeak trunk

> Requires VM newer than the one bundled with trunk images by default (202003021730) for FloatArrays to work correctly

```smalltalk
Metacello new
	baseline: 'OpenGLObjects';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGLObjects/src/';
	load.
```

## Usage

See [LearnOpenGL] for numerous examples.

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[LearnOpenGL]: ../LearnOpenGL