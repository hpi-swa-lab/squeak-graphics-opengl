Class {
	#name : #BaselineOfOpenGL,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenGL
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 6/21/2022 11:05'
}
BaselineOfOpenGL >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			project: 'FFI' with: [
				spec
					className: 'ConfigurationOfFFI';
					repository: 'http://www.squeaksource.com/MetacelloRepository';
					versionString: #development];
			"baseline: 'GLFW' with: [
				spec
					repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/GLFW/src/';
					loads: #('openGL')];"
			
			package: 'OpenGL-Constants';
			package: 'OpenGL-Types' with: [spec requires: #('FFI')];
			package: 'OpenGL-Generation' with: [spec requires: #('OpenGL-Types' 'OpenGL-Constants')];
			package: 'OpenGL-Core' with: [spec requires: #('OpenGL-Generation' 'OpenGL-Constants')];
			package: 'OpenGL-Balloon3D' with: [spec requires: #('OpenGL-Core')];
			package: 'OpenGL-Examples' with: [
				spec
					requires: #('OpenGL-Core');
					"includes: #('GLFW');"
					postLoadDoIt: #postLoadForExamples].
		
		spec
			group: 'default' with: #('all');
			group: 'core' with: #('OpenGL-Core' 'OpenGL-Versions');
			group: 'all' with: #('core' 'OpenGL-Balloon3D' 'OpenGL-Examples')].
]

{
	#category : #scripts,
	#'squeak_changestamp' : 'stlu 9/22/2021 14:36'
}
BaselineOfOpenGL >> postLoadForExamples [

	GLLibraryMethods loadCommands: #(
		"Used during context creation"
		glGetString
		glGetStringi
		glGetIntegerv
		glGetError

		"Universally required"
		glClearColor
		glClear

		"Deprecated OpenGL"
		glDisable
		glRotatef
		glColor3f
		glBegin
		glVertex2f
		glEnd).
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
