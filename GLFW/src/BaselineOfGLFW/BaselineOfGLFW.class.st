Class {
	#name : #BaselineOfGLFW,
	#superclass : #BaselineOf,
	#category : #BaselineOfGLFW
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 9/25/2021 00:50'
}
BaselineOfGLFW >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			project: 'FFI' with: [
				spec
					className: 'ConfigurationOfFFI';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					versionString: #development];
			baseline: 'OpenGL' with: [
				spec
					repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/';
					loads: #('core')];
			
			package: 'GLFW-Core' with: [spec requires: #('FFI')];
			package: 'GLFW-OpenGL' with: [spec requires: #('GLFW-Core' 'OpenGL')].
		
		spec
			group: 'default' with: #('all');
			group: 'core' with: #('GLFW-Core');
			group: 'openGL' with: #('GLFW-OpenGL');
			group: 'all' with: #('core' 'openGL')]
]

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfGLFW >> projectClass [

	^ Smalltalk
		at: #MetacelloCypressBaselineProject
		ifAbsent: [super projectClass]
]
