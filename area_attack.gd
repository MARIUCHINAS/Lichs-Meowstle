extends Node2D

var matrix=[
			[[0,0,1,1,1,0,0],
			[0,1,0,0,0,1,0],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[0,1,0,0,0,1,0],#0
			[0,0,1,1,1,0,0]],

			[[0,0,0,0,0,0,0],
			[0,0,1,0,0,0,0],
			[0,0,1,1,1,1,0],
			[0,0,1,1,1,0,0],
			[0,1,1,1,1,0,0],
			[0,0,0,0,1,0,0],#1
			[0,0,0,0,0,0,0]],
			
			[[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[1,1,1,1,1,1,1],#2
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0],
			[0,0,0,1,0,0,0]],
			
			[[1,1,1,1,1,1,1],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0],#3
			[1,1,1,1,1,1,1]],
			
			[[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],#4
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1]],
			
			[[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],#5
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1],
			[1,1,1,1,1,1,1]]
			]
var matrix_size=7
var explosion=load("res://explosion.tscn")
var spacing=60
var inert=false

func _ready():
	$Timer.start()




func _on_timer_timeout():
	for x in range(matrix_size):
		for y in range(matrix_size):
			if matrix[5][y][x]==1:
				var current=explosion.instantiate()
				current.position=(Vector2(x,y)-Vector2(1,1)*matrix_size*.5+Vector2(0.5,.5))*spacing
				add_child(current)
	var heropos=get_tree().get_root().get_node("Main").get_node("Enemy").position
	var health=get_tree().get_root().get_node("Main").health
	var distance=(position-heropos).length()
	var healthmod=(100-health)*.01+1
	var distancemod=50000/(distance*distance)
	if distancemod>=5:distancemod=5
	var mod =distancemod*healthmod-2
	print(mod)
	get_tree().get_root().get_node("Main").energy+=mod
