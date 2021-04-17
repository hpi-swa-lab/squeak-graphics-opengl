Class {
	#name : #B3DRenderer,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #'OpenGL-Core',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/9/2020 14:58'
}
B3DRenderer class >> bounds: bounds [

	^ self bounds: bounds flags: self defaultFlags
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/9/2020 17:57'
}
B3DRenderer class >> bounds: bounds flags: flags [
	"flag is a bitwise OR of
	1	B3DSoftwareRenderer
	2	B3DHardwareRenderer
	4	B3DStencilBuffer
	8	B3DAntialiasing
	16	B3DStereo
	32	B3DSyncvbl"
	| handle |
	handle := self
				primCreateRenderer: flags
				x: bounds left
				y: bounds top
				w: bounds width
				h: bounds height.
	handle ifNil: [^ self error: 'Failed to create renderer'].
	^ self handle: handle
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 14:52'
}
B3DRenderer class >> defaultFlags [

	^ 2r0000001 "B3DSoftwareRenderer"
		+ 2r00000010 "B3DHardwareRenderer"
		+ 2r00000100 "B3DStencilBuffer"
]

{
	#category : #private,
	#timestamp : 'stlu 11/9/2020 17:52'
}
B3DRenderer class >> handle: aHandle [

	^ self basicNew
		initializeWithHandle: aHandle;
		yourself
]

{
	#category : #testing,
	#timestamp : 'stlu 10/16/2020 12:34'
}
B3DRenderer class >> isAvailable [

	^ self pluginVersion > 0
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 17:45'
}
B3DRenderer class >> pluginVersion [
	"self pluginVersion"
	<primitive: 'primitiveRendererVersion' module: 'B3DAcceleratorPlugin'>
	^ 0
]

{
	#category : #private,
	#timestamp : 'stlu 11/9/2020 17:56'
}
B3DRenderer class >> primCreateRenderer: flags x: x y: y w: w h: h [

	<primitive: 'primitiveCreateRendererFlags' module:'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 15:52'
}
B3DRenderer class >> verbosityLevel: newLevel [
	"Primitive. Set the reporting level for the engine. Values are
		0 - print NO information ever
		1 - print critical debug errors
		2 - print debug warnings
		3 - print extra information
		4 - print per-frame statistics
		5 - print information about textures, lights, materials, and primitives
		6 - print information about background synchronization
		10 - print information about each vertex and face
	Debug Logging/Error Reporting to Squeak3D.log in the image's directory"
	<primitive: 'primitiveSetVerboseLevel' module: 'B3DAcceleratorPlugin'>
]

{
	#category : #activation,
	#timestamp : 'stlu 11/9/2020 18:01'
}
B3DRenderer >> activate [
    "Hack! We can't make it explicitly but getting a property requires to have me current, so..."
    self primRenderer: handle getProperty: 1
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/9/2020 18:01'
}
B3DRenderer >> bounds: aRectangle [

	self
		primRenderer: handle
		setBufferRectX: aRectangle left
		y: aRectangle top
		w: aRectangle width
		h: aRectangle height
]

{
	#category : #activation,
	#timestamp : 'stlu 11/9/2020 18:22'
}
B3DRenderer >> deactivate [
    "We can't really do that..."
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/9/2020 15:44'
}
B3DRenderer >> destroy [

	self primDestroyRenderer: handle
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/9/2020 17:53'
}
B3DRenderer >> initializeWithHandle: aHandle [

	handle := aHandle
]

{
	#category : #testing,
	#timestamp : 'stlu 11/9/2020 17:59'
}
B3DRenderer >> isOverlay [

	^ self primIsOverlayRenderer: handle
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 15:02'
}
B3DRenderer >> primDestroyRenderer: aHandle [

	<primitive: 'primitiveDestroyRenderer' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 18:05'
}
B3DRenderer >> primIsOverlayRenderer: aHandle [

	<primitive: 'primIsOverlayRenderer' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 18:19'
}
B3DRenderer >> primRenderer: aHandle getProperty: propNumber [
	"Returns a renderer property or 0 if the property does not exist.
		1	backface culling
		2	polygon mode
		3	point size
		4	line width
		5	blend enable
		6	blend source factor
		7	blend dest factor
	Makes renderer aHandle current."
	<primitive: 'primitiveGetIntProperty' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 18:01'
}
B3DRenderer >> primRenderer: aHandle setBufferRectX: left y: top w: width h: height [

	<primitive: 'primitiveSetBufferRect' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 18:01'
}
B3DRenderer >> primRenderer: aHandle setProperty: propNumber toInteger: value [

	<primitive: 'primitiveSetIntProperty' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'primitives-renderer',
	#timestamp : 'stlu 11/9/2020 15:28'
}
B3DRenderer >> primSwapBuffers: aHandle [
	"Primitive. Finish all rendering operations on the receiver.
	Do not return before all rendering operations have taken effect."
	<primitive: 'primitiveSwapRendererBuffers' module: 'B3DAcceleratorPlugin'>
	^ nil
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/13/2020 18:20'
}
B3DRenderer >> swapBuffers [

	self primSwapBuffers: handle
]
