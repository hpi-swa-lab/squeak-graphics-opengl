Class {
	#name : #GLFWMonitor,
	#superclass : #ExternalStructure,
	#pools : [
		'GLFWConstants'
	],
	#category : #'GLFW-Core',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/12/2021 19:51'
}
GLFWMonitor class >> all [

	| count monitors |
	count := IntegerArray new: 1.
	monitors := GLFW getMonitors: count.
	self flag: #todo. "external arrays are rough atm"
	^ monitors
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 2/12/2021 18:58'
}
GLFWMonitor class >> primary [

	^ GLFW getPrimaryMonitor
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:26'
}
GLFWMonitor >> contentScale [

	| x y |
	x := Float32Array new: 1.
	y := Float32Array new: 1.
	GLFW getMonitorContentScale: self with: x with: y.
	^ x first @ y first
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:44'
}
GLFWMonitor >> gamma: aFloat [

	GLFW setGamma: self with: aFloat
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:23'
}
GLFWMonitor >> gammaRamp [

	^ GLFW getGammaRamp: self
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:45'
}
GLFWMonitor >> gammaRamp: aGammaRamp [

	GLFW setGammaRamp: self with: aGammaRamp
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:27'
}
GLFWMonitor >> name [

	^ GLFW getMonitorName: self
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:29'
}
GLFWMonitor >> physicalExtent [

	| w h |
	w := IntegerArray new: 1.
	h := IntegerArray new: 1.
	GLFW getMonitorPhysicalSize: self with: w with: h.
	^ w first @ h first
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:34'
}
GLFWMonitor >> position [

	| x y |
	x := IntegerArray new: 1.
	y := IntegerArray new: 1.
	GLFW getMonitorPhysicalSize: self with: x with: y.
	^ x first @ y first
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:43'
}
GLFWMonitor >> supportedVideoModes [

	| count modes |
	count := IntegerArray new: 1.
	modes := GLFW getVideoModes: self with: count.
	self flag: #todo. "external arrays are rough atm"
	^ modes
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:35'
}
GLFWMonitor >> userPointer [

	^ GLFW getMonitorUserPointer: self
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:48'
}
GLFWMonitor >> userPointer: pointer [

	GLFW setMonitorUserPointer: self with: pointer
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:41'
}
GLFWMonitor >> videoMode [

	^ GLFW getVideoMode: self
]

{
	#category : #accessing,
	#timestamp : 'stlu 2/12/2021 19:40'
}
GLFWMonitor >> workBounds [

	| x y w h |
	x := IntegerArray new: 1.
	y := IntegerArray new: 1.
	w := IntegerArray new: 1.
	h := IntegerArray new: 1.
	GLFW getMonitorWorkarea: self with: x with: y with: w with: h.
	^ Rectangle
		origin: x first @ y first
		extent: w first @ h first
]
