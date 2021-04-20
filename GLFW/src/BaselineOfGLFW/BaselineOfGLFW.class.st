Class {
	#name : #BaselineOfGLFW,
	#superclass : #BaselineOf,
	#category : #BaselineOfGLFW
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 13:28'
}
BaselineOfGLFW >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			project: 'FFI' with: [
				spec
					className: 'ConfigurationOfFFI';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					versionString: #development;
					loads: #('Core' 'Tools' 'Callbacks')];
			baseline: 'OpenGL' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/'];
			
			package: 'GLFW-FFI-Support' with: [spec requires: #('FFI')];
			package: 'GLFW-Core' with: [spec requires: #('GLFW-FFI-Support')];
			package: 'GLFW-OpenGL' with: [spec requires: #('GLFW-Core' 'OpenGL')].
		
		spec
			group: 'default' with: #('openGL');
			group: 'core' with: #('GLFW-Core');
			group: 'openGL' with: #('GLFW-OpenGL')]
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