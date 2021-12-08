Class {
	#name : #GLFramebufferRenderbufferAttachment,
	#superclass : #GLFramebufferAttachment,
	#instVars : [
		'renderbuffer'
	],
	#category : #'OpenGLObjects-Framebuffers'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'stlu 12/7/2021 17:58'
}
GLFramebufferRenderbufferAttachment class >> renderbuffer: aRenderbuffer [

	^ self basicNew setRenderbuffer: aRenderbuffer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:58'
}
GLFramebufferRenderbufferAttachment >> renderbuffer [

	^ renderbuffer
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'stlu 12/7/2021 17:58'
}
GLFramebufferRenderbufferAttachment >> setRenderbuffer: aRenderbuffer [

	renderbuffer := aRenderbuffer.
]
