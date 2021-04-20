Class {
	#name : #BaselineOf3DTransform,
	#superclass : #BaselineOf,
	#category : #BaselineOf3DTransform
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 22:14'
}
BaselineOf3DTransform >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			package: '3DTransform'.
		
		spec
			group: 'default' with: #('all');
			group: 'all' with: #('3DTransform')]
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
