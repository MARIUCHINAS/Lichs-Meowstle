extends CanvasLayer

signal start_game

var health = 100

func _ready():
	pass
	
	
func _process(delta):
	if health <= 0:
		print("You lost. But the end screen still does not exist")
	
	
func hide_stuff():
	# This hides every HUD element execpt $PlayButtonAudioStreamPlayer
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			i.hide()
			
func show_stuff():
	pass

func _on_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	hide_stuff()
	show_stuff()
	emit_signal("start_game")


func _on_credits_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	$CreditsColorRect.show()
	$CreditsColorRect/AnimationPlayer.current_animation = "Main"


func _on_back_from_credits_button_button_up():
	$CreditsColorRect.hide()
