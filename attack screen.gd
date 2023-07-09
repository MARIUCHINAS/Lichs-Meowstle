extends Node2D

var matrix_size=7
var spacing=10

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
	print("jhh")
	for i in get_children():
		i.queue_free()
	for x in range(matrix_size):
		for y in range(matrix_size):
			var curr=ColorRect.new()
			curr.position=Vector2(x,y)*spacing
			curr.size=Vector2(1,1)*spacing
			if matrix[x][y]==1:
				curr.color=Color8(255,255,255,255)
			else:
				curr.color=Color8(0,0,0,255)
			add_child(curr)
