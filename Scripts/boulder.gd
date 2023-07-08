extends StaticBody2D

signal BoulderDespawned

func _ready():
	pass
	
func _enter_tree():
	pass


func _process(delta):
	pass


func _on_self_desctruct_timer_timeout():
	emit_signal("BoulderDespawned")
	queue_free() # Frees itself from the memory in other words it disappears
