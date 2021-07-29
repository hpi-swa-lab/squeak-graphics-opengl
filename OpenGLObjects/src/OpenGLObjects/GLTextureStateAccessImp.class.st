Class {
	#name : #GLTextureStateAccessImp,
	#superclass : #GLObjectImplementor,
	#category : #'OpenGLObjects-Implementors'
}

{
	#category : #mipmap,
	#'squeak_changestamp' : 'stlu 1/4/2021 09:47'
}
GLTextureStateAccessImp >> generateMipmap: aTexture [

	self subclassResponsibility
]

{
	#category : #'getting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum [

	^ (self texture: aTexture getFloatParameter: parameterEnum size: 1) first
]

{
	#category : #'getting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum size: numElements [

	self subclassResponsibility
]

{
	#category : #'getting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum [

	^ (self texture: aTexture getIntegerParameter: parameterEnum size: 1) first
]

{
	#category : #'getting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum size: numElements [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:47'
}
GLTextureStateAccessImp >> texture: aTexture setFloatParameter: parameterEnum toIntegerArray: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:20'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloat: aFloat [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:21'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloatArray: aFloatArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:37'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toInteger: anInteger [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:22'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toIntegerArray: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#'squeak_changestamp' : 'stlu 1/4/2021 07:30'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toUnsignedIntegerArray: anIntegerArray [

	self subclassResponsibility
]
