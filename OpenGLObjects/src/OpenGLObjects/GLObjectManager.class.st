"
I am responsible for generating, binding, initializing and general bookkeeping of GLObjects.
"
Class {
	#name : #GLObjectManager,
	#superclass : #Object,
	#instVars : [
		'objects',
		'context',
		'mainImp'
	],
	#pools : [
		'GLConstants'
	],
	#category : #'OpenGLObjects-Core',
	#'squeak_changestamp' : 'stlu 4/25/2021 13:33'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/11/2021 12:09'
}
GLObjectManager class >> context: aContext [

	^ self basicNew
		context: aContext;
		initialize;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:02'
}
GLObjectManager >> context [

	^ context
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:06'
}
GLObjectManager >> context: aContext [

	context := aContext.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 14:20'
}
GLObjectManager >> initialize [

	objects := Set new: 100.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:50'
}
GLObjectManager >> isValidID: anInteger [

	^ self subclassResponsibility
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:26'
}
GLObjectManager >> mainImp [

	^ mainImp
]

{
	#category : #implementors,
	#'squeak_changestamp' : 'stlu 7/29/2021 23:26'
}
GLObjectManager >> mainImp: anObject [

	mainImp := anObject.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 4/25/2021 13:37'
}
GLObjectManager >> objects [

	^ objects
]

{
	#category : #printing,
	#'squeak_changestamp' : 'stlu 4/26/2021 12:34'
}
GLObjectManager >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPut: $(;
		print: self objects size;
		nextPut: $)
]

{
	#category : #registration,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:53'
}
GLObjectManager >> register: aGLObject [

	objects add: aGLObject.
]

{
	#category : #registration,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:53'
}
GLObjectManager >> unregister: aGLObject [

	objects remove: aGLObject.
]
