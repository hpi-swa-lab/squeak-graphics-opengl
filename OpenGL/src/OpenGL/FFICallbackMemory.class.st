"
Interface for memory allocation using the IA32ABI plugin. Also used as a compatibility layer for Alien.

***

An instance of FFICallbackThunk is a reference to a machine-code thunk/trampoline that calls-back into the VM.  The reference can be passed to C code which can use it as a function pointer through which to call-back into Smalltalk.  The machine-code thunk/trampoline is different for each instance, hence its address is a unique key that can be used to assocuate the Smalltalk side of the call-back (e.g. a block) with the thunk.  Since thunks must be executable and some OSs may not provide default execute permission on memory returned by malloc we may not be able to use malloc directly.  Instead we rely on a primitive to provide memory that is guaranteed to be executable.  ExternalAddress class>>allocateExecutablePage answers an instance of ExternalData that references an executable piece of memory that is some (possiby unitary) multiple of the pagesize.  Class-side code then parcels out pieces of a page to individual thunks.  These pieces are recycled when thunks are reclaimed.  Since the first byte of a thunk is non-zero we can use it as a flag indicating if the piece is in use or not.

See FFICallback for the higher-level construct that represents a Smalltalk block to be run in response to a callback.  Callbacks wrap instances of FFICallbackThunk and FFICallbackContext instances that describe the stack layout and register contents for receiving callback arguments.

Class Variables
AccessProtect <Semaphore> critical section for ExecutablePages (de)allocation
AllocatedThunks <AlienWeakTable of <FFICallbackThunk -> Integer>> - weak collection of thunks, used to return thunk storage to the executable page pool.
ExecutablePages <Set of: Alien ""executable page""> - collection of pages with execute permissions used to provide executable thunks
"
Class {
	#name : #FFICallbackMemory,
	#superclass : #ByteArray,
	#type : #bytes,
	#classVars : [
		'AccessProtect',
		'AllocatedThunks',
		'ExecutablePages',
		'LifoCallbackSemaphore'
	],
	#category : #'OpenGL-FFI-Support',
	#commentStamp : 'stlu 11/13/2020 18:20'
}

{
	#category : #'executable pages',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> allocateExecutableBlock [

	| blockSize |
	blockSize := FFICallback maxThunkSize.
	AccessProtect critical:
		[ExecutablePages do:
			[:page |
			1 to: page size - blockSize by: blockSize do:
				[:i|
				(page at: i) = 0 ifTrue:
					[page at: i put: 1.
					 ^ page blockAt: i byteSize: blockSize]]]].
	AccessProtect critical: [
		| newPage |
		newPage := ExecutablePages add: self allocateExecutablePage.
		^ (newPage blockAt: 1 byteSize: blockSize)
			at: 1 put: 1;
			yourself]
]

