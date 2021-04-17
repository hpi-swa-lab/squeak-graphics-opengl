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
	#category : #'OpenGLObjects-FrameBuffers',
	#commentStamp : 'stlu 11/13/2020 18:20'
}

{
	#category : #allocation,
	#timestamp : 'stlu 11/30/2020 19:49'
}
GLFrameBuffer class >> allocate: n in: anIntegerArray [

	GL genFramebuffers: n with: anIntegerArray
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 18:37'
}
GLFrameBuffer class >> boundToDraw [

	^ GLObjectBindings current drawFrameBuffer
]

{
	#category : #binding,
	#timestamp : 'stlu 3/14/2021 18:36'
}
GLFrameBuffer class >> boundToRead [

	^ GLObjectBindings current readFrameBuffer
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/3/2020 14:54'
}
GLFrameBuffer class >> defaultTarget [

	^ GL_FRAMEBUFFER
]

{
	#category : #accessing,
	#timestamp : 'stlu 12/3/2020 19:28'
}
GLFrameBuffer class >> display [

	^ GLDisplayFrameBuffer create
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 1/9/2021 13:46'
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
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:43'
}
GLFrameBuffer class >> unbind [

	self unbindFromReadAndDraw
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:42'
}
GLFrameBuffer class >> unbindFromDraw [

	self display bindToDraw
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:42'
}
GLFrameBuffer class >> unbindFromRead [

	self display bindToRead
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:42'
}
GLFrameBuffer class >> unbindFromReadAndDraw [

	self display bindToReadAndDraw
]

{
	#category : #converting,
	#timestamp : 'stlu 11/3/2020 15:35'
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
	#timestamp : 'stlu 1/9/2021 14:05'
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
	#timestamp : 'stlu 1/9/2021 14:05'
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
	#timestamp : 'stlu 1/9/2021 13:58'
}
GLFrameBuffer >> attachRenderbuffer: aRenderbuffer to: attachmentEnum [

	self stateAccessImp
		framebuffer: self
		attachRenderbuffer: aRenderbuffer
		to: attachmentEnum
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:13'
}
GLFrameBuffer >> bind [

	self bindToReadAndDraw
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:13'
}
GLFrameBuffer >> bindToDraw [

	GL bindFramebuffer: GL_DRAW_FRAMEBUFFER with: id.
	GLObjectBindings current drawFrameBuffer: self
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:12'
}
GLFrameBuffer >> bindToRead [

	GL bindFramebuffer: GL_READ_FRAMEBUFFER with: id.
	GLObjectBindings current readFrameBuffer: self
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 13:14'
}
GLFrameBuffer >> bindToReadAndDraw [

	GL bindFramebuffer: GL_DRAW_FRAMEBUFFER with: id.
	GLObjectBindings current
		drawFrameBuffer: self;
		readFrameBuffer: self
]

