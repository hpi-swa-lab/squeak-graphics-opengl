# Squeak OpenGL Objects
Object-oriented interface for [OpenGL] in [Squeak/Smalltalk].

Still very much work in progress.


## Installation

> Requires Squeak trunk

> Requires VM newer than the one bundled with trunk images by default (202003021730) for FloatArrays to work correctly

> Requires at least [metacello@`88e4d13`](https://github.com/Metacello/metacello/commit/88e4d1341906b1eb591ba4f05a5df10d021cc2a9) on Windows.

```smalltalk
Metacello new
	baseline: 'OpenGLObjects';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGLObjects/src/';
	load.
```

To see which dependencies will be installed or to find different load targets, look at the project's Metacello [baseline](./src/BaselineOfOpenGLObjects/BaselineOfOpenGLObjects.class.st).

## Usage

See [LearnOpenGL] for numerous examples.

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[LearnOpenGL]: ../LearnOpenGL
[OpenGL]: ../OpenGL