Class {
	#name : #BaselineOfOpenGL,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenGL
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 4/20/2021 19:52'
}
BaselineOfOpenGL >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			project: 'FFI' with: [
				spec
					className: 'ConfigurationOfFFI';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					versionString: #development;
					loads: #('Core')];
			
			package: 'OpenGL-Types' with: [spec requires: #('FFI')];
			package: 'OpenGL-Core' with: [spec requires: #('FFI' 'OpenGL-Types')];
			package: 'OpenGL-Versions' with: [spec requires: #('OpenGL-Core')];
			package: 'OpenGL-Generation' with: [spec requires: #('OpenGL-Types')];
			package: 'OpenGL-Balloon3D' with: [spec requires: #('OpenGL-Core')].
		
		spec
			group: 'default' with: #('all');
			group: 'core' with: #('OpenGL-Core' 'OpenGL-Versions');
			group: 'generation' with: #('OpenGL-Generation');
			group: 'balloon3D' with: #('OpenGL-Balloon3D');
			group: 'all' with: #('core' 'generation' 'balloon3D')]
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfOpenGL >> projectClass [

	^ Smalltalk
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
