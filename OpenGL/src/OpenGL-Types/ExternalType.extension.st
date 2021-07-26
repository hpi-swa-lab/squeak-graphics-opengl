Extension { #name : #ExternalType }

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 7/23/2021 12:10'
}
ExternalType class >> GLDEBUGPROC [

	^ FFICallback externalType asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCAMD [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCARB [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLDEBUGPROCKHR [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLLeglClientBufferEXT [

	^ self void asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLLeglImageOES [

	^ self void asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:30'
}
ExternalType class >> GLVULKANPROCNV [

	^ self GLDEBUGPROC
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLbitfield [

	^ self uint32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 10/26/2020 14:23'
}
ExternalType class >> GLboolean [

	^ self bool
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLbyte [

	^ self int8_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLchar [

	^ self signedChar
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLcharARB [

	^ self GLchar
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampd [

	^ self double
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampf [

	^ self float
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLclampx [

	^ self int32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLdouble [

	^ self double
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:32'
}
ExternalType class >> GLeglClientBufferEXT [

	^ self void asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:32'
}
ExternalType class >> GLeglImageOES [

	^ self void asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLenum [

	^ self uint32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfixed [

	^ self int32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfixedARG [

	^ self GLfixed
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLfloat [

	^ self float
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLhalf [

	^ self uint16_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLhalfARB [

	^ self GLhalf
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:28'
}
ExternalType class >> GLhalfNV [

	^ self GLhalf
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:33'
}
ExternalType class >> GLhandleARB [

	^ self uint32_t "void* on Apple"
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint [

	^ self int32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint64 [

	^ self int64_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLint64EXT [

	^ self GLint64
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLintptr [

	^ self intptr_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLintptrARB [

	^ self GLintptr
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLshort [

	^ self int16_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizei [

	^ self int32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizeiptr [

	^ self intptr_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsizeiptrARB [

	^ self GLsizeiptr
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLsync [

	^ self void asPointerType
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLubyte [

	^ self uint8_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint [

	^ self uint32_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint64 [

	^ self uint64_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLuint64EXT [

	^ self GLuint64
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLushort [

	^ self uint16_t
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 3/3/2021 14:30'
}
ExternalType class >> GLvdpauSurfaceNV [

	^ self GLintptr
]

{
	#category : #'*OpenGL-Types',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalType class >> GLvoid [

	^ self void
]
