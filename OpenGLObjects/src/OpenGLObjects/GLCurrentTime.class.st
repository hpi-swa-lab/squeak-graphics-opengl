"
Records the current time of the GPU.
"
Class {
	#name : #GLCurrentTime,
	#superclass : #GLCounterQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:26'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:33'
}
GLCurrentTime class >> target [

	^ GL_TIMESTAMP
]
