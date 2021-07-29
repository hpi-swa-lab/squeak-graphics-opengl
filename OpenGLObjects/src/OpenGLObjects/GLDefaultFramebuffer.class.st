Class {
	#name : #GLDefaultFramebuffer,
	#superclass : #GLFramebuffer,
	#category : #'OpenGLObjects-Framebuffers'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 5/15/2021 14:29'
}
GLDefaultFramebuffer class >> create [

	self shouldNotImplement
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 7/26/2021 13:33'
}
GLDefaultFramebuffer class >> instance [

	^ self manager defaultFramebuffer
]

{
	#category : #testing,
	#'squeak_changestamp' : 'stlu 5/11/2021 12:57'
}
GLDefaultFramebuffer >> hasValidID [

	^ false
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 5/15/2021 14:28'
}
GLDefaultFramebuffer >> register [

	"do nothing"
]
