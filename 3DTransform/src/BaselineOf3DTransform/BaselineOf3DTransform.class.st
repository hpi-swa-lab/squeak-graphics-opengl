Class {
	#name : #BaselineOf3DTransform,
	#superclass : #BaselineOf,
	#category : #BaselineOf3DTransform
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOf3DTransform >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"dummy placeholder"]
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOf3DTransform >> projectClass [

	^ self environment
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
