"
As GLAnySamplesPassed, except that the implementation may use a less accurate algorithm, which may be faster, but at the cost of more more false positives.
"
Class {
	#name : #GLAnySamplesPassedConservativeQuery,
	#superclass : #GLOcclusionQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:30'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLAnySamplesPassedConservativeQuery class >> target [

	^ GL_ANY_SAMPLES_PASSED_CONSERVATIVE
]
