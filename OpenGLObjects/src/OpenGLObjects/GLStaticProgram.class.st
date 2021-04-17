Class {
	#name : #GLStaticProgram,
	#superclass : #GLProgram,
	#category : #'OpenGLObjects-Programs',
	#commentStamp : ''
}

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> fragmentShader [

	self subclassResponsibility
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/3/2020 18:58'
}
GLStaticProgram class >> instance [

	^ GL programs
		at: self
		ifAbsentPut: [self create]
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 12/8/2020 15:29'
}
GLStaticProgram class >> instanceOrNil [

	^ GL programs
		at: self
		ifAbsent: [nil]
]

{
	#category : #'shader code',
	#timestamp : 'stlu 11/13/2020 16:39'
}
GLStaticProgram class >> vertexShader [

	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : 'stlu 4/17/2021 22:30'
}
GLStaticProgram >> initialize [

	super initialize.
	self initializeShaders.
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 15:50'
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
	#timestamp : 'zagto 1/5/2021 17:33'
}
GLStaticProgram >> updateShaders [

	| oldInterfaces |
	oldInterfaces := interfaces.
	self detachShaders.
	self initializeShaders.
	interfaces migrateResourcesFrom: oldInterfaces.
]
