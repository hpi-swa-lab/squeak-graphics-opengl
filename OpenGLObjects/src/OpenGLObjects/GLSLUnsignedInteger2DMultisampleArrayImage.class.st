Class {
	#name : #GLSLUnsignedInteger2DMultisampleArrayImage,
	#superclass : #GLSLImage,
	#category : #'OpenGLObjects-Types'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleArrayImage class >> declarators [

	^ #('uimage2DMSArray')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleArrayImage class >> enum [

	^ GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleArrayImage class >> enumName [

	^ 'UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleArrayImage class >> pixelType [

	^ GLSLUnsignedInteger instance
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'stlu 12/15/2020 13:03'
}
GLSLUnsignedInteger2DMultisampleArrayImage class >> squeakName [

	^ 'UnsignedInteger2DMultisampleArrayImage'
]
