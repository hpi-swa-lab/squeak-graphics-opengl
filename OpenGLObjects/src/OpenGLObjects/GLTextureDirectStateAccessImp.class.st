Class {
	#name : #GLTextureDirectStateAccessImp,
	#superclass : #GLTextureStateAccessImp,
	#category : #'OpenGLObjects-Textures',
	#commentStamp : ''
}

{
	#category : #mipmap,
	#timestamp : 'stlu 1/4/2021 09:46'
}
GLTextureDirectStateAccessImp >> generateMipmap: aTexture [

	GL generateTextureMipmap: aTexture id
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 08:30'
}
GLTextureDirectStateAccessImp >> texture: aTexture getFloatParameter: parameterEnum size: numElements [

	| result |
	result := FloatArray new: numElements.
	GL
		getTextureParameterfv: aTexture id
		with: parameterEnum
		with: result.
	^ result
]

{
	#category : #'getting parameters',
	#timestamp : 'stlu 1/4/2021 08:36'
}
GLTextureDirectStateAccessImp >> texture: aTexture getIntegerParameter: parameterEnum size: numElements [

	| result |
	result := IntegerArray new: numElements.
	GL
		getTextureParameteriv: aTexture id
		with: parameterEnum
		with: result.
	^ result
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:47'
}
GLTextureDirectStateAccessImp >> texture: aTexture setFloatParameter: parameterEnum toIntegerArray: anIntegerArray [

	GL
		textureParameteriv: aTexture id
		with: parameterEnum
		with: anIntegerArray
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:35'
}
GLTextureDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloat: aFloat [

	GL
		textureParameterf: aTexture id
		with: parameterEnum
		with: aFloat
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:36'
}
GLTextureDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toFloatArray: aFloatArray [

	GL
		textureParameterfv: aTexture id
		with: parameterEnum
		with: aFloatArray
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:36'
}
GLTextureDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toInteger: anInteger [

	GL
		textureParameteri: aTexture id
		with: parameterEnum
		with: anInteger
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:36'
}
GLTextureDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toIntegerArray: anIntegerArray [

	GL
		textureParameterIiv: aTexture id
		with: parameterEnum
		with: anIntegerArray
]

{
	#category : #'setting parameters',
	#timestamp : 'stlu 1/4/2021 07:36'
}
GLTextureDirectStateAccessImp >> texture: aTexture setParameter: parameterEnum toUnsignedIntegerArray: aWordArray [

	GL
		textureParameterIuiv: aTexture id
		with: parameterEnum
		with: aWordArray
]
