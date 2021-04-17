"
Simple Catmull-Rom spline object. Simply seed it with four vectors of any dimensionality, then ask for the interpolated value with CatmullRom>>at:t where t is a value between 0.0 and 1.0.
"
Class {
	#name : #CatmullRom,
	#superclass : #Object,
	#instVars : [
		'p1',
		'p2',
		'p3',
		'p4'
	],
	#category : #'3DTransform-Vectors',
	#commentStamp : ''
}

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
CatmullRom class >> test [
	
	| points pen cr |
"This generates a nice shape on the screen. "
	points := {0@0. 0@100. 100@100. 100@200. 200@200. 200@300. 300@300. 300@200. 400@200. 400@100. 500@100. 500@0.}.
	pen := Pen new.
	pen defaultNib:2.
	pen color: Color red.
	pen combinationRule: Form over.
	pen up.
	pen goto:0@100.
	pen down.
	1 to: points size - 3 do:[:i |
		cr := CatmullRom varray: (points copyFrom:i to: i+3) .
		1 to:10 do:[ :j | pen goto: (cr at: j/10.0)].
	].
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
CatmullRom class >> v1: v1 v2: v2 v3: v3 v4:v4 [

	^ self new v1:v1 v2:v2 v3: v3 v4:v4.
]

{
	#category : #'instance creation',
	#timestamp : 'stlu 11/13/2020 18:20'
}
CatmullRom class >> varray: varray [

	^ self new v1:(varray at:1) v2:(varray at:2) v3: (varray at:3) v4:(varray at:4).
]

{
	#category : #compute,
	#timestamp : 'stlu 11/13/2020 18:20'
}
CatmullRom >> at: t [

	| t2 t3 |
	t2 := t*t.
	t3 := t2 *t.
	^ p1 + (p2 * t) + (p3 *t2) + (p4 * t3).
]

{
	#category : #initialize,
	#timestamp : 'stlu 11/13/2020 18:20'
}
CatmullRom >> v1: v1 v2:v2 v3:v3 v4:v4 [

	p1 := v2.
	p2 := v3 - v1 * 0.5.
	p3 :=  (2*v1) - (5*v2) + (4*v3) - v4 * 0.5.
	p4 :=  v1 negated + (3*v2) - (3*v3) + v4 * 0.5. 
]
