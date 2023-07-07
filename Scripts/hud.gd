extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hide_stuff():
	for i in get_children():
		if i != $PlayButtonAudioStreamPlayer:
			i.hide()

func _on_button_button_up():
	$PlayButtonAudioStreamPlayer.play()
	hide_stuff()
	emit_signal("start_game")
