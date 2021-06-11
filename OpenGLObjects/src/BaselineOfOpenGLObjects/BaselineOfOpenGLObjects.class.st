Class {
	#name : #BaselineOfOpenGLObjects,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenGLObjects
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 6/11/2021 10:20'
}
BaselineOfOpenGLObjects >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			project: 'FFI' with: [
				spec
					className: 'ConfigurationOfFFI';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					version: '2.0'];
			baseline: 'OpenGL' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/'];
			baseline: '3DTransform' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/3DTransform/src/'];
		
			package: 'OpenGLObjects' with: [spec requires: #('OpenGL' '3DTransform' 'FFI')].
			
		
		spec
			group: 'default' with: #('all');
			group: 'all' with: #('OpenGLObjects')]
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
