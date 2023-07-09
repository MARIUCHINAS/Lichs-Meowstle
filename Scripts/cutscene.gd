extends Node
var finished=false

func _ready():play()
func play():
	#print("JJJKJLJL;MB")
	$AnimationPlayer.current_animation = "Cutscene"
	$AnimationPlayer.play("Cutscene")


func _on_animation_player_animation_finished(anim_name):
	#print("JJJ")
	finished=true
