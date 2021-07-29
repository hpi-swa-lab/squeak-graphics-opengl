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
