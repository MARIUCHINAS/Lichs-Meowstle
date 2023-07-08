extends Node2D

var matrix=[[0,0,1,1,1,0,0],
			[0,1,0,0,0,1,0],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[0,1,0,0,0,1,0],
			[0,0,1,1,1,0,0]]

var matrix1=[[0,0,0,0,0,0,0],
			[0,0,1,0,0,0,0],
			[0,0,1,1,1,1,0],
			[0,0,1,1,1,0,0],
			[0,1,1,1,1,0,0],
			[0,0,0,0,1,0,0],
			[0,0,0,0,0,0,0]]
var matrix_size=7
var explosion=load("res://explosion.tscn")
var spacing=60

func _ready():
	for x in range(matrix_size):
		for y in range(matrix_size):
			if matrix[y][x]==1:
				var current=explosion.instantiate()
				current.position=(Vector2(x,y)-Vector2(1,1)*matrix_size*.5+Vector2(0.5,.5))*spacing
				add_child(current)

