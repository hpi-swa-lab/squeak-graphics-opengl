Extension { #name : #Color }

{
	#category : #'*3DTransform',
	#'squeak_changestamp' : 'stlu 11/13/2020 18:20'
}
Color >> asVectorColor [
	"Convert the receiver into a color"
	^VectorColor new loadFrom: self
]
