"
Answers false if none of the scoped drawing commands generate samples that pass the depth test; otherwise, answers true.
"
Class {
	#name : #GLAnySamplesPassedQuery,
	#superclass : #GLOcclusionQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:29'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLAnySamplesPassedQuery class >> target [

	^ GL_ANY_SAMPLES_PASSED
]