{
	#category : #blitting,
	#timestamp : 'stlu 1/9/2021 14:31'
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
	#timestamp : 'stlu 1/9/2021 14:31'
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
	#timestamp : 'stlu 3/15/2021 12:14'
}
GLFrameBuffer >> boundDuring: aBlock [

	self boundToReadAndDrawDuring: aBlock
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:08'
}
GLFrameBuffer >> boundToDrawDuring: aBlock [

	| previous |
	self flag: #todo. "fast path does not restore binding on block exit"
	(previous := self class boundToDraw) = self ifTrue: [^ aBlock value].
	self bindToDraw.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbindDraw]
			ifNotNil: [previous bindToDraw]]
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:10'
}
GLFrameBuffer >> boundToReadAndDrawDuring: aBlock [

	| previousRead previousDraw |
	previousRead := self class boundToRead.
	previousDraw := self class boundToDraw.
	(self = previousRead and: [self = previousDraw]) ifTrue: [^ aBlock value].
	self bindToReadAndDraw.
	^ aBlock ensure: [
		previousRead = previousDraw
			ifTrue: [
				previousRead bindToReadAndDraw]
			ifFalse: [
				previousRead bindToRead.
				previousDraw bindToDraw]]
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:02'
}
GLFrameBuffer >> boundToReadDuring: aBlock [

	| previous |
	(previous := self class boundToRead) = self ifTrue: [^ aBlock value].
	self bindToRead.
	^ aBlock ensure: [
		previous
			ifNil: [self class unbindRead]
			ifNotNil: [previous bindToRead]]
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 12:30'
}
GLFrameBuffer >> checkCompletionStatus [

	self checkCompletionStatusForRead.
	self checkCompletionStatusForDraw.
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusFor: targetEnum [

	| status |
	status := self completionStatusFor: targetEnum.
	status ~= GL_FRAMEBUFFER_COMPLETE ifTrue: [
		self error: (CompletionStatusDescriptions at: status)]
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusForDraw [

	self checkCompletionStatusFor: GL_DRAW_FRAMEBUFFER
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 12:31'
}
GLFrameBuffer >> checkCompletionStatusForRead [

	self checkCompletionStatusFor: GL_READ_FRAMEBUFFER
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:23'
}
GLFrameBuffer >> clearBuffers: bufferBitMask [

	self stateAccessImp framebuffer: self clearBuffers: bufferBitMask
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:07'
}
GLFrameBuffer >> clearColorBuffer: i to: aColor [

	self flag: #todo. "respect actual type of color buffer"
	self clearColorBuffer: i toFloat32Vector4: aColor asVectorColor
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toFloat32Vector4: aFloat32Array [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aFloat32Array
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toIntegerVector4: anIntegerArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: anIntegerArray
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearColorBuffer: i toUnsignedIntegerVector4: aWordArray [

	self stateAccessImp
		framebuffer: self
		clearColorBuffer: GL_DRAW_BUFFER0 + i
		toFloat32Vector4: aWordArray
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:25'
}
GLFrameBuffer >> clearDepthBufferTo: aFloat [

	self flag: #todo. "does FFI treat aFloat like a 1 element array?"
	self stateAccessImp framebuffer: self clearDepthBufferTo: aFloat
]

{
	#category : #clearing,
	#timestamp : 'stlu 3/11/2021 14:26'
}
GLFrameBuffer >> clearStencilBufferTo: anInteger [

	self flag: #todo. "does FFI treat anInteger like a 1 element array?"
	self stateAccessImp framebuffer: self clearStencilBufferTo: anInteger
]

{
	#category : #accessing,
	#timestamp : 'stlu 10/26/2020 12:27'
}
GLFrameBuffer >> colorAttachment0 [

	^ colorAttachment0
]

{
	#category : #completion,
	#timestamp : 'stlu 3/15/2021 13:15'
}
GLFrameBuffer >> completionStatusFor: targetEnum [

	^ self stateAccessImp
		frameBuffer: self
		completionStatusFor: targetEnum
]

{
	#category : #'initialize-release',
	#timestamp : 'stlu 11/3/2020 15:35'
}
GLFrameBuffer >> delete [
	
	GL deleteFramebuffers: 1 with: (IntegerArray with: id).
]

{
	#category : #testing,
	#timestamp : 'stlu 12/14/2020 12:12'
}
GLFrameBuffer >> isAllocated [

	^ GL isFramebuffer: id
]

{
	#category : #testing,
	#timestamp : 'stlu 10/29/2020 12:16'
}
GLFrameBuffer >> isFrameBuffer [

	^ true
]

{
	#category : #imps,
	#timestamp : 'stlu 1/9/2021 13:56'
}
GLFrameBuffer >> stateAccessImp [

	^ GLFramebufferDirectStateAccessImp new
]

{
	#category : #attachments,
	#timestamp : 'stlu 10/26/2020 12:26'
}
GLFrameBuffer >> texture2D: aTexture [

	self texture2D: aTexture attachment: GL_COLOR_ATTACHMENT0
]

{
	#category : #attachments,
	#timestamp : 'stlu 11/3/2020 15:36'
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
	#timestamp : 'stlu 3/15/2021 12:35'
}
GLFrameBuffer >> unbind [

	self unbindFromReadAndDraw
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:44'
}
GLFrameBuffer >> unbindFromDraw [

	self flag: #todo. "should the instance-side methods only unbind when the bound object = self?"
	self class unbindFromDraw
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:34'
}
GLFrameBuffer >> unbindFromRead [

	self class unbindFromRead
]

{
	#category : #binding,
	#timestamp : 'stlu 3/15/2021 12:35'
}
GLFrameBuffer >> unbindFromReadAndDraw [

	self class unbindFromReadAndDraw
]
