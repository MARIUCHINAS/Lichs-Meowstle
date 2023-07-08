extends StaticBody2D

signal BoulderDespawned
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _enter_tree():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_self_desctruct_timer_timeout():
	emit_signal("BoulderDespawned")
	queue_free()
