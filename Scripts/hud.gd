extends CanvasLayer

signal start_game

var health = 100

func _ready():
	$MusicIdleAudioStreamPlayer.play()
	
	
func _process(delta):
	if health <= 0:
		print("You lost. But the end screen still does not exist")
	
	
func hide_stuff():
	# This hides every HUD element execpt $PlayButtonAudioStreamPlayer
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			if i != $MusicActionAudioStreamPlayer2D:
				if i != $MusicIdleAudioStreamPlayer:
					i.hide()
			
func show_stuff():
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			if i != $CreditsColorRect:
				if i != $PlayButtonAudioStreamPlayer:
					if i != $MusicActionAudioStreamPlayer2D:
						if i != $MusicIdleAudioStreamPlayer:
							i.show()

func _on_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	$MusicIdleAudioStreamPlayer.stop()
	$MusicActionAudioStreamPlayer2D.play()
	hide_stuff()
	emit_signal("start_game")


func _on_credits_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	$CreditsColorRect.show()
	$CreditsColorRect/AnimationPlayer.current_animation = "Main"
	$letter.hide()


func _on_back_from_credits_button_button_up():
	$CreditsColorRect/AnimationPlayer.current_animation = "[stop]"
	$CreditsColorRect.hide()
	$letter.show()


func _on_intro_button_button_up():
	get_parent().cutscene=load("res://cutscene.tscn").instantiate()
	get_parent().cutscene.play()
	hide_stuff()
	get_parent().hide_field()
