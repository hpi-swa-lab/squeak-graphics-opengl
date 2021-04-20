Class {
	#name : #BaselineOfLearnOpenGL,
	#superclass : #BaselineOf,
	#category : #BaselineOfLearnOpenGL
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfLearnOpenGL >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"dummy placeholder"]
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfLearnOpenGL >> projectClass [

	^ self environment
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
