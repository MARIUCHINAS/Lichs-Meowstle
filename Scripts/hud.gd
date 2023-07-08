extends CanvasLayer

signal start_game

var health = 100

func _ready():
	pass
	
	
func _process(delta):
	$HealthLabel/HealthLabel.text = str(health)
	pass
	
	
func hide_stuff():
	# This hides every HUD element execpt $PlayButtonAudioStreamPlayer
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			i.hide()
			
func show_stuff():
	$HealthLabel.show()

func _on_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	hide_stuff()
	emit_signal("start_game")
