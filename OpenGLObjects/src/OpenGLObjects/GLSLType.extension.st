Extension { #name : #GLSLType }

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 11:45'
}
GLSLType class >> compileAccessor: name value: return [

	self compileAccessor: name value: return classified: #accessing
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 11:44'
}
GLSLType class >> compileAccessor: name value: return classified: category [

	self theMetaClass compile: name asString , '

	^ ' , return classified: category asSymbol
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/23/2020 11:14'
}
GLSLType class >> removeAllSubclasses [

	self allSubclassesDo: [:cls | cls removeFromSystem]
]

{
	#category : #'*OpenGLObjects-Generation',
	#timestamp : 'stlu 11/19/2020 17:47'
}
GLSLType class >> subclass: symbolOrString [

	^ self subclass: symbolOrString asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self category
]
