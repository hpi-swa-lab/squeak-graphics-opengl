Class {
	#name : #FFICallbackContext,
	#superclass : #ExternalStructure,
	#category : #'OpenGL-FFI-Support',
	#commentStamp : ''
}

{
	#category : #'field definition',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext class >> fields [
	"
	self defineFields.
	"
	^ #(
		(thunkp		'void*')
		(stackPtr		'intptr_t*')	"was: char*"
		(intRegArgs		'intptr_t*')	"was: long* or int*"
		(floatRegArgs	'double*')
		(nil				'void*')		"was: savedCStackPointer"
		(nil				'void*')		"was: savedCFramePointer"
		(rvs				'FFICallbackResult')
	)
	
"
typedef struct {
    void *thunkp;
    char *stackptr;
    long *intRegArgs;
    double *floatRegArgs;
    void *savedCStackPointer;
    void *savedCFramePointer;
    union {
                            intptr_t vallong;
                            struct { int low, high; } valleint64;
                            struct { int high, low; } valbeint64;
                            double valflt64;
                            struct { void *addr; intptr_t size; } valstruct;
                        }   rvs;
	void *savedPrimFunctionPointer;
	jmp_buf	trampoline;
	jmp_buf	savedReenterInterpreter;
 } VMCallbackContext;
"
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext class >> fromHandle: aHandleOrInteger [

	^ super fromHandle: (aHandleOrInteger isInteger
		ifTrue: [ExternalAddress fromInteger: aHandleOrInteger]
		ifFalse: [aHandleOrInteger])
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> errorResult [

	^ self wordResult: -1
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> externalObjectResult: anExternalObject [
	"ExternalStructure, ExternalUnion, ExternalData ... handle MUST BE an ExternalAddress"
	
	^ self pointerResult: anExternalObject getHandle
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> floatResult: aFloat [

	self rvs floatResult: aFloat.
	^ 3
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> pointerResult: anExternalAddress [

	^ self wordResult: anExternalAddress asInteger
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> voidResult [

	self flag: #discuss. "mt: Is this the expected answer in the IA32ABI plugin?"
	^ self wordResult: 0
]

{
	#category : #'callback result',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackContext >> wordResult: aValue [
	"Accept any value in the -2^31 to 2^32-1 range or booleans."

	aValue isBoolean ifTrue:
		[self rvs booleanResult: aValue].
	
	aValue isInteger ifTrue:
		[aValue >= 0
			ifTrue: [self rvs positiveIntegerResult: aValue]
			ifFalse: [self rvs integerResult: aValue]].

	^1
]
