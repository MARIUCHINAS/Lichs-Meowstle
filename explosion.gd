extends AnimatedSprite2D

func _ready():
	play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if frame==5:
		queue_free()


func _on_area_2d_body_entered(body):
	get_tree().get_root().get_node("Main").health -= 5
