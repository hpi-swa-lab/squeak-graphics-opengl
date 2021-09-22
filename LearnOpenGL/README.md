# Squeak LearnOpenGL
A loose adaptation of the https://learnopengl.com/ code examples to [Squeak OpenGL Objects][OpenGLObjects].

Original source code and resources can be found here: https://github.com/JoeyDeVries/LearnOpenGL

This is very much work in progress.

## Installation
> Requires Squeak trunk

> Requires VM newer than the one bundled with trunk images by default (202003021730) for FloatArrays to work correctly

```smalltalk
Metacello new
	baseline: 'LearnOpenGL';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/LearnOpenGL/src/';
	load.
```

To see which dependencies will be installed or to find different load targets, look at the project's Metacello [baseline](./src/BaselineOfLearnOpenGL/BaselineOfLearnOpenGL.class.st).

## Usage
There are quite a few examples to try out and inspect:
```smalltalk
"1.1.1" LOGLHelloWindow run.
"1.1.2" LOGLHelloWindowClear run.
"1.2.1" LOGLHelloTriangle run.
"1.2.2" LOGLHelloTriangleIndexed run.
"1.3.1" LOGLShadersUniform run.
"1.3.2" LOGLShadersInterpolation run.
"1.4.1" LOGLTextures run.
"1.5.1" LOGLTransformations run.
"1.6.1" LOGLCoordinateSystems run.
"1.6.2" LOGLCoordinateSystemsDepth run.
"1.6.3" LOGLCoordinateSystemsMultiple run.
"1.7.1" LOGLCameraCircle run. "incorrect camera movement"
"1.7.4" LOGLCameraClass run. "incorrect camera movement"
"4.1.1" LOGLDepthTesting run. "incorrect camera movement"
"4.10.1" LOGLInstancing run.
```

If a problem occurs and one of the windows refuses to close, try running
```smalltalk
GLFW terminate
```

<!-- references -->
[OpenGLObjects]: ./../OpenGLObjects/