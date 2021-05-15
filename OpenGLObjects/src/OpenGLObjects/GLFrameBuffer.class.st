"
A GLFrameBuffer is a Squeak representation of OpenGL Framebuffer Objects.

Framebuffer Objects are OpenGL Objects, which allow for the creation of user-defined Framebuffers. With them, one can render to non-Default Framebuffer locations, and thus render without disturbing the main screen. 

https://www.khronos.org/opengl/wiki/Framebuffer_Object

Instance Variables
	target: 		target must be either GL_DRAW_FRAMEBUFFER, GL_READ_FRAMEBUFFER or GL_FRAMEBUFFER.
			If a framebuffer object is bound to GL_DRAW_FRAMEBUFFER or GL_READ_FRAMEBUFFER, it becomes the target for rendering or readback operations, respectively, until it is deleted or another framebuffer is bound to the corresponding bind point.
			Calling glBindFramebuffer with target​ set to GL_FRAMEBUFFER binds framebuffer to both the read and draw framebuffer targets. framebuffer​ is the name of a framebuffer object previously returned from a call to glGenFramebuffers, or zero to break the existing binding of a framebuffer object to target. 

"
Class {
	#name : #GLFrameBuffer,
	#superclass : #GLObject,
	#instVars : [
		'colorAttachment0'
	],
	#classVars : [
		'CompletionStatusDescriptions'
	],
	#category : #'OpenGLObjects-FrameBuffers'
}

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:08'
}
GLFrameBuffer class >> boundToDraw [

	^ self manager drawFrameBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:09'
}
GLFrameBuffer class >> boundToRead [

	^ self manager readFrameBuffer
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:42'
}
GLFrameBuffer class >> create: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp createFrameBufferIDs: count)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:01'
}
GLFrameBuffer class >> default [

	^ GLDisplayFrameBuffer instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/3/2020 14:54'
}
GLFrameBuffer class >> defaultTarget [

	^ GL_FRAMEBUFFER
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:40'
}
GLFrameBuffer class >> generate [

	^ (self generate: 1) first
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 4/26/2021 12:40'
}
GLFrameBuffer class >> generate: count [

	| manager |
	manager := self manager.
	^ self
		manager: manager
		ids: (manager creationImp generateFrameBufferIDs: count)
]

