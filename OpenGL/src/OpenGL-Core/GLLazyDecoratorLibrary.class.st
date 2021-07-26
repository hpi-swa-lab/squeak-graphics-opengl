"
I decorate a GLLibrary. Instead of defining all API methods beforehand, I lazily compile only those that are needed in order to avoid a large method dictionary of mostly unused methods.
"
Class {
	#name : #GLLazyDecoratorLibrary,
	#superclass : #GLLibrary,
	#instVars : [
		'library'
	],
	#category : #'OpenGL-Core',
	#'squeak_changestamp' : 'stlu 7/23/2021 09:55'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/17/2021 10:29'
}
GLLazyDecoratorLibrary class >> around: aLibrary [

	^ self new
		library: aLibrary;
		context: aLibrary context;
		yourself
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 7/23/2021 09:51'
}
GLLazyDecoratorLibrary >> compilePassthrough: methodSignature [

	| source |
	source := self passthroughTemplate format: { methodSignature }.
	^ self class compileSilently: source classified: #'*autogenerated'
]

{
	#category : #'error handling',
	#'squeak_changestamp' : 'stlu 4/16/2021 14:56'
}
GLLazyDecoratorLibrary >> doesNotUnderstand: aMessage [

	(self install: aMessage selector) ifNotNil: [
		^ aMessage sendTo: self].
	
	^ super doesNotUnderstand: aMessage
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 7/23/2021 09:50'
}
GLLazyDecoratorLibrary >> install: aSelector [

	self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/15/2021 22:23'
}
GLLazyDecoratorLibrary >> library [

	^ library
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/17/2021 10:29'
}
GLLazyDecoratorLibrary >> library: aLibrary [

	library := aLibrary
]

{
	#category : #compiling,
	#'squeak_changestamp' : 'stlu 4/16/2021 15:20'
}
GLLazyDecoratorLibrary >> passthroughTemplate [

	^ '{1}

	^ library {1}'
]