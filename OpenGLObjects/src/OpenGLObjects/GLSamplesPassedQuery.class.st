"
The number of samples that pass the depth test for all drawing commands within the scope of the query.
"
Class {
	#name : #GLSamplesPassedQuery,
	#superclass : #GLOcclusionQuery,
	#category : #'OpenGLObjects-Queries',
	#'squeak_changestamp' : 'stlu 5/24/2021 14:28'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 5/24/2021 17:35'
}
GLSamplesPassedQuery class >> target [

	^ GL_SAMPLES_PASSED
]
