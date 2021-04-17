Class {
	#name : #FFICallback,
	#superclass : #ExternalObject,
	#instVars : [
		'abi',
		'type',
		'evaluableObject',
		'thunk',
		'argTypes'
	],
	#classVars : [
		'ThunkToCallbackMap'
	],
	#category : #'OpenGL-FFI-Support',
	#commentStamp : ''
}

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> cdeclQsort: values with: number with: width with: callback [

	<cdecl: void 'qsort' (void* size_t size_t void*) module: 'msvcrt.dll'>
	^ self externalCallFailed
]

{
	#category : #'instance lookup',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> evaluateCallbackForContext: callbackContext [ "<FFIallbackContext> ^<Integer> typeCode"

	(ThunkToCallbackMap
		at: callbackContext thunkp getHandle
		ifAbsent: [^self error: 'could not locate Callback instance corresponding to thunk address'])
		ifNil: [self error: 'Callback instance for this thunk address has been garbage collected']
		ifNotNil:
			[:callback|
			^callback valueInContext: callbackContext]
]

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> exampleCqsort [
	"Call the libc qsort function (which requires a callback)."
	"FFICallback exampleCqsort"
	"(Time millisecondsToRun: [100 timesRepeat: [FFICallback exampleCqsort]]) / 100.0"

	| type cb rand nElements sizeofDouble values orig sort libcName knownLibcNames fn |

	knownLibcNames := #('libobjc.dylib' 'libgcc_s.1.dylib' 'libc.dylib' 'libc.so.6' 'libc.so' 'msvcrt.dll').
	libcName := Project uiManager chooseFrom: knownLibcNames title: 'Choose your libc'.
	libcName = 0 ifTrue: [^ self].
	libcName := knownLibcNames at: libcName.

	rand := Random new.
	type := ExternalType double.
	sizeofDouble := type byteSize.
	nElements := 10.
	values := ExternalData
		fromHandle: (ExternalAddress allocate: nElements * sizeofDouble)
		type: type asPointerType.
	"Initialize external data and set size for enumeration."
	1 to: nElements do: [:i| values at: i put: rand next].
	values size: nElements.
	"Fetch a local copy of the external data."
	orig := values collect: [:each | each].
	
	"Construct the callback structure."
	cb := FFICallback
			signature: '<callback: int (*)(double* double*)>'
			"signature: #(int 'double*' 'double*')"
			block: [ :arg1 :arg2 |
				| a  b |
				a := arg1 doubleAt: 1.
				b := arg2 doubleAt: 1.
				Transcript showln: ('Comparing {1} and {2}' format: {a. b}).
				"self halt."
				 (a - b) sign].
	
	"void qsort( void *base, size_t number, size_t width, int (__cdecl *compare )(const void *, const void *) );"
	fn := ExternalLibraryFunction
		name: 'qsort' module: libcName
		callType: ExternalLibraryFunction callTypeCDecl
		returnType: ExternalType void
		argumentTypes: (ExternalType lookupTypes: #('void*' size_t size_t 'void*')).
	
	"Invoke!"
	fn invokeWith: values "getHandle" with: nElements with: sizeofDouble with: cb thunk "getHandle".
	
	sort := values collect: [:each | each].
	values getHandle free.
	^orig -> sort
]

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> exampleCqsortThree [
	"Call the libc qsort function (which requires a callback)."
	"
	FFICallback exampleCqsortThree
	"
	"(Time millisecondsToRun: [100 timesRepeat: [FFICallback exampleCqsort]]) / 100.0"

	| type rand nElements sizeofDouble values orig sort cb |

	rand := Random new.
	type := ExternalType double.
	sizeofDouble := type byteSize.
	nElements := 10.
	values := ExternalData
		fromHandle: (ExternalAddress allocate: nElements * sizeofDouble)
		type: type asPointerType.
	"Initialize external data and set size for enumeration."
	1 to: nElements do: [:i| values at: i put: rand next].
	values size: nElements.
	"Fetch a local copy of the external data."
	orig := values collect: [:each | each].
		
	"Construct the callback structure."
	cb := FFICallback
			signature: '<callback: int (*)(double* double*)>'
			"signature: #(int 'double*' 'double*')"
			block: [ :arg1 :arg2 |
				| a  b |
				a := arg1 doubleAt: 1.
				b := arg2 doubleAt: 1.
				Transcript showln: ('Comparing {1} and {2}' format: {a. b}).
				self halt.
				 (a - b) sign].
	
		
	"Invoke!"
	self
		cdeclQsort: values  with: nElements with: sizeofDouble
		with: cb thunk.
	
	sort := values collect: [:each | each].
	values getHandle free.
	^orig -> sort
]

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> exampleCqsortTwo [
	"Call the libc qsort function (which requires a callback)."
	"
	FFICallback exampleCqsortTwo
	"
	"(Time millisecondsToRun: [100 timesRepeat: [FFICallback exampleCqsort]]) / 100.0"

	| type rand nElements sizeofDouble values orig sort |

	rand := Random new.
	type := ExternalType double.
	sizeofDouble := type byteSize.
	nElements := 10.
	values := ExternalData
		fromHandle: (ExternalAddress allocate: nElements * sizeofDouble)
		type: type asPointerType.
	"Initialize external data and set size for enumeration."
	1 to: nElements do: [:i| values at: i put: rand next].
	values size: nElements.
	"Fetch a local copy of the external data."
	orig := values collect: [:each | each].
		
	"Invoke!"
	self
		qsort: values  with: nElements with: sizeofDouble
		with:  [ :arg1 :arg2 |
				| a  b |
				a := arg1 doubleAt: 1.
				b := arg2 doubleAt: 1.
				Transcript showln: ('Comparing {1} and {2}' format: {a. b}).
				self halt.
				 (a - b) sign].
	
	sort := values collect: [:each | each].
	values getHandle free.
	^orig -> sort
]

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> exampleTest [
	"self exampleTest"
	| cb fn |
	cb := FFICallback
			signature: '<callback: int (*) ()>'
			block: [123].
	
	"void qsort( void *base, size_t number, size_t width, int (__cdecl *compare )(const void *, const void *) );"
	fn := ExternalLibraryFunction
		name: 'callbackTaking' module: 'libtest.so'
		callType: ExternalLibraryFunction callTypeCDecl
		returnType: ExternalType long
		argumentTypes: (ExternalType lookupTypes: #('void*')).
	
	"Invoke!"
	^ fn invokeWith: cb thunk
]

{
	#category : #'examples - signatures',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> getIntWithData: anExternalData1 withData: anExternalData2 [
	"
	(FFICallback class >> #getIntWithData:withData:) pragmaAt: #callback:
	"
	"<callback: int (*)(void* void*)>"
	
	self shouldNotImplement.
]

{
	#category : #'examples - signatures',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> getIntWithData: anExternalData1 withData: anExternalData2 withInt: anInteger1 withInt: anInteger2 [
	"
	(FFICallback class >> #getIntWithData:withData:withInt:withInt:) pragmaAt: #callback:
	"
	"<callback: int (*)(void* void* uint32_t intptr_t)>"
	
	self shouldNotImplement.
	
	
	self flag: #todo: "Ignore macros, const, and '*,' comma"
	"<signature: #(int CALLBACK (*)(const LOGFONT *, const TEXTMETRIC *, DWORD, LPARAM))>"

]

{
	#category : #'examples - signatures',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> getIntWithInt: anInteger withString: aString [
	"
	(FFICallback class >> #getIntWithInt:withString:) pragmaAt: #callback:
	"
	"<callback: int (*)(int char *)>"

	self shouldNotImplement.
]

{
	#category : #'examples - signatures',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> getVoidWithData: anExternalData withDouble: aFloat withDouble: anotherFloat [
	"
	(FFICallback class >> #getVoidWithData:withDouble:withDouble:) pragmaAt: #callback:
	"
	"<callback: void (*)(void* double double)>"
	
	self shouldNotImplement.
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> initialize [

	ThunkToCallbackMap := WeakValueDictionary new.
]

{
	#category : #constants,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> maxThunkSize [
	"see FFICallbackThunk initialize & initializeStdcall:; must be big enough for the largest thunk created"
	^ 40
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> message: message [ "<MessageSend> ^<FFICallback>"
	^ self new
		setMessage: message

]

{
	#category : #examples,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> qsort: values with: number with: width with: block [
	"Indirection to define the signature for the provided block."
	"<callback: int (*)(double* double*)>"
	
	| callback |
	callback := FFICallback
		signature: ((thisContext method pragmaAt: #callback:) argumentAt: 1)
		block: block.
			
	^ self cdeclQsort: values with: number with: width with: callback thunk
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> signature: signature "<String>" block: aBlock [ "<BlockClosure> ^<FFICallback>"
	^ self new
		setBlock: aBlock
		signature: signature
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback class >> signature: signature "<String>" message: message [ "<MessageSend> ^<FFICallback>"
	^ self new
		setMessage: message
		signature: signature
]

{
	#category : #'callback - evaluators',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> evaluateDynamic: callbackContext [
	"Read all arguments and make the call(back). Assume that 'handle' and 'type' are set correctly. Only watch out for the sign. See field definition in FFICallbackContext to explore alternative ways to read the arguments."
		
	| offsetFloatReg offsetIntReg args |
	offsetFloatReg := 1.
	offsetIntReg := 1.
	args := Array new: argTypes size - 1. "Skip return type"
	
	1 to: args size do: [:argIndex |
		| argType data useFloatReg offset |
		argType := argTypes at: argIndex + 1. "Skip return type"
		
		self flag: #todo. " does not consider stackPtr "
		useFloatReg := argType = ExternalType double or: [argType = ExternalType float].
		useFloatReg
			ifTrue: [
				offset := offsetFloatReg.
				self setArgData: callbackContext floatRegArgs]
			ifFalse: [
				offset := offsetIntReg.
				self setArgData: callbackContext intRegArgs].
		
		argType isPointerType
			ifTrue: [	
				data := (type handle: handle at: offset).
				
				argType referentClass "pointer to atomic"
					ifNil: [data := data asType: argType]
					ifNotNil: [:structClass | "pointer to external structure or union"
						"argType isTypeAliasToPointer
							ifTrue: [data := structClass fromHandle: data getHandle asByteArrayPointer]
							ifFalse: ["data := structClass fromHandle: data getHandle"]"] ]
			ifFalse: [ "non-pointer type"
				self flag: #floats. "mt: When should we switch to callbackContext floatRegArgs?"
				data := argType handle: handle at: offset.

				argType isAtomic
					ifFalse: ["structure type, most likely type alias to pointer"
						data := argType referentClass
							fromHandle: (ExternalAddress fromInteger: data) asByteArrayPointer]
					ifTrue: [ argType isTypeAlias
						ifTrue: [ "alias to atomic type"
							data := argType referentClass fromHandle: data]
						ifFalse: [ "atomic, non-pointer type"
							data := data ";-)"]] ].

		args at: argIndex put: data.
		
		offset := offset + ((type byteSize max: argType byteSize) roundUpTo: argType byteSize).
		useFloatReg ifTrue: [offsetFloatReg := offset] ifFalse: [offsetIntReg := offset]].
	
	^ self
		setResult: (evaluableObject valueWithArguments: args)
		inContext: callbackContext.
]

{
	#category : #'callback - evaluators',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> evaluateDynamic_ARM32: callbackContext [
	"Set handle to access arguments as most appropriate for the ABI. For ''RISCs'' it is the pointer to the integer register."
	<abi: 'ARM32'> <evaluator>
	
	self setArgData: callbackContext intRegArgs.
	^ self evaluateDynamic: callbackContext
]

{
	#category : #'callback - evaluators',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> evaluateDynamic_IA32: callbackContext [
	"Set handle to access arguments as most appropriate for the ABI. For x86 (i.e. IA32) it is the stack pointer."
	<abi: 'IA32'> <evaluator>
	
	self setArgData: callbackContext stackPtr.
	^ self evaluateDynamic: callbackContext
]

{
	#category : #'callback - evaluators',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> evaluateDynamic_X64: callbackContext [
	"Set handle to access arguments as most appropriate for the ABI. For ''RISCs'' it is the pointer to the integer register."
	<abi: 'X64'> <evaluator>
	
	^ self evaluateDynamic: callbackContext
]

{
	#category : #'callback - evaluators',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> evaluateDynamic_X64Win64: callbackContext [
	"Set handle to access arguments as most appropriate for the ABI. For ''RISCs'' it is the pointer to the integer register."
	<abi: 'X64Win64'> <evaluator>
	
	self setArgData: callbackContext intRegArgs.
	^ self evaluateDynamic: callbackContext
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__ccall [
	"Initialize the receiver with a __ccall thunk."

	FFICallback methodsDo: [:method |
		(method selector beginsWith: 'init__ccall') ifTrue: [
			(method hasPragma: #init) ifTrue: [
				(method pragmaAt: #abi:)
					ifNotNil: [:pragma | (pragma argumentAt: 1) = abi
						ifTrue: [^ self executeMethod: method]]]]].

	self error: 'Could not initialize thunk for current ABI: ', abi.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__ccall_ARM32 [
	<abi: 'ARM32'> <init>
	"Initialize the receiver with a __ccall thunk.  The thunk calls thunkEntry in the IA32ABI plugin,
	 whose source is in platforms/Cross/plugins/IA32ABI/arm32abicc.c.  thunkEntry is the entry point
	 for Callbacks. The objective of the thunk is to call thunkEntry with all arguments to the call of the
	 thunk (registers and stack) as well as a pointer to the thunk itself.  thunkEntry is as follows:
	
		long long
		thunkEntry(long r0, long r1, long r2, long r3,
		            double d0, double d1, double d2, double d3,
		            double d4, double d5, double d6, double d7,
		            void *thunkpPlus16, sqIntptr_t *stackp)

	thunkEntry then collects the various arguments (thunk, integer register arguments, floating-point
	register arguments, stack pointer) in a VMCallbackContext and invokes the callback via invokeCallbackContext:."

	"0x0 <thunk+0>:		mov     r12, sp			; 0xe1a0c00d
 	 0x4 <thunk+4>:		sub     sp, sp, #16		; 0xe24dd010
 	 0x8 <thunk+8>:		str     pc, [sp, #0]		; 0xe58df000 N.B. passes thunk+16; thunkEntry compensates
 	 0xc <thunk+12>:		str     r12, [sp,#4]		; 0xe58dc004
 	 0x10 <thunk+16>:	str     lr, [sp, #12]		; 0xe58de00c
 	 0x14 <thunk+20>:	ldr     r12, [pc, #8]		; 0xe59fc008
 	 0x18 <thunk+24>:	blx     r12				; 0xe12fff3c
 	 0x1c <thunk+28>:	add     sp, sp, #12		; 0xe28dd00c
 	 0x20 <thunk+32>:	ldr     pc, [sp], #4!		; 0xe49df004 ; pop     {pc}
 	 0x24 <thunk+36>:     .word thunkEntry"
	self flag: #hidden. "mt: How is the thunk's handle stored to lookup this instance upon callback later?"
	thunk getHandle
		unsignedLongAt:   1 put: 16re1a0c00d;
		unsignedLongAt:   5 put: 16re24dd010;
		unsignedLongAt:   9 put: 16re58df000;
		unsignedLongAt: 13 put: 16re58dc004;
		unsignedLongAt: 17 put: 16re58de00c;
		unsignedLongAt: 21 put: 16re59fc008;
		unsignedLongAt: 25 put: 16re12fff3c;
		unsignedLongAt: 29 put: 16re28dd00c;
		unsignedLongAt: 33 put: 16re49df004;
		shortPointerAt: 37 put: self thunkEntryAddress.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__ccall_IA32 [
	<abi: 'IA32'> <init>
	"Initialize the receiver with a __ccall thunk.  The thunk calls thunkEntry in the IA32ABI plugin,
	 whose source is in platforms/Cross/plugins/IA32ABI/x64win64abicc.c.  thunkEntry is the entry point
	 for Callbacks. The objective of the thunk is to call thunkEntry with all arguments to the call of the
	 thunk (registers and stack) as well as a pointer to the thunk itself.  thunkEntry is as follows:

		long
		thunkEntry(void *thunkp, sqIntptr_t *stackp)

	thunkEntry then collects the various arguments (thunk, stack pointer) in a VMCallbackContext and
	invokes the callback via invokeCallbackContext:."

	"thunk:		push   %esp				0x54							0xa1905454
	 thunk+01:	push   %esp				0x54
	 thunk+02:	nop   						0x90
	 thunk+03:	mov    $thunkEntry,%eax	0xb8 0x00 0x00 0x00 0x00	0x00000000 - entry
	 thunk+08:	nop   						0x90							0x68909090
	 thunk+09:	nop   						0x90
	 thunk+10:	nop   						0x90
	 thunk+11:	push   $thunk				0x68 0x00 0x00 0x00 0x00	0x00000000 - thunk
	 thunk+16:	call   *%eax					0xff 0xd0						0xc483d0ff
	 thunk+18:	add    $0xC,%esp			0x83 0xc4 0x0C				0x9090c30C
	 thunk+21:	ret							0xc3
	 thunk+22:	nop							0x90
	 thunk+23:	nop							0x90"
	thunk getHandle
		unsignedLongAt:  1 put: 16rB8905454;
		shortPointerAt: 5 put: self thunkEntryAddress;
		unsignedLongAt:  9 put: 16r68909090;
		shortPointerAt: 13 put: thunk getHandle;
		unsignedLongAt: 17 put: 16rC483D0FF;
		unsignedLongAt: 21 put: 16r9090C30C
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__ccall_X64 [
	<abi: 'X64'> <init>
	"Initialize the receiver with a __ccall thunk.  The thunk calls thunkEntry in the IA32ABI plugin,
	 whose source is in platforms/Cross/plugins/IA32ABI/x64sysvabicc.c.  thunkEntry is the entry point
	 for Callbacks. The objective of the thunk is to call thunkEntry with all arguments to the call of the
	 thunk (registers and stack) as well as a pointer to the thunk itself.  thunkEntry is as follows:

		long
		thunkEntry(long a0, long a1, long a2, long a3, long a4, long a5,
		            double d0, double d1, double d2, double d3,
		            double d4, double d5, double d6, double d7,
		            void *thunkp, sqIntptr_t *stackp)

	thunkEntry then collects the various arguments (thunk, integer register arguments, floating-point
	register arguments, stack pointer) in a VMCallbackContext and invokes the callback via invokeCallbackContext:."

	"thunk+0x0:	pushq  %rsp							54
	 thunk+0x1:	pushq  %rsp							54
	 thunk+0x4:	movabsq $thunk, %rax					48 b8 b0..b7 eight bytes of thunk address a.k.a. handle
	 thunk+0xc:	pushq  %rax							50
	 thunk+0xd:	movabsq $thunkEntry, %rax			48 b8 b0..b7 eight bytes of the thunkEntry address
	 thunk+0x17:	callq  *%rax							ff d0
	 thunk+0x19:	addq   $0x18, %rsp					48 83 c4 18
	 thunk+0x1d:	retq									c3
	 thunk+0x1e:	nop										90
	 thunk+0x1f:	nop										90"
	thunk getHandle
		unsignedLongAt:		  1 put: 16rb8485454;
		longPointerAt:			  5 put: thunk getHandle;
		unsignedLongAt:		13 put: 16r00b84850; "00 is the first byte of the 64-bit constant the movabsq/0x48 opcode moves"
		longPointerAt:			16 put: self thunkEntryAddress;
		unsignedByteAt:		24 put: 16rff;
		unsignedLongAt:		25 put: 16rc48348d0;
		unsignedLongAt:		29 put: 16r9090c318.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__ccall_X64Win64 [
	<abi: 'X64Win64'> <init>
	"Initialize the receiver with a __ccall thunk.  The thunk calls thunkEntry in the IA32ABI plugin,
	 whose source is in platforms/Cross/plugins/IA32ABI/x64win64abicc.c.  thunkEntry is the entry point
	 for Callbacks. The objective of the thunk is to call thunkEntry with all arguments to the call of the
	 thunk (registers and stack) as well as a pointer to the thunk itself.  thunkEntry is as follows:

		long long
		thunkEntry(long long rcx, long long rdx,
		      		long long r8, long long r9,
					void *thunkp, sqIntptr_t *stackp)

	thunkEntry then collects the various arguments (thunk, integer register arguments, stack pointer)
	in a VMCallbackContext and invokes the callback via invokeCallbackContext:."

	"thunk+0x0:	pushq  %rsp							54
	 thunk+0x1:	pushq  %rsp							54
	 thunk+0x4:	movabsq $thunk, %rax					48 b8 b0..b7 eight bytes of thunk address a.k.a. addressField
	 thunk+0xc:	pushq  %rax							50
	 thunk+0xd:	subq   $0x20, %rsp						48 83 c4 e0 (this is addq -20 since the immediate is signed extended)
	 thunk+0x11:	movabsq $thunkEntry, %rax			48 b8 b0..b7 eight bytes of the thunkEntry address
	 thunk+0x1b:	callq  *%rax							ff d0
	 thunk+0x1d:	addq   $0x38, %rsp					48 83 c4 38
	 thunk+0x21:	retq									c3
	 thunk+0x22:	nop										90
	 thunk+0x23:	nop										90"
	thunk getHandle
		unsignedLongAt:		  1 put: 16rb8485454;
		longPointerAt: 			  5 put: thunk getHandle;
		unsignedLongAt:		13 put: 16rc4834850; 
		unsignedLongAt:		17 put: 16r00b848e0; "00 is the first byte of the 64-bit constant the movabsq/0x48 opcode moves"
		longPointerAt:			20 put: self thunkEntryAddress;
		unsignedByteAt:		28 put: 16rff;
		unsignedLongAt:		29 put: 16rc48348d0;
		unsignedLongAt:		33 put: 16r9090c338.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__stdcall: numBytes [
	"Initialize the receiver with a __stdcall thunk with numBytes argument bytes."

	FFICallback methodsDo: [:method |
		(method selector beginsWith: 'init__stdcall') ifTrue: [
			(method hasPragma: #init) ifTrue: [
				(method pragmaAt: #abi:)
					ifNotNil: [:pragma | (pragma argumentAt: 1) = abi
						ifTrue: [^ self with: numBytes executeMethod: method]]]]].

	self error: 'Could not initialize thunk for current ABI: ', abi.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> init__stdcall_IA32: numBytes [
	<abi: 'IA32'> <init>
	"Initialize the receiver with a __stdcall thunk with numBytes argument bytes. (See #init__ccall_IA32 for more info)"
	"thunk:		push   %esp				0x54							0xa1905454
	 thunk+01:	push   %esp				0x54
	 thunk+02:	nop   						0x90
	 thunk+03:	mov    $thunkEntry,%eax	0xb8 0x00 0x00 0x00 0x00	0x00000000 - entry
	 thunk+08:	nop   						0x90							0x68909090
	 thunk+09:	nop   						0x90
	 thunk+10:	nop   						0x90
	 thunk+11:	push   $thunk				0x68 0x00 0x00 0x00 0x00	0x00000000 - thunk
	 thunk+16:	call   *%eax					0xff 0xd0						0xc483d0ff
	 thunk+18:	add    $0xC,%esp			0x83 0xc4 0x0C				0xBYTSc20C
	 thunk+21:	ret    $bytes				0xc2 0xBY 0xTS"

	thunk getHandle
		unsignedLongAt:  1 put: 16rB8905454;
		shortPointerAt: 5 put: self thunkEntryAddress;
		unsignedLongAt:  9 put: 16r68909090;
		shortPointerAt: 13 put: thunk getHandle;
		unsignedLongAt:  17 put: 16rC483D0FF;
		unsignedShortAt: 21 put: 16rC20C;
		unsignedShortAt: 23 put: numBytes.
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> primThunkEntryAddress [ "^<Integer>"
	"Answer the address of the entry-point for thunk callbacks:
		x86: long thunkEntry(void *thunkp, long *stackp);
		x64: long thunkEntry(long a, long b, long c, long d, long, e, long f,
								double d0, double d1, double d2, double d3,
								double d4, double d5, double d6, double d7,
								void *thunkp, long *stackp);
		ARM: long thunkEntry(long a, long b, long c, long d,
								double d0, double d1, double d2, double d3,
								double d4, double d5, double d6, double d7,
								void *thunkp, long *stackp);
	 etc.
	 This is the function a callback thunk/trampoline should call to initiate a callback."
	<primitive: 'primThunkEntryAddress' module: 'IA32ABI' error: errorCode>
	^self primitiveFailed
]

{
	#category : #callback,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setArgData: externalData [
	
	handle := externalData getHandle.
	type := externalData externalType.	
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setArgTypes: externalTypes evaluableObject: blockOrMessage [

	
	abi := FFIPlatformDescription current abi.
	handle := nil.
	type := nil.
	
	evaluableObject := blockOrMessage.
	argTypes := externalTypes.





	"Support for callee pop callbacks (Pascal calling convention such as the Win32 stdcall: convention) are supported using the <calleepops: N> pragma which specifies how many bytes to pop. See http://forum.world.st/Pharo-FFI-on-aarch64-arm64-td5096777.html#a5096786."
	thunk := FFICallbackMemory allocateExecutableBlock.
	self init__ccall.
	"self init__stdcall: 0."
	"(method pragmaAt: #calleepops:)
		ifNil: [self init__ccall]
		ifNotNil: [:pragma | self init__stdcall: (pragma argumentAt: 1)]."
		
	"numEvaluatorArgs := (evaluator := method selector) numArgs.
	self addToThunkTable"
	ThunkToCallbackMap at: thunk getHandle put: self
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setBlock: aBlock [
	"We cannot know the signature for an arbitrary block."
	
	self shouldNotImplement.
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setBlock: aBlock "<BlockClosure>" signature: signature [ "<String>"

	self
		setArgTypes: (ExternalType lookupTypes: signature)
		evaluableObject: aBlock.
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setMessage: aMessageSend [
	"Fetch the argTypes from <callback: ...> pragma in method."
	
	| method |
	self assert: [aMessageSend receiver notNil].
	
	method := aMessageSend receiver class lookupSelector: aMessageSend selector.
	
	self
		setArgTypes: ((method pragmaAt: #callback:) argumentAt: 1)
		evaluableObject: aMessageSend.
]

{
	#category : #initialization,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setMessage: aMessageSend signature: signature [
	"Override the argTypes from <callback: ...> pragma in method."
	
	self assert: [aMessageSend receiver notNil].
	
	self
		setArgTypes: (ExternalType lookupTypes: signature)
		evaluableObject: aMessageSend.
]

{
	#category : #callback,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> setResult: anObject inContext: aCallbackContext [
	"Set the result in the callback context. Add some fast checks to detect errors."
	
	argTypes first atomicType = 0 "void"
		ifTrue: [
			"Quick exit for void return type."
			^ aCallbackContext voidResult].

	anObject isInteger
		ifTrue: [
			self assert: [argTypes first isIntegerType].
			^ aCallbackContext wordResult: anObject].

	anObject isBoolean
		ifTrue: [
			self assert: [argTypes first atomicType = 1 "bool"].
			^ aCallbackContext wordResult: anObject].		

	anObject isFloat
		ifTrue: [
			self assert: [argTypes first atomicType >= 12 "float/double"].			
			^ aCallbackContext floatResult: anObject].

	"Try to push pointer for external object."
	^ aCallbackContext externalObjectResult: anObject
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> thunk [

"	self flag: #debugging.
	^ FFICallbackMemory new
		externalPointer: thunk getHandle;
		yourself"
	^ thunk
]

{
	#category : #'initialization - thunk prepare',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> thunkEntryAddress [

	^ ExternalAddress fromInteger: self primThunkEntryAddress
]

{
	#category : #callback,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallback >> valueInContext: callbackContext [ "<FFICallbackContext> ^<Integer>"
	
	FFICallback methodsDo: [:method |
		(method hasPragma: #evaluator) ifTrue: [
			(method pragmaAt: #abi:)
				ifNotNil: [:pragma | (pragma argumentAt: 1) = abi
					ifTrue: [^ self with: callbackContext executeMethod: method]]]].
		
	self error: 'Could find evaluator for current ABI: ', abi.
]
