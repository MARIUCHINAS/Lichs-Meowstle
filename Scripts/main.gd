extends Node

var game_started = false

@export var ScareZoneScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _enter_tree():
	$Enemy.position = $EnemyStartPositionMarker2D.position

func _input(event):
	if game_started:
		if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
			var mouse_position = get_viewport().get_mouse_position()
			var ScareZoneSpawnLocation = mouse_position
			var ScareZone = ScareZoneScene.instantiate()
			get_tree().get_root().add_child(ScareZone)
			ScareZone.position = ScareZoneSpawnLocation
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	game_started = true
