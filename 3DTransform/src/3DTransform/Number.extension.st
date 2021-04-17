Extension { #name : #Number }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:54'
}
Number >> exp2 [

	^ 2 raisedTo: self
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:54'
}
Number >> inverseSqrt [

	^ self sqrt reciprocal
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 15:58'
}
Number >> mix: other alpha: alpha [
	"Returns a linear blend of the receiver and other."
	^ self asFloat * (1.0 - alpha) + (alpha * other)
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:51'
}
Number >> roundEven [

	^ self roundTo: 2
]
