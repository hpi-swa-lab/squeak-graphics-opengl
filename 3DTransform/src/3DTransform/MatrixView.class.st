Class {
	#name : #MatrixView,
	#superclass : #ArrayedCollection,
	#instVars : [
		'rows',
		'columns',
		'isColumnMajor'
	],
	#category : #'3DTransform-Views',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/19/2021 14:01'
}
MatrixView class >> columns: aVectorArray [

	^ self basicNew
		initializeWithColumns: aVectorArray
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 14:02'
}
MatrixView class >> defaultColumnMajor [

	^ true
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/19/2021 14:03'
}
MatrixView class >> numColumns: numColumns numRows: numRows [

	^ self
		numColumns: numColumns
		numRows: numRows
		columnMajor: self defaultColumnMajor
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/19/2021 14:48'
}
MatrixView class >> numColumns: numColumns numRows: numRows columnMajor: isColumnMajor [

	^ self
		store: (Array new: numColumns * numRows)
		start: 1
		numColumns: numColumns
		numRows: numRows
		columnMajor: isColumnMajor
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/19/2021 14:02'
}
MatrixView class >> rows: aVectorArray [

	^ self basicNew
		initializeWithRows: aVectorArray
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/19/2021 14:44'
}
MatrixView class >> store: aCollection start: startIndex numColumns: numColumns numRows: numRows [

	^ self
		store: aCollection
		start: startIndex
		numColumns: numColumns
		numRows: numRows
		columnMajor: self defaultColumnMajor
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 3/19/2021 15:34'
}
MatrixView class >> store: aCollection start: startIndex numColumns: numColumns numRows: numRows columnMajor: isColumnMajor [

	| vec vecArray |
	vec := FloatVectorView
			store: aCollection
			size: (isColumnMajor ifTrue: [numRows] ifFalse: [numColumns])
			start: startIndex
			stride: 1.
	vecArray := SmallVectorArrayView
				startVector: vec
				size: (isColumnMajor ifTrue: [numColumns] ifFalse: [numRows])
				stride: vec stride * vec size.
	^ isColumnMajor
		ifTrue: [self columns: vecArray]
		ifFalse: [self rows: vecArray]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/19/2021 12:35'
}
MatrixView >> * anObject [

	anObject isMatrix ifTrue: [^ self privateMultiplyMatrix: anObject].
	anObject isVector ifTrue: [^ self privateMultiplyVector: anObject].
	anObject isNumber ifTrue: [^ self privateMultiplyNumber: anObject].
	self error: 'Not supported'
]

{
	#category : #'accessing - components',
	#timestamp : 'stlu 1/19/2021 14:25'
}
MatrixView >> a11 [

	^ self at: 1 at: 1
]

{
	#category : #'accessing - components',
	#timestamp : 'stlu 1/19/2021 14:26'
}
MatrixView >> a34 [

	^ self at: 3 at: 4
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:25'
}
MatrixView >> at: index [

	self assert: (index between: 1 and: self size).
	self isColumnMajor
		ifTrue: [
			^ self
				atColumn: index - 1 // self numRows + 1
				atRow: index - 1 \\ self numColumns + 1]
		ifFalse: [
			^ self
				atColumn: index - 1 \\ self numRows + 1
				atRow: index - 1 // self numColumns + 1]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:24'
}
MatrixView >> at: firstIndex at: secondIndex [

	self isColumnMajor
		ifTrue: [^ self atColumn: firstIndex atRow: secondIndex]
		ifFalse: [^ self atColumn: secondIndex atRow: firstIndex]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:24'
}
MatrixView >> at: firstIndex at: secondIndex put: value [

	self isColumnMajor
		ifTrue: [^ self atColumn: firstIndex atRow: secondIndex put: value]
		ifFalse: [^ self atColumn: secondIndex atRow: firstIndex put: value]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:22'
}
MatrixView >> at: index put: value [

	self assert: (index between: 1 and: (self numColumns * self numRows)).
	self isColumnMajor
		ifTrue: [
			^ self
				atColumn: index - 1 // self numRows + 1
				atRow: index - 1 \\ self numColumns + 1
				put: value]
		ifFalse: [
			^ self
				atColumn: index - 1 \\ self numRows + 1
				atRow: index - 1 // self numColumns + 1
				put: value]
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 12:59'
}
MatrixView >> atColumn: column atRow: row [

	^ (columns at: column) at: row
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 12:59'
}
MatrixView >> atColumn: column atRow: row put: value [

	^ (columns at: column) at: row put: value
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:53'
}
MatrixView >> columns [

	^ columns
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/19/2021 10:38'
}
MatrixView >> columnsDo: aBlock [

	columns do: aBlock
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:26'
}
MatrixView >> dimensions [

	self isColumnMajor
		ifTrue: [^ self numColumns @ self numRows]
		ifFalse: [^ self numRows @ self numColumns]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/19/2021 13:52'
}
MatrixView >> initializeWithColumns: aVectorArray [

	isColumnMajor := true.
	columns := aVectorArray.
	rows := aVectorArray transposed
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/19/2021 13:43'
}
MatrixView >> initializeWithRows: aVectorArray [

	isColumnMajor := false.
	rows := aVectorArray.
	columns := aVectorArray transposed
]

{
	#category : #testing,
	#timestamp : 'stlu 1/19/2021 13:53'
}
MatrixView >> isColumnMajor [

	^ isColumnMajor
]

{
	#category : #testing,
	#timestamp : 'stlu 1/19/2021 13:06'
}
MatrixView >> isMatrix [

	^ true
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:35'
}
MatrixView >> numColumns [

	^ columns size
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:35'
}
MatrixView >> numRows [

	^ rows size
]

{
	#category : #printing,
	#timestamp : 'stlu 3/19/2021 15:26'
}
MatrixView >> printOn: aStream [

	rows
		do: [:row |
			row
				do: [:each | aStream print: each]
				separatedBy: [aStream space]]
		separatedBy: [aStream cr]
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/19/2021 14:07'
}
MatrixView >> privateMultiplyMatrix: aMatrix [

	| result |
	self assert: self numColumns = aMatrix numRows.
	"self assert: self class = aMatrix class."
	result := self class numColumns: aMatrix numColumns numRows: self numRows.
	rows withIndexDo: [:row :y |
		aMatrix columns withIndexDo: [:column :x |
			result atColumn: x atRow: y put: (row dot: column)]].
	^ result
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 1/19/2021 12:34'
}
MatrixView >> privateMultiplyNumber: aNumber [

	self notYetImplemented
]

{
	#category : #arithmetic,
	#timestamp : 'stlu 3/19/2021 14:54'
}
MatrixView >> privateMultiplyVector: aVector [

	| result |
	self assert: aVector size = self numRows.
	result := aVector species new: aVector size.
	rows withIndexDo: [:row :i |
		result at: i put: (aVector dot: row)].
	^ result
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:53'
}
MatrixView >> rows [

	^ rows
]

{
	#category : #enumerating,
	#timestamp : 'stlu 1/19/2021 10:37'
}
MatrixView >> rowsDo: aBlock [

	rows do: aBlock
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/19/2021 13:25'
}
MatrixView >> size [

	^ self numColumns * self numRows
]
