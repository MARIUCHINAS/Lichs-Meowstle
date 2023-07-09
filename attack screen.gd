extends Node2D

var matrix_size=7
var spacing=2.9
var backindent=Vector2(-1,-1)*matrix_size*spacing*.5

# Called when the node enters the scene tree for the first time.
func _ready():
	create_screen([[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1],#4
			[1,0,0,0,0,0,1],
			[1,0,0,0,0,0,1]])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_screen(matrix):
	print(backindent)
	for i in get_children():
		i.queue_free()
	for x in range(matrix_size):
		for y in range(matrix_size):
			var curr=ColorRect.new()
			curr.position=Vector2(x,y)*spacing+backindent
			curr.size=Vector2(1,1)*spacing
			if matrix[y][x]==1:
				curr.color=Color8(255,255,255,255)
			else:
				curr.color=Color8(0,0,0,255)
			curr.z_index-=1
			add_child(curr)
