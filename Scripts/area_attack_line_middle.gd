extends Area2D

signal BodyEntered
signal BodyExited

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	

func _enter_tree():
	rotation_degrees = randi_range(0,360)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body)
	if body.name == "Enemy":
		body.Indanger(true)


func _on_body_exited(body):
	if body.name == "Enemy":
		body.Indanger(false)
