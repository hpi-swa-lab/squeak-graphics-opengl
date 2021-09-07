"
Records the current time of the GPU.
"
Class {
	#name : #GLTimeStampQuery,
	#superclass : #GLCounterQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:26'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:33'
}
GLTimeStampQuery class >> target [

	^ GL_TIMESTAMP
]
