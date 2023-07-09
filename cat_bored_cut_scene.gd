extends Node

func _enter_tree():
	$AnimationPlayer.current_animation = "Cutscene"
	$AnimationPlayer.play("Cutscene")
