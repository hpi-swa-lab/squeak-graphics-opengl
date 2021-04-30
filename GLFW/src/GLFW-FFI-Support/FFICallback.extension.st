Extension { #name : #FFICallback }

{
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 4/30/2021 14:22'
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
	#category : #'*GLFW-FFI-Support-override',
	#'squeak_changestamp' : 'stlu 4/30/2021 14:23'
}
FFICallback >> evaluateDynamic_X64: callbackContext [
	"Set handle to access arguments as most appropriate for the ABI. For ''RISCs'' it is the pointer to the integer register."
	<abi: 'X64'> <evaluator>
	
	^ self evaluateDynamic: callbackContext
]
