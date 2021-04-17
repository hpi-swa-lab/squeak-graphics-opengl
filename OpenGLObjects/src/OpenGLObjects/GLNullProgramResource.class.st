Class {
	#name : #GLNullProgramResource,
	#superclass : #GLProgramResource,
	#instVars : [
		'resourceClass'
	],
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/10/2021 23:12'
}
GLNullProgramResource class >> program: aProgram name: aString resourceClass: aResourceClass [

	^ (self program: aProgram name: aString)
		resourceClass: aResourceClass;
		yourself
]

{
	#category : #'error handling',
	#timestamp : 'stlu 1/10/2021 21:49'
}
GLNullProgramResource >> doesNotUnderstand: aMessage [

	"do nothing"
]

{
	#category : #testing,
	#timestamp : 'stlu 1/10/2021 23:00'
}
GLNullProgramResource >> isNull [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:12'
}
GLNullProgramResource >> resourceClass [

	^ resourceClass
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:12'
}
GLNullProgramResource >> resourceClass: anObject [

	resourceClass := anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/10/2021 23:03'
}
GLNullProgramResource >> type [

	^ GLSLVoid instance
]

{
	#category : #interface,
	#timestamp : 'stlu 1/10/2021 23:18'
}
GLNullProgramResource >> value [

	
]

{
	#category : #interface,
	#timestamp : 'stlu 1/10/2021 23:18'
}
GLNullProgramResource >> value: anObject [

	
]
