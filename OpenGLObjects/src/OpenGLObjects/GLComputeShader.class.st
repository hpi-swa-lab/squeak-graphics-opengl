Class {
	#name : #GLComputeShader,
	#superclass : #GLShader,
	#category : #'OpenGLObjects-Shaders',
	#commentStamp : ''
}

{
	#category : #accessing,
	#timestamp : 'stlu 10/28/2020 17:50'
}
GLComputeShader class >> type [

	^ GL_COMPUTE_SHADER
]
