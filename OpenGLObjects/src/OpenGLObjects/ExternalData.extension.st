Extension { #name : #ExternalData }

{
	#category : #'*OpenGLObjects',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
ExternalData class >> allocate: aNumber type: aType do: aBlock [

	| addr |
	addr := ExternalAddress allocate: aNumber.
	^ [aBlock value: (ExternalData
		fromHandle: addr
		type: aType)] ensure: [addr free].
]
