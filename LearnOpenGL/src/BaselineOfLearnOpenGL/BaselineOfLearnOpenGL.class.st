Class {
	#name : #BaselineOfLearnOpenGL,
	#superclass : #BaselineOf,
	#category : #BaselineOfLearnOpenGL
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'stlu 04/20/2021 20:56'
}
BaselineOfLearnOpenGL >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'OpenGL' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGL/src/'];
			baseline: 'OpenGLObjects' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/OpenGLObjects/src/'];
			baseline: '3DTransform' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/3DTransform/src/'];
			baseline: 'GLFW' with: [
				spec repository: 'github://hpi-swa-lab/squeak-graphics-opengl:main/GLFW/src/'];
			
			package: 'LearnOpenGL-Core' with: [spec requires: #('OpenGL' 'OpenGLObjects' 'GLFW' '3DTransform')];
			package: 'LearnOpenGL-GettingStarted' with: [spec requires: #('LearnOpenGL-Core')];
			package: 'LearnOpenGL-Advanced' with: [spec requires: #('LearnOpenGL-Core')];
			package: 'LearnOpenGL-Breakout' with: [spec requires: #('LearnOpenGL-Core')].
		
		spec
			group: 'default' with: #('all');
			group: 'core' with: #('LearnOpenGL-Core');
			group: 'gettingStarted' with: #('LearnOpenGL-GettingStarted');
			group: 'advanced' with: #('LearnOpenGL-Advanced');
			group: 'breakout' with: #('LearnOpenGL-Breakout');
			group: 'all' with: #('core' 'gettingStarted' 'advanced' 'breakout')]
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
