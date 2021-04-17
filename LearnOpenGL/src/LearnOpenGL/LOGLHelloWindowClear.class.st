"
1.1.2
"
Class {
	#name : #LOGLHelloWindowClear,
	#superclass : #LOGLHelloWindow,
	#category : #'LearnOpenGL-GettingStarted',
	#commentStamp : 'stlu 12/14/2020 15:50'
}

{
	#category : #rendering,
	#timestamp : 'stlu 4/15/2021 12:10'
}
LOGLHelloWindowClear >> render [

	GL clearColor: (Color r: 0.2 g: 0.3 b: 0.3).
	GL clear: GL_COLOR_BUFFER_BIT
]
