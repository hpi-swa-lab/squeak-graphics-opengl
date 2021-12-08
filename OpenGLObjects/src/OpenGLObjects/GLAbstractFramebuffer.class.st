"
A GLFramebuffer is a Squeak representation of OpenGL Framebuffer Objects.

Framebuffer Objects are OpenGL Objects, which allow for the creation of user-defined Framebuffers. With them, one can render to non-Default Framebuffer locations, and thus render without disturbing the main screen. 

https://www.khronos.org/opengl/wiki/Framebuffer_Object

Instance Variables
	target: 		target must be either GL_DRAW_FRAMEBUFFER, GL_READ_FRAMEBUFFER or GL_FRAMEBUFFER.
			If a framebuffer object is bound to GL_DRAW_FRAMEBUFFER or GL_READ_FRAMEBUFFER, it becomes the target for rendering or readback operations, respectively, until it is deleted or another framebuffer is bound to the corresponding bind point.
			Calling glBindFramebuffer with target​ set to GL_FRAMEBUFFER binds framebuffer to both the read and draw framebuffer targets. framebuffer​ is the name of a framebuffer object previously returned from a call to glGenFramebuffers, or zero to break the existing binding of a framebuffer object to target. 

"
Class {
	#name : #GLAbstractFramebuffer,
	#superclass : #GLObject,
	#classVars : [
		'CompletionStatusDescriptions'
	],
	#category : #'OpenGLObjects-Framebuffers',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:33'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:38'
}
GLAbstractFramebuffer class >> boundToDraw [

	^ self manager drawFramebuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:38'
}
GLAbstractFramebuffer class >> boundToRead [

	^ self manager readFramebuffer
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:18'
}
GLAbstractFramebuffer class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createFramebufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/28/2021 14:55'
}
GLAbstractFramebuffer class >> default [

	^ self manager defaultFramebuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/3/2020 14:54'
}
GLAbstractFramebuffer class >> defaultTarget [

	^ GL_FRAMEBUFFER
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:40'
}
GLAbstractFramebuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/29/2021 23:23'
}
GLAbstractFramebuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager mainImp generateFramebufferIDs: count)
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 7/26/2021 14:57'
}
GLAbstractFramebuffer class >> initialize [

	CompletionStatusDescriptions := {
		GL_FRAMEBUFFER_COMPLETE -> 'Complete framebuffer. The specified framebuffer is complete.'.
		GL_FRAMEBUFFER_UNDEFINED -> 'Undefined framebuffer. The specified framebuffer is the default read or draw framebuffer, but the default framebuffer does not exist.'.
		GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT -> 'Incomplete attachment. One of the framebuffer attachment points are framebuffer incomplete.'.
		GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT -> 'Incomplete missing attachment. The framebuffer does not have at least one image attached to it.'.
		GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER -> 'Incomplete draw buffer. The value of GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE is GL_NONE for any color attachment point(s) named by GL_DRAW_BUFFERi.'.
		GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER -> 'Incomplete read buffer. GL_READ_BUFFER is not GL_NONE and the value of GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE is GL_NONE for the color attachment point named by GL_READ_BUFFER.'.
		GL_FRAMEBUFFER_UNSUPPORTED -> 'Unsupported framebuffer. The combination of internal formats of the attached images violates an implementation-dependent set of restrictions.'.
		GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE -> 'Incomplete multisample. Either the value of GL_RENDERBUFFER_SAMPLES is not the same for all attached renderbuffers; or the value of GL_TEXTURE_SAMPLES is the not same for all attached textures; or, if the attached images are a mix of renderbuffers and textures, the value of GL_RENDERBUFFER_SAMPLES does not match the value of GL_TEXTURE_SAMPLES; or if the value of GL_TEXTURE_FIXED_SAMPLE_LOCATIONS is not the same for all attached textures; or, if the attached images are a mix of renderbuffers and textures, the value of GL_TEXTURE_FIXED_SAMPLE_LOCATIONS is not GL_TRUE for all attached textures.'.
		GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS -> 'Incomplete layer targets. One of the framebuffer attachment is layered, and one of the populated attachments is not layered, or all populated color attachments are not from textures of the same target.'.
	} as: Dictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:37'
}
GLAbstractFramebuffer class >> manager [

	^ GL objectState framebufferManager
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:26'
}
GLAbstractFramebuffer class >> unbind [

	self manager unbindFramebuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:27'
}
GLAbstractFramebuffer class >> unbindDraw [

	self manager unbindDrawFramebuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:26'
}
GLAbstractFramebuffer class >> unbindRead [

	self manager unbindReadFramebuffer
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 12/7/2021 14:57'
}
GLAbstractFramebuffer >> asFormOfExtent: aPoint [

	| data |
	self flag: #todo.
	data := ByteArray new: aPoint area * 4.
	
	self boundDuring: [
		GL
			readPixels: 0
			with: 0
			with: aPoint x
			with: aPoint y
			with: GL_BGRA
			with: GL_UNSIGNED_INT_8_8_8_8
			with: data].
	
	^ Form
		extent: aPoint
		depth: 32
		bits: ((Bitmap new: aPoint area * 4)
				copyFromByteArray: data;
				yourself)
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:28'
}
GLAbstractFramebuffer >> bind [
	"Bind to both read and draw."
	manager bindFramebuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:22'
}
GLAbstractFramebuffer >> bindToDraw [

	manager bindDrawFramebuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:29'
}
GLAbstractFramebuffer >> bindToRead [

	manager bindReadFramebuffer: self
]

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:31'
}
GLAbstractFramebuffer >> blit: bufferMask into: otherFramebuffer from: readBounds to: drawBounds [

	self
		blit: bufferMask
		into: otherFramebuffer
		from: readBounds
		to: drawBounds
		filter: GL_NEAREST
]

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:31'
}
GLAbstractFramebuffer >> blit: bufferMask into: otherFramebuffer from: readBounds to: drawBounds filter: filterEnum [

	self stateAccessImp
		blit: bufferMask
		from: self
		bounds: readBounds
		to: otherFramebuffer
		bounds: drawBounds
		filter: filterEnum
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:27'
}
GLAbstractFramebuffer >> boundDuring: aBlock [

	^ manager bindFramebuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:29'
}
GLAbstractFramebuffer >> boundToDrawDuring: aBlock [

	^ manager bindDrawFramebuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:27'
}
GLAbstractFramebuffer >> boundToReadDuring: aBlock [

	^ manager bindReadFramebuffer: self during: aBlock
]

