Extension { #name : #Collection }

{
	#category : #'*OpenGLObjects',
	#'squeak_changestamp' : 'stlu 10/28/2020 14:16'
}
Collection class >> new: sizeRequested during: aBlock [

	^ aBlock value: (self new: sizeRequested)
]
