"
An AbstractGLObject is a Squeak representation of some OpenGL Object.

An OpenGL Object is an OpenGL construct that contains some state. When they are bound to the context, the state that they contain is mapped into the context's state. Thus, changes to context state will be stored in this object, and functions that act on this context state will use the state stored in the object. 

@see https://www.khronos.org/opengl/wiki/OpenGL_Object#Object_Creation_and_Destruction

Instance Variables
	gl:		OpenGL context used (should be settable to enable OpenGL to be mockable in unit tests)
	id:		OpenGL id used for the object in OpenGL (only applicable for some objects)



"
Class {
	#name : #GLObject,
	#superclass : #Object,
	#instVars : [
		'manager',
		'id'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-Core'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/11/2021 12:39'
}
GLObject class >> create [
	"Subclasses need to override either #create or #create:"
	^ (self create: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/11/2021 12:43'
}
GLObject class >> create: count [
	"Subclasses need to override either #create or #create:"
	| objects |
	objects := Array new: count.
	1 to: count do: [:index |
		objects at: index put: self create].
	^ objects
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:13'
}
GLObject class >> manager [

	self subclassResponsibility
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/28/2021 14:51'
}
GLObject class >> manager: aManager id: anInteger [

	^ self basicNew
		manager: aManager;
		id: anInteger;
		initialize;
		yourself
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:16'
}
GLObject class >> manager: aManager ids: integerArray [

	| instances |
	instances := Array new: integerArray size.
	1 to: instances size do: [:index |
		instances
			at: index
			put: (self manager: aManager id: (integerArray at: index))].
	^ instances
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/28/2021 14:49'
}
GLObject class >> new [
	"Use #create or #create: instead."
	self shouldNotImplement.
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/15/2021 03:06'
}
GLObject >> = otherObject [

	self == otherObject ifTrue: [^ true].
	id = otherObject id ifFalse: [^ false].
	self class = otherObject class ifFalse: [^ false].
	self context = otherObject context ifFalse: [^ false].
	^ true
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:00'
}
GLObject >> context [

	^ self manager context
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 18:16'
}
GLObject >> delete [

	self unregister.
	self invalidate.
]

{
	#category : #comparing,
	#'squeak_changestamp' : 'stlu 5/15/2021 03:07'
}
GLObject >> hash [

	^ (id hash bitXor: self context hash) bitXor: self class hash
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
GLObject >> id [

	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 11/3/2020 16:36'
}
GLObject >> id: anInteger [

	id := anInteger
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 14:52'
}
GLObject >> initialize [

	self register.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:56'
}
GLObject >> invalidate [

	id := #deleted.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:12'
}
GLObject >> isBuffer [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLObject >> isFramebuffer [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:12'
}
GLObject >> isProgram [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:12'
}
GLObject >> isShader [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:12'
}
GLObject >> isTexture [

	^ false
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:14'
}
GLObject >> isVertexArray [

	^ false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/11/2021 11:54'
}
GLObject >> library [

	^ self context library
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:36'
}
GLObject >> manager [

	^ manager
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 22:36'
}
GLObject >> manager: anObject [

	manager := anObject
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 12/1/2020 03:08'
}
GLObject >> printOn: aStream [

	super printOn: aStream.
	aStream nextPut: $(.
	id printOn: aStream.
	aStream nextPut: $)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:53'
}
GLObject >> register [

	manager register: self.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:53'
}
GLObject >> unregister [

	manager unregister: self.
]
