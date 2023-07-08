extends CanvasLayer

signal start_game

func _ready():
	pass
	
	
func _process(delta):
	pass

func hide_stuff():
	# This hides every HUD element execpt $PlayButtonAudioStreamPlayer
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			i.hide()

func _on_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	hide_stuff()
	emit_signal("start_game")