{
	#category : #'class initialization',
	#'squeak_changestamp' : 'stlu 1/9/2021 13:46'
}
GLFrameBuffer class >> initialize [

	CompletionStatusDescriptions := {
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
	#'squeak_changestamp' : 'stlu 4/26/2021 12:43'
}
GLFrameBuffer class >> manager [

	^ GL objectState frameBufferManager
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:08'
}
GLFrameBuffer class >> unbind [

	self manager unbindFrameBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:08'
}
GLFrameBuffer class >> unbindDraw [

	self manager unbindDrawFrameBuffer
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:08'
}
GLFrameBuffer class >> unbindRead [

	self manager unbindReadFrameBuffer
]

{
	#category : #converting,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:35'
}
GLFrameBuffer >> asFormOfExtent: aPoint [

	| data |
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
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:05'
}
GLFrameBuffer >> attach2DTexture: a2DTexture level: mipMapLevel to: attachmentEnum [

	self stateAccessImp
		framebuffer: self
		attach2DTexture: a2DTexture
		level: mipMapLevel
		to: attachmentEnum
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:05'
}
GLFrameBuffer >> attach2DTexture: a2DTexture to: attachmentEnum [

	self stateAccessImp
		framebuffer: self
		attach2DTexture: a2DTexture
		level: 0
		to: attachmentEnum
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 1/9/2021 13:58'
}
GLFrameBuffer >> attachRenderbuffer: aRenderbuffer to: attachmentEnum [

	self stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		to: attachmentEnum
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:47'
}
GLFrameBuffer >> bind [
	"Bind to both read and draw."
	manager bindFrameBuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:29'
}
GLFrameBuffer >> bindToDraw [

	manager bindDrawFrameBuffer: self
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:29'
}
GLFrameBuffer >> bindToRead [

	manager bindReadFrameBuffer: self
]

{
	#category : #blitting,
	#'squeak_changestamp' : 'stlu 1/9/2021 14:31'
}
GLFrameBuffer >> blit: bufferMask into: otherFramebuffer from: readBounds to: drawBounds [

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
GLFrameBuffer >> blit: bufferMask into: otherFramebuffer from: readBounds to: drawBounds filter: filterEnum [

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
	#'squeak_changestamp' : 'stlu 5/15/2021 15:48'
}
GLFrameBuffer >> boundDuring: aBlock [

	^ manager bindFrameBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:48'
}
GLFrameBuffer >> boundToDrawDuring: aBlock [

	^ manager bindDrawFrameBuffer: self during: aBlock
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 15:48'
}
GLFrameBuffer >> boundToReadDuring: aBlock [

	^ manager bindReadFrameBuffer: self during: aBlock
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 12:30'
}
GLFrameBuffer >> checkCompletionStatus [

	self checkCompletionStatusForRead.
	self checkCompletionStatusForDraw.
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusFor: targetEnum [

	| status |
	status := self completionStatusFor: targetEnum.
	status ~= GL_FRAMEBUFFER_COMPLETE ifTrue: [
		self error: (CompletionStatusDescriptions at: status)]
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusForDraw [

	self checkCompletionStatusFor: GL_DRAW_FRAMEBUFFER
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusForRead [

	self checkCompletionStatusFor: GL_READ_FRAMEBUFFER
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:23'
}
GLFrameBuffer >> clearBuffers: bufferBitMask [

	self stateAccessImp framebuffer: self clearBuffers: bufferBitMask
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:07'
}
GLFrameBuffer >> clearColorBuffer: i to: aColor [

	self flag: #todo. "respect actual type of color buffer"
	self clearColorBuffer: i toFloat32Vector4: aColor asVectorColor
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toFloat32Vector4: aFloat32Array [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aFloat32Array
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toIntegerVector4: anIntegerArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: anIntegerArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toUnsignedIntegerVector4: aWordArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aWordArray
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearDepthBufferTo: aFloat [

	self flag: #todo. "does FFI treat aFloat like a 1 element array?"
	self stateAccessImp framebuffer: self clearDepthBufferTo: aFloat
]

{
	#category : #clearing,
	#'squeak_changestamp' : 'stlu 3/11/2021 14:26'
}
GLFrameBuffer >> clearStencilBufferTo: anInteger [

	self flag: #todo. "does FFI treat anInteger like a 1 element array?"
	self stateAccessImp framebuffer: self clearStencilBufferTo: anInteger
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:27'
}
GLFrameBuffer >> colorAttachment0 [

	^ colorAttachment0
]

{
	#category : #completion,
	#'squeak_changestamp' : 'stlu 3/15/2021 13:15'
}
GLFrameBuffer >> completionStatusFor: targetEnum [

	^ self stateAccessImp
		frameBuffer: self
		completionStatusFor: targetEnum
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'stlu 11/3/2020 15:35'
}
GLFrameBuffer >> delete [
	
	GL deleteFramebuffers: 1 with: (IntegerArray with: id).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 10/29/2020 12:16'
}
GLFrameBuffer >> isFrameBuffer [

	^ true
]

{
	#category : #imps,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:19'
}
GLFrameBuffer >> stateAccessImp [

	^ manager stateAccessImp
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 10/26/2020 12:26'
}
GLFrameBuffer >> texture2D: aTexture [

	self texture2D: aTexture attachment: GL_COLOR_ATTACHMENT0
]

{
	#category : #attachments,
	#'squeak_changestamp' : 'stlu 11/3/2020 15:36'
}
GLFrameBuffer >> texture2D: aTexture attachment: anAttachment [
	
	self boundDuring: [
		anAttachment = GL_COLOR_ATTACHMENT0 ifTrue: [
			colorAttachment0 := aTexture ].
		GL framebufferTexture2D: GL_FRAMEBUFFER
			with: anAttachment
			with: GL_TEXTURE_2D
			with: aTexture id
			with: 0.
		GL checkForError]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:03'
}
GLFrameBuffer >> unbind [

	self unbindFromDraw.
	self unbindFromRead.
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:06'
}
GLFrameBuffer >> unbindFromDraw [

	manager drawFrameBuffer == self ifTrue: [
		manager unbindDrawFrameBuffer]
]

{
	#category : #binding,
	#'squeak_changestamp' : 'stlu 5/15/2021 16:07'
}
GLFrameBuffer >> unbindFromRead [

	manager readFrameBuffer == self ifTrue: [
		manager unbindReadFrameBuffer]
]
