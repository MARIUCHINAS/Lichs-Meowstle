extends Node
var finished=false

func _enter_tree():
	$AnimationPlayer.current_animation = "Cutscene"
	$AnimationPlayer.play("Cutscene")


func _on_animation_player_animation_finished(anim_name):
	finished=true
