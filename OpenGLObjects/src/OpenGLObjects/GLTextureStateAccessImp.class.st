Class {
	#name : #GLTextureStateAccessImp,
	#superclass : #GLObjectImp,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #mipmap,
	#timestamp : 'stlu 1/4/2021 09:47'
}
GLTextureStateAccessImp >> generateMipmap: aTexture [

	self subclassResponsibility
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum [

	^ (self texture: aTexture getFloatParameter: parameterEnum size: 1) first
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum size: numElements [

	self subclassResponsibility
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum [

	^ (self texture: aTexture getIntegerParameter: parameterEnum size: 1) first
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 09:11'
}
GLTextureStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum size: numElements [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:47'
}
GLTextureStateAccessImp >> texture: aTexture setFloatParameter: parameterEnum toIntegerArray: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:20'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloat: aFloat [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:21'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloatArray: aFloatArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:37'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toInteger: anInteger [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:22'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toIntegerArray: anIntegerArray [

	self subclassResponsibility
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:30'
}
GLTextureStateAccessImp >> texture: aTexture setParameter: parameterEnum toUnsignedIntegerArray: anIntegerArray [

	self subclassResponsibility
]
