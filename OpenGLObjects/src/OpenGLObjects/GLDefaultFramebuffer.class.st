Class {
	#name : #GLDefaultFramebuffer,
	#superclass : #GLAbstractFramebuffer,
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
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 15:00'
}
GLDefaultFramebuffer >> delete [

	self error: 'Cannot delete default framebuffer'.
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

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 7/28/2021 17:54'
}
GLDefaultFramebuffer >> unregister [

	"do nothing"
]
