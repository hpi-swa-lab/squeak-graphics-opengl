# 3D Transforms
A collection of classes useful for working in multidimensional spaces in [Squeak/Smalltalk].

Much of this code originated in and is still identitcal to the one in [CroquetGL]. Original change stamps sadly got lost at some point, though.

Very much work in progress.

## Installation
> Requires Squeak trunk

> Requires VM newer than the one bundled with trunk images by default (202003021730) for FloatArrays to work correctly

```smalltalk
Metacello new
	baseline: '3DTransform';
	repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/3DTransform/src/';
	load.
```

To see which dependencies will be installed or to find different load targets, look at the project's Metacello [baseline](./src/BaselineOf3DTransform/BaselineOf3DTransform.class.st).

<!-- references -->
[Squeak/Smalltalk]: https://squeak.org
[CroquetGL]: http://www.squeaksource.com/CroquetGL.html