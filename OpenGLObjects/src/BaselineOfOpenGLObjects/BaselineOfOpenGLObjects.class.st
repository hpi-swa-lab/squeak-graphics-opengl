Class {
	#name : #BaselineOfOpenGLObjects,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenGLObjects
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfOpenGLObjects >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"dummy placeholder"]
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfOpenGLObjects >> projectClass [

	^ self environment
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
