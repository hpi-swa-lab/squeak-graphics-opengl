Extension { #name : #Color }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
Color >> asVectorColor [
	"Convert the receiver into a color"
	^VectorColor new loadFrom: self
]
