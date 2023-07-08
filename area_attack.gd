extends Node2D

var matrix=[[0,0,0,0,0,0,0],
			[1,1,1,1,1,1,1],
			[0,0,0,0,0,0,0],
			[1,1,1,1,1,1,1],
			[0,0,0,0,0,0,0],
			[0,0,0,0,1,0,0],
			[0,0,0,0,1,0,0]]
var matrix_size=7
var explosion=load("res://explosion.tscn")
var spacing=60
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(matrix_size):
		for y in range(matrix_size):
			if matrix[y][x]==1:
				var current=explosion.instantiate()
				current.position=Vector2(x,y)*spacing
				add_child(current)