{
	#category : #'executable pages',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> allocateExecutablePage [
	"Forward allocation to ExternalAddress, which already sends primitives to allocate memory."
	
	^ ExternalAddress allocateExecutablePage
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> ensureInSpecialObjectsArray [
	"FFICallbackMemory must be in the specialObjectsArray to enable the FFI callback mechanism.  Because of
	 the bootstrap the specialObjectsArray may already have been partially initialized with
	 the callback selector and to be large enough (as part of loading immutability), but
	 it will be missing FFICallbackMemory until FFICallbackMemory is loaded.  So check if the specialObjectsArray is
	 of the expected size before recreating and slam FFICallbackMemory in if the specialObjectsArray
	 is already large enough."

	| index |
	self ~~ FFICallbackMemory ifTrue: [^self].

	index := 53.
	((Smalltalk includesKey: #VMObjectIndices)
	 and: [((Smalltalk at: #VMObjectIndices) classPool at: #ClassAlien ifAbsent: []) ~= (index - 1)]) ifTrue:
		[self error: 'index probably wrong'].

	Smalltalk specialObjectsArray size < index ifTrue:
		[Smalltalk recreateSpecialObjectsArray].
	
	Smalltalk specialObjectsArray size < index ifTrue: 
		[self error: 'SystemDictionary>>recreateSpecialObjectsArray appears incompatible'].
	
	((Smalltalk specialObjectsArray at: index) ~~ nil
		and: [(Smalltalk specialObjectsArray at: index) ~~ self]) ifTrue:
			[self error: 'Alien is already installed. You should not load FFI-Callbacks, too.'].

	(Smalltalk specialObjectsArray at: index) ifNil:
		[Smalltalk specialObjectsArray at: index put: self]
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> fromInteger: anInteger [
	"Like the extension in ExternalAddress, but duplicate byte size to follow the alien format as expected in the IA32ABI plugin."

	^ self new
		addressFieldPut: anInteger;
		yourself	
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> initialize [

	self ensureInSpecialObjectsArray.
	Smalltalk addToStartUpList: self after: FFIPlatformDescription.
	LifoCallbackSemaphore := Semaphore new.

	AccessProtect := Semaphore forMutualExclusion.
	"AllocatedThunks := AlienWeakTable newForOwner: self."
	ExecutablePages := Set new.
]

{
	#category : #callbacks,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> invokeCallbackContext: vmCallbackContextAddress [ "<Integer>" "^<FFICallbackReturnValue>"
	"The low-level entry-point for callbacks sent from the VM/IA32ABI plugin.
	 Evaluate the callback corresponding to the thunk referenced by vmCallbackContextAddress,
	 a pointer to a FFICallbackContext, set up by the VM's thunkEntry
	 routine.  Return to C via primSignal:andReturnAs:fromContext:.  thisContext's sender is the
	 call-out context."
	| callbackContext typeCode helper |
	callbackContext := FFICallbackContext fromHandle: vmCallbackContextAddress.
	helper := self fromInteger: vmCallbackContextAddress.
	
	[typeCode := FFICallback evaluateCallbackForContext: callbackContext]
		ifCurtailed: [self error: 'attempt to non-local return across a callback'].
	typeCode ifNil:
		[typeCode := callbackContext errorResult].
	"Now attempt to return to C.  The primitive will answer false if this is not the most recent Callback,
	 in which case we should wait on the lifoCallbackSemaphore which will be signalled when the most
	 recent callback successfully returns.  If this is the most recent callback the primitive will signal all
	 the processes waiting on the lifoCallbackSemaphore, one of which will be the next most recent.
	 Hence all nested callbacks will end up returning in the right order."
	[helper primSignal: LifoCallbackSemaphore andReturnAs: typeCode fromContext: thisContext] whileFalse:
		[LifoCallbackSemaphore wait]
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> new [
	"Only used for holding (alien) pointers."
	
	^ super new: ExternalAddress wordSize * 2
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> new: n [
	
	self shouldNotImplement.
]

{
	#category : #'system startup',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> startUp: resuming [
	"Any thunks in the finalization registry at the time the image comes up in a new session MUST NOT be finalized and should  immediately be discarded. Their thunk pointers are no longer valid."
	resuming ifTrue:
		["AllocatedThunks removeAll."
		ExecutablePages := Set new]
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory class >> unload [

	Smalltalk removeFromStartUpList: self.
]

{
	#category : #'alien compatibility',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> addressField [ "^<Integer>"
	<primitive: 'primAddressField' module: 'IA32ABI' error: errorCode>
	
	^ (ExternalData fromHandle: self type: ExternalType uintptr_t)
		at: ExternalData wordSize + 1
]

{
	#category : #'alien compatibility',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> addressFieldPut: value [ "<Integer> ^<Integer>"
	<primitive: 'primAddressFieldPut' module: 'IA32ABI' error: errorCode>

	self notify: 'Primitive failed. Proceed to use fallback code.'.	
	^ (ExternalData fromHandle: self type: ExternalType uintptr_t)
		at: ExternalData wordSize + 1
		put: value
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> byteSize [
	"Answer the number of bytes that are allocated when following the #externalPointer."
	^ self sizeField abs
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> externalPointer [
	"Answer the address that points to allocated memory of #byteSize num bytes."
	^ ExternalAddress fromInteger: self addressField
]

{
	#category : #accessing,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> externalPointer: anExternalAddress [

	| type integer |
	self flag: #debugging.
	type := ExternalType uintptr_t.
	integer := type
		handle: anExternalAddress asByteArrayPointer
		at: 1.
		
	self addressFieldPut: integer.
]

{
	#category : #callbacks,
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> primSignal: aSemaphore "<Semaphore>" andReturnAs: typeCode "<SmallInteger>" fromContext: context [ "<MethodContext>"
	<primitive: 'primReturnAsFromContextThrough' module: 'IA32ABI' error: ec>
	^ self primitiveFailed
]

{
	#category : #'alien compatibility',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> sizeField [ "^<Integer>"
	<primitive: 'primSizeField' module: 'IA32ABI' error: errorCode>

	"For some reason, the size is stored as intptr_t, not uintpr_t."
	^ (ExternalData fromHandle: self type: ExternalType intptr_t)
		at: 1
]

{
	#category : #'alien compatibility',
	#timestamp : 'stlu 11/13/2020 18:20'
}
FFICallbackMemory >> sizeFieldPut: size [ "<Integer> ^<Integer>"
	<primitive: 'primSizeFieldPut' module: 'IA32ABI' error: errorCode>

	self notify: 'Primitive failed. Proceed to use fallback code.'.	

	"For some reason, the size is stored as intptr_t, not uintpr_t."
	^ (ExternalData fromHandle: self type: ExternalType intptr_t)
		at: 1 put: size
]
