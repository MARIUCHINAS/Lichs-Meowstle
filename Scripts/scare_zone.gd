extends Area2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_self_destruct_timer_timeout():
	queue_free()


func _on_body_entered(body):
	print(body)
	print(body.name)
	if body.name == "Enemy":
		body._on_enter_scare_zone()
