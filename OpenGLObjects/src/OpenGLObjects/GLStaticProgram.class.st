Class {
	#name : #GLStaticProgram,
	#superclass : #GLProgram,
	#category : #'OpenGLObjects-Programs'
}

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> fragmentShader [

	self subclassResponsibility
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 16:49'
}
GLStaticProgram class >> instance [

	^ self manager staticPrograms
		at: self
		ifAbsentPut: [self create]
]

{
	#category : #'shader code',
	#'squeak_changestamp' : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> vertexShader [

	self subclassResponsibility
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 4/17/2021 22:30'
}
GLStaticProgram >> initialize [

	super initialize.
	self initializeShaders.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 11/13/2020 15:50'
}
GLStaticProgram >> initializeShaders [

	{
		GLVertexShader create
			source: self class vertexShader withUnixLineEndings;
			compile;
			yourself.
		GLFragmentShader create
			source: self class fragmentShader withUnixLineEndings;
			compile;
			yourself
	} do: [:shader | self attachShader: shader].
	
	self link.
	
	shaders do: [:shader | shader delete]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'zagto 1/5/2021 17:33'
}
GLStaticProgram >> updateShaders [

	| oldInterfaces |
	oldInterfaces := interfaces.
	self detachShaders.
	self initializeShaders.
	interfaces migrateResourcesFrom: oldInterfaces.
]
