Class {
	#name : #LOGLBreakoutLevel,
	#superclass : #Object,
	#instVars : [
		'data',
		'extent',
		'bricks'
	],
	#classVars : [
		'Levels'
	],
	#category : #'LearnOpenGL-Breakout',
	#commentStamp : ''
}

{
	#category : #levels,
	#timestamp : 'stlu 1/7/2021 14:33'
}
LOGLBreakoutLevel class >> four [

	^ #(13 6
1 2 1 2 1 2 1 2 1 2 1 2 1
2 2 2 2 2 2 2 2 2 2 2 2 2
2 1 3 1 4 1 5 1 4 1 3 1 2
2 3 3 4 4 5 5 5 4 4 3 3 2
2 1 3 1 4 1 5 1 4 1 3 1 2
2 2 3 3 4 4 5 4 4 3 3 2 2)
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/7/2021 15:52'
}
LOGLBreakoutLevel class >> fromArray: anArray extent: levelExtent [

	^ self new
		initializeFrom: anArray extent: levelExtent;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 1/7/2021 15:53'
}
LOGLBreakoutLevel class >> fromString: aString extent: levelExtent [

	| array |
	array := Array streamContents: [:stream |
				 aString findTokens: Character separators do: [:token |
					stream nextPut: token asNumber]].
	^ self fromArray: aString extent: levelExtent
]

{
	#category : #'class initialization',
	#timestamp : 'stlu 1/7/2021 14:33'
}
LOGLBreakoutLevel class >> initialize [

	Levels := OrderedCollection new.
	Levels
		add: self one;
		add: self two;
		add: self three;
		add: self four
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 16:06'
}
LOGLBreakoutLevel class >> levels [

	^ Levels
]

{
	#category : #levels,
	#timestamp : 'stlu 1/7/2021 14:32'
}
LOGLBreakoutLevel class >> one [

	^ #(15 8
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
5 5 5 5 5 5 5 5 5 5 5 5 5 5 5
4 4 4 4 4 0 0 0 0 0 4 4 4 4 4
4 1 4 1 4 0 0 1 0 0 4 1 4 1 4
3 3 3 3 3 0 0 0 0 0 3 3 3 3 3
3 3 1 3 3 3 3 3 3 3 3 3 1 3 3
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2)
]

{
	#category : #levels,
	#timestamp : 'stlu 1/7/2021 14:33'
}
LOGLBreakoutLevel class >> three [

	^ #(13 9
0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 2 0 0 0 0 0 0 0 2 0 0
0 0 0 2 0 0 0 0 0 2 0 0 0
0 0 0 5 5 5 5 5 5 5 0 0 0
0 0 5 5 0 5 5 5 0 5 5 0 0
0 5 5 5 5 5 5 5 5 5 5 5 0
0 3 0 1 1 1 1 1 1 1 0 3 0
0 3 0 3 0 0 0 0 0 3 0 3 0
0 0 0 0 4 4 0 4 4 0 0 0 0)
]

{
	#category : #levels,
	#timestamp : 'stlu 1/7/2021 14:32'
}
LOGLBreakoutLevel class >> two [

	^ #(15 8
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 0 5 5 0 5 5 0 5 5 0 5 5 0 1
1 5 5 5 5 5 5 5 5 5 5 5 5 5 1
1 0 3 3 0 3 3 0 3 3 0 3 3 0 1
1 3 3 3 3 3 3 3 3 3 3 3 3 3 1
1 0 2 2 0 2 2 0 2 2 0 2 2 0 1
1 2 2 2 2 2 2 2 2 2 2 2 2 2 1
1 0 1 1 0 1 1 0 1 1 0 1 1 0 1)
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 14:07'
}
LOGLBreakoutLevel >> bricks [

	^ bricks
]

{
	#category : #accessing,
	#timestamp : 'stlu 1/7/2021 14:07'
}
LOGLBreakoutLevel >> bricks: anObject [

	bricks := anObject
]

{
	#category : #rendering,
	#timestamp : 'stlu 1/7/2021 15:51'
}
LOGLBreakoutLevel >> draw: aRenderer [

	bricks do: [:brick |
		brick isDestroyed not ifTrue: [
			brick draw: aRenderer]]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 11:59'
}
LOGLBreakoutLevel >> initializeFrom: anArray extent: levelExtent [

	| dataOffset width height unitExtent resources |
	width := anArray first.
	height := anArray second.
	dataOffset := 2.
	self assert: anArray size = (width * height + dataOffset).
	unitExtent := levelExtent / (width @ height).
	extent := levelExtent.
	data := anArray.
	bricks := OrderedCollection new: anArray size - dataOffset.
	resources := LOGLBreakoutResourceManager instance.
	
	1 to: height do: [:y |
		1 to: width do: [:x |
			| num dataIndex blockType position color sprite isSolid object |
			position := ((x - 1) @ (y - 1)) * unitExtent.
			num := (y - 1 * width) + x.
			dataIndex := dataOffset + num.
			blockType := anArray at: dataIndex.
			blockType = 1 ifTrue: [
				isSolid := true.
				sprite := resources getTexture: 'block_solid'.
				color := Color r: 0.8 g: 0.8 b: 0.7].
			blockType > 1 ifTrue: [
				isSolid := false.
				sprite := resources getTexture: 'block'.
				color := blockType caseOf: {
						[2] -> [Color r: 0.2 g: 0.6 b: 1.0].
						[3] -> [Color r: 0.0 g: 0.7 b: 0.0].
						[4] -> [Color r: 0.8 g: 0.8 b: 0.4].
						[5] -> [Color r: 1.0 g: 0.5 b: 0.0].
					} otherwise: [Color white]].
			blockType > 0 ifTrue: [
				object := LOGLBreakoutGameObject
							position: position
							extent: unitExtent
							sprite: sprite
							color: color.
				object isSolid: isSolid.
				bricks add: object]]]
]

{
	#category : #testing,
	#timestamp : 'stlu 1/7/2021 15:50'
}
LOGLBreakoutLevel >> isCompleted [

	^ bricks noneSatisfy: [:brick |
		brick isSolid and: [brick isDestroyed not]]
]

{
	#category : #initialization,
	#timestamp : 'stlu 1/8/2021 12:00'
}
LOGLBreakoutLevel >> reset [

	self initializeFrom: data extent: extent
]
