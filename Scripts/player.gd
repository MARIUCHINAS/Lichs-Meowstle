extends Area2D

signal BoulderSpawn

var Boulder = preload("res://Scenes/boulder.tscn")

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT):
		var mouse_position = get_viewport().get_mouse_position()
		var BoulderSpawnLocation = mouse_position
		var BoulderArea = Boulder.instantiate()
		get_tree().get_root().add_child(BoulderArea)
		BoulderArea.position = BoulderSpawnLocation
		emit_signal("BoulderSpawn")
