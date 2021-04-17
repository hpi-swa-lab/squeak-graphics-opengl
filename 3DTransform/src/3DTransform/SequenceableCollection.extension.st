Extension { #name : #SequenceableCollection }

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 11/13/2020 18:20'
}
SequenceableCollection >> asVectorColor [
	
	^ VectorColor new copyFrom: self.
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/25/2021 17:50'
}
SequenceableCollection >> dot: aCollection [
	"Return the dot product of the receiver and the argument."
	| result |
	self isOfSameSizeCheck: aCollection.
	result := 0.
	1 to: self size do: [:i |
		result := result + ((self at: i) * (aCollection at: i))].
	^ result
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 12:51'
}
SequenceableCollection >> doubleAt: anIndex [

	^ self at: anIndex
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 12:51'
}
SequenceableCollection >> doubleAt: anIndex put: anObject [

	^ self at: anIndex put: anObject
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/18/2021 22:07'
}
SequenceableCollection >> floatAt: anIndex [

	^ self at: anIndex
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/18/2021 22:08'
}
SequenceableCollection >> floatAt: anIndex put: anObject [

	^ self at: anIndex put: anObject
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/19/2021 14:42'
}
SequenceableCollection >> matrix4x4View [

	^ self matrix4x4ViewAt: 1
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/19/2021 14:42'
}
SequenceableCollection >> matrix4x4ViewAt: start [

	^ self matrixViewAt: start columns: 4 rows: 4
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/19/2021 14:44'
}
SequenceableCollection >> matrixViewAt: start columns: numColumns rows: numRows [

	^ MatrixView
		store: self
		start: start
		numColumns: numColumns
		numRows: numRows
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:42'
}
SequenceableCollection >> signedLongAt: anIndex [

	^ self at: anIndex
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:43'
}
SequenceableCollection >> signedLongAt: anIndex put: anObject [

	^ self at: anIndex put: anObject
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:42'
}
SequenceableCollection >> unsignedLongAt: anIndex [

	^ self at: anIndex
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/22/2021 13:43'
}
SequenceableCollection >> unsignedLongAt: anIndex put: anObject [

	^ self at: anIndex put: anObject
]

{
	#category : #'*3DTransform',
	#timestamp : 'stlu 1/19/2021 14:35'
}
SequenceableCollection >> vectorViewAt: start size: vectorSize [

	^ FloatVectorView
		store: self
		size: vectorSize
		start: start
		stride: 1
]
