extends Node

var game_started = false

@export var ScareZoneScene: PackedScene
@export var BoulderAreaScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _enter_tree():
	$Player.position = $PlayerStartPositionMarker2D.position

func _input(event):
	if game_started:
		if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
			var mouse_position = get_viewport().get_mouse_position()
			var ScareZoneSpawnLocation = mouse_position
			var ScareZone = ScareZoneScene.instantiate()
			get_tree().get_root().add_child(ScareZone)
			ScareZone.position = ScareZoneSpawnLocation
			
		if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT):
			var mouse_position = get_viewport().get_mouse_position()
			var BoulderSpawnLocation = mouse_position
			var BoulderArea = BoulderAreaScene.instantiate()
			get_tree().get_root().add_child(BoulderArea)
			BoulderArea.position = BoulderSpawnLocation
			$Enemy.position = BoulderArea.position
			emit_signal("BoulderSpawn")
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_start_game():
	game_started = true
