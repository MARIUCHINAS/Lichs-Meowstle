extends Area2D

signal ScareZoneActivated

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "enemy":
		emit_signal("ScareZoneActivated")


func _on_self_destruct_timer_timeout():
	queue_free()