{
	#category : #completeness,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:09'
}
GLAbstractFramebuffer >> checkCompletenessStatus [

	self checkCompletenessStatusForRead.
	self checkCompletenessStatusForDraw.
]

{
	#category : #completeness,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:15'
}
GLAbstractFramebuffer >> checkCompletenessStatusFor: targetEnum [

	| status |
	status := self completenessStatusFor: targetEnum.
	status ~= GL_FRAMEBUFFER_COMPLETE ifTrue: [
		self error: (CompletionStatusDescriptions at: status)].
]

{
	#category : #completeness,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:09'
}
GLAbstractFramebuffer >> checkCompletenessStatusForDraw [

	self checkCompletenessStatusFor: GL_DRAW_FRAMEBUFFER.
]

{
	#category : #completeness,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:09'
}
GLAbstractFramebuffer >> checkCompletenessStatusForRead [

	self checkCompletenessStatusFor: GL_READ_FRAMEBUFFER.
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:23'
}
GLAbstractFramebuffer >> clearBuffers: bufferBitMask [

	self stateAccessImp framebuffer: self clearBuffers: bufferBitMask
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:07'
}
GLAbstractFramebuffer >> clearColorBuffer: i to: aColor [

	self flag: #todo. "respect actual type of color buffer"
	self clearColorBuffer: i toFloat32Vector4: aColor asVectorColor
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLAbstractFramebuffer >> clearColorBuffer: i toFloat32Vector4: aFloat32Array [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aFloat32Array
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLAbstractFramebuffer >> clearColorBuffer: i toIntegerVector4: anIntegerArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: anIntegerArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLAbstractFramebuffer >> clearColorBuffer: i toUnsignedIntegerVector4: aWordArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aWordArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLAbstractFramebuffer >> clearDepthBufferTo: aFloat [

	self flag: #todo. "does FFI treat aFloat like a 1 element array?"
	self stateAccessImp framebuffer: self clearDepthBufferTo: aFloat
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:26'
}
GLAbstractFramebuffer >> clearStencilBufferTo: anInteger [

	self flag: #todo. "does FFI treat anInteger like a 1 element array?"
	self stateAccessImp framebuffer: self clearStencilBufferTo: anInteger
]

{
	#category : #completeness,
	#'squeak_changestamp' : 'stlu 12/7/2021 15:10'
}
GLAbstractFramebuffer >> completenessStatusFor: targetEnum [

	^ self stateAccessImp
		framebuffer: self
		completenessStatusFor: targetEnum
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:36'
}
GLAbstractFramebuffer >> isFramebuffer [

	^ true
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:19'
}
GLAbstractFramebuffer >> stateAccessImp [

	^ manager stateAccessImp
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:03'
}
GLAbstractFramebuffer >> unbind [

	self unbindFromDraw.
	self unbindFromRead.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:27'
}
GLAbstractFramebuffer >> unbindFromDraw [

	manager drawFramebuffer == self ifTrue: [
		manager unbindDrawFramebuffer]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 7/26/2021 13:26'
}
GLAbstractFramebuffer >> unbindFromRead [

	manager readFramebuffer == self ifTrue: [
		manager unbindReadFramebuffer]
]
